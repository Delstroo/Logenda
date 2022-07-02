//
//  VideoPlayViewController.swift
//  LogensApp
//
//  Created by Delstun McCray on 7/1/22.
//

import UIKit
import AVKit
import AVFoundation

class VideoPlayViewController: UIViewController {

    private var playerView: PlayerView = PlayerView()
    private var videoPlayer:VideoPlayer?
    var playerLayer = AVPlayerLayer()
    var topicVideo: Topic?
    var video: Video?
    var videos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()//(animated)
        view.addSubview(playerView)
        preparePlayer()
        NotificationCenter.default.addObserver(self, selector: #selector(self.videoDidEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        
        // set Constraints (if you do it purely in code)
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0).isActive = true
        playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0).isActive = true
        playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0).isActive = true
        playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8.0).isActive = true
    }

    private func preparePlayer() {
        if let path = Bundle.main.path(forResource: video?.videoDescription, ofType: "mp4") {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true) {
                video.play()
                NotificationCenter.default.addObserver(self, selector: #selector(self.videoDidEnd), name: .AVPlayerItemDidPlayToEndTime, object: videoPlayer.player!.currentItem)
            }
//            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: videoPlayer.player?.currentItem, queue: <#T##OperationQueue?#>, using: <#T##(Notification) -> Void#>)
        }
    }
    
        //MARK: - Helper Methods
        @objc func videoDidEnd() {
            NotificationCenter.default.removeObserver(self)

            dismiss(animated: true) {
                self.navigationController?.popViewController(animated: true)
            }
    
    }//End of func
    
        override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            playerLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        }
}
