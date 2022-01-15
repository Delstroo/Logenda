//
//  LAUNCHViewController.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/5/22.
//

import UIKit

class LAUNCHViewController: UIViewController {
    
        private let imageView = UIImageView(image: #imageLiteral(resourceName: "ezDrive"))
        

        override func viewDidLoad() {
            super.viewDidLoad()
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            // get rid of the default constraints
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            // "drag out" new constraints
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
            self.animate()
        }
        
        private func animate() {
            // spend 1 second animating
            UIView.animate(withDuration: 1.50, animations: {
                
                // grow the imageview
                self.imageView.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
                
                // hide the imageview
                self.imageView.alpha = 0
                
            }, completion: { _ in
                
                // same as SceneDelegate, replace initial view controller with a new one
                UIApplication.shared.windows.first?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            })
        }//end of func
    }//End of class
