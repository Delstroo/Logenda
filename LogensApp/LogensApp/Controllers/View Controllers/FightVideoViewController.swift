//
//  FightVideoViewController.swift
//  GroupAssesment
//
//  Created by Israel Romero on 9/13/21.
//

import UIKit
import AVKit
import AVFoundation

class FightVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "fight", ofType: "mp4") ?? "production ID_3750624.mp4"))
        
        let layer = AVPlayerLayer(player:  player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(layer)
        
        player.play()
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    //MARK: - Helper Methods
    @objc func videoDidEnd() {
        NotificationCenter.default.removeObserver(self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        DispatchQueue.main.async {
            let vc = storyboard.instantiateViewController(identifier: "ResultsVC")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }

}
