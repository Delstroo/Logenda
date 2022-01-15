//
//  PersonBioTableViewController.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/1/22.
//

import UIKit
import AVKit
import AVFoundation

class TopicSelectorTableViewController: UITableViewController {
    
    //MARK: - Landing Pads
    var topic: Topic?
    var videos: Video?

    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return topic?.videos.count ?? 00
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personBio", for: indexPath)

        let video = topic?.videos[indexPath.row]
        
        cell.textLabel?.text = video?.videoName
      //  playVideo()
        return cell
    }
//
//    private func playVideo() {
//        guard let path = Bundle.main.path(forResource: "\(videos.)", ofType:"m4v") else {
//            debugPrint("video.m4v not found")
//            return
//        }
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        let playerController = AVPlayerViewController()
//        playerController.player = player
//        present(playerController, animated: true) {
//            player.play()
//        }
//    }
}

