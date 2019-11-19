//
//  youngEventsViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/11/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class youngEventsViewController : UITableViewController {
    var eventImages = [UIImage]()
    var eventNames = [String]()
    
    private func loadEvents() {
        guard let photo1 = UIImage(named: "younggames") else { fatalError("error") }
        guard let photo2 = UIImage(named: "youngtutor") else { fatalError("error") }
        guard let photo3 = UIImage(named: "movie") else { fatalError("error") }
        guard let photo4 = UIImage(named: "youngtherapy") else { fatalError("error") }
        guard let photo5 = UIImage(named: "art") else { fatalError("error") }
        guard let photo6 = UIImage(named: "music") else { fatalError("error") }
        guard let photo7 = UIImage(named: "youngtutor") else { fatalError("error") }
        
        eventImages.append(photo1)
        eventImages.append(photo2)
        eventImages.append(photo3)
        eventImages.append(photo4)
        eventImages.append(photo5)
        eventImages.append(photo6)
        eventImages.append(photo7)

        eventNames += ["Mondays 6pm - 8pm: Game Night!", "Tuesdays 1pm - 3pm: Tutoring",
                      "Wednesdays 6pm - 8pm: Movie Night!", "Thursdays 3pm - 6pm: Group Therapy",
                      "Fridays 10am - 12pm: Art Class", "Saturdays 1pm - 3pm: Music Class", "Sundays 4pm - 7pm: Tutoring"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        // the default direction is right
        view.addGestureRecognizer(rightSwipe)
        // Load the sample data.
        loadEvents()
    }
    

    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                view.backgroundColor = .red
                let newViewController = UIViewController()
                
                self.navigationController?.pushViewController(newViewController, animated: true)
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "eventsView") as! UIViewController
                
                self.present(vc, animated: true, completion: nil)
            default:
                break
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventImages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "YoungTable"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? YoungTable  else {
            fatalError("The dequeued cell is not an instance of YoungTable.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let event = eventImages[indexPath.row]
        // Configure the cell...
        cell.YImage.image = event
        cell.YLabel.text = eventNames[indexPath.row]
        return cell
    }
}

