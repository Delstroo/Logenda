//
//  LaunchScreenViewController.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/1/22.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet var startButton: UIButton!
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Helper Functions
    func updateViews() {
        startButton.layer.cornerRadius = 15
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.borderWidth = 2
    }
    

}
