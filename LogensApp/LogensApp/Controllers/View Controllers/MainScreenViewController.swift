//
//  MainScreenViewController.swift
//  LogensApp
//
//  Created by Delstun McCray on 1/1/22.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var searchBar = UISearchBar()
    var searchBarButtonItem: UIBarButtonItem?
    var logoImageView   : UIImageView!
    var topics: [Topic] = []
    var topicsSelection: [Topic] = []
    
    
    //MARK: - Outlets
    @IBOutlet var personTableViewController: UITableView!
    @IBOutlet var newestButton: UIButton!
    @IBOutlet var popularButton: UIButton!
    @IBOutlet var contactsButton: UIButton!
    @IBOutlet var exploreSearchTextField: UITextField!
    
    @IBOutlet var searchBarButton: UIBarButtonItem!
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personTableViewController.delegate = self
        personTableViewController.dataSource = self
        updateViews()
        self.navigationItem.setHidesBackButton(true, animated: true)

        let logoImage = UIImage(named: "ezDrive")!
           logoImageView = UIImageView(frame: CGRect(x: 0, y: -10, width: logoImage.size.width, height: logoImage.size.height))
           logoImageView.image = logoImage
        logoImageView.contentMode = .scaleAspectFit
           navigationItem.titleView = logoImageView

           searchBar.delegate = self
        searchBar.searchBarStyle = UISearchBar.Style.minimal
           searchBarButtonItem = navigationItem.rightBarButtonItem
        searchBar.showsCancelButton = true
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
    //MARK: - Actions

    @IBAction func searchButtonPressed(sender: AnyObject) {
        showSearchBar()
        searchBarButton.customView?.isHidden = true
      }
    //MARK: - Helper Functions
    
    func updateViews() {
        newestButton.layer.cornerRadius = 15
        popularButton.layer.cornerRadius = 15
        contactsButton.layer.cornerRadius = 15
        newestButton.layer.borderColor = UIColor.black.cgColor
        newestButton.layer.borderWidth = 2
        popularButton.layer.borderColor = UIColor.black.cgColor
        popularButton.layer.borderWidth = 2
        contactsButton.layer.borderColor = UIColor.black.cgColor
        contactsButton.layer.borderWidth = 2
        
    }
    
    func showSearchBar() {
      searchBar.alpha = 0
      navigationItem.titleView = searchBar
        navigationItem.setLeftBarButton(nil, animated: true)
        UIView.animate(withDuration: 0.7, animations: {
        self.searchBar.alpha = 1
        }, completion: { finished in
          self.searchBar.becomeFirstResponder()
            
      })
    }

    func hideSearchBar() {
        navigationItem.setLeftBarButton(searchBarButtonItem, animated: true)
      logoImageView.alpha = 0
        UIView.animate(withDuration: 0.7, animations: {
        self.navigationItem.titleView = self.logoImageView
        self.logoImageView.alpha = 1
        }, completion: { finished in

      })
    }


    //MARK: UISearchBarDelegate
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      hideSearchBar()
    }
  
    
    //MARK: - Table View Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TopicController.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        
        let topic = TopicController.topics[indexPath.row]
        
        cell.textLabel?.text = topic.name
    
        cell.detailTextLabel?.text = topic.bio
        cell.imageView?.image = UIImage(named: topic.name)
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = CGColor.init(red: 0.0314, green: 0.051, blue: 0.0824, alpha: 1)
        cell.layer.borderWidth = 5
        
        return cell
    }//End of func
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 120
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "personBio" {
            guard let cell = sender as? PersonTableViewCell,
                  let indexPath = personTableViewController.indexPath(for: cell),
                  let destinationVC = segue.destination as?
                    TopicSelectorTableViewController else { return }
            let topicToSend = TopicController.topics[indexPath.row]
            destinationVC.topic = topicToSend
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            topics = topicsSelection

        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {
            self.personTableViewController.reloadData()
            return
        }

        let filteredChampions = topics.filter {

            $0.name.localizedCaseInsensitiveContains(searchTerm)
        }

        self.topics = filteredChampions
        self.personTableViewController.reloadData()
    }//End of func
}//End of class
