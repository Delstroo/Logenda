//
//  ContactViewController.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/3/22.
//

import UIKit

class ContactViewController: UIViewController {
    
    var video: Video?
    
    
    @IBOutlet var contactInfoLabel: UILabel!
    @IBOutlet var followUsLabel: UILabel!
    @IBOutlet var youtubeButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var instagramButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeButton.imageView?.contentMode = .scaleAspectFit
        contactInfoLabel.attributedText = underlineAttriString
        followUsLabel.attributedText = underlineAttriStrin
    }//End of func
    
    //MARK: - Actions
    
    @IBAction func facebookButtonTapped(_ sender: Any) {
        openUrl(urlString: "https://www.facebook.com/Mac-Travels-103402731093819")
    }
    
    @IBAction func instagramButtonTapped(_ sender: Any) {
        openUrl(urlString: "https://www.instagram.com/m.a.c.travels/")
    }
    
    @IBAction func youtubeButtonTapped(_ sender: Any) {
        openUrl(urlString: "https://www.youtube.com/watch?v=iik25wqIuFo")
    }
    
    //MARK: - Helper Functions
    
    let underlineAttriString = NSAttributedString(string: "Contact Info",
                                              attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
    let underlineAttriStrin = NSAttributedString(string: "Follow Us",
                                              attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
    
    
    func openUrl(urlString: String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }//End of func


}
