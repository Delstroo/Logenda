//
//  VideoViewController.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/2/22.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController {

    var playerLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "fight", ofType: "mp4")!))
        
        let layer = AVPlayerLayer(player:  player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(layer)
        
        player.play()
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }//End of func
    
    //MARK: - Helper Methods
    @objc func videoDidEnd() {
        NotificationCenter.default.removeObserver(self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        DispatchQueue.main.async {
            let vc = storyboard.instantiateViewController(identifier: "TopicSelection")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }

}//End of func
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        playerLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    
}//End of class
