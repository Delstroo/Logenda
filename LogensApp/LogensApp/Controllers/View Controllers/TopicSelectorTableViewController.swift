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
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return true
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
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "videoVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? VideoPlayViewController else { return }
            let topicToSend = topic?.videos[indexPath.row]
            destination.video = topicToSend
        }
    }
}

