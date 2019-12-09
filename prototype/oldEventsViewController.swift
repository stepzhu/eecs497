//
//  oldEventsViewController.swift
//  prototype
//
//  Created by Julia Pagnucco on 11/18/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class oldEventsViewController: UITableViewController {
    var mealImages = [UIImage]()
    var mealNames = [String]()
    
    private func loadEvents() {
        guard let photo1 = UIImage(named: "videogame") else { fatalError("error") }
        guard let photo2 = UIImage(named: "icecreamsocial") else { fatalError("error") }
        guard let photo3 = UIImage(named: "football") else { fatalError("error") }
        guard let photo4 = UIImage(named: "music") else { fatalError("error") }
        guard let photo5 = UIImage(named: "bake") else { fatalError("error") }
        guard let photo6 = UIImage(named: "journal") else { fatalError("error") }
        guard let photo7 = UIImage(named: "art") else { fatalError("error") }
        
        mealImages.append(photo1)
        mealImages.append(photo2)
        mealImages.append(photo3)
        mealImages.append(photo4)
        mealImages.append(photo5)
        mealImages.append(photo6)
        mealImages.append(photo7)

        mealNames += ["Mondays 6pm - 8pm: Videogame Night!", "Tuesdays 1pm - 3pm: Ice Cream Social",
                             "Wednesdays 6pm - 8pm: Meet and Greet with Athletes", "Thursdays 3pm - 6pm: Music Class",
                             "Fridays 10am - 12pm: Baking Class", "Saturdays 1pm - 3pm: Journaling", "Sundays 4pm - 7pm: Art Class"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
//        // the default direction is right
//        view.addGestureRecognizer(rightSwipe)
        
        // Load the sample data.
        loadEvents()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: [])
        button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        button.center = CGPoint(x: 40, y: -25)
        button.titleLabel?.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        self.view.addSubview(button)
        self.tableView.contentInset = UIEdgeInsets(top: 75, left: 0, bottom: 0, right: 0)
        view.backgroundColor = .darkGray
    }
        //function used by the back button
    @objc func backAction() -> Void {
        dismiss(animated: true, completion: nil)
    }

//    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
//        if sender.state == .ended {
//            switch sender.direction {
//            case .right:
//                view.backgroundColor = .red
//                let newViewController = UIViewController()
//                
//                self.navigationController?.pushViewController(newViewController, animated: true)
//                
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "eventsView") as! UIViewController
//                
//                self.present(vc, animated: true, completion: nil)
//            default:
//                break
//            }
//        }
//    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealImages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "OldTable"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OldTable  else {
            fatalError("The dequeued cell is not an instance of OldTable.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let meal = mealImages[indexPath.row]
        // Configure the cell...
        // print("Curr meal is: ",mealNames[indexPath.row])
//        cell.foodLabel.text = mealNames[indexPath.row]
//        cell.imageFood.image = meal
        cell.oldImage.image = meal
        cell.oldLabel.text = mealNames[indexPath.row]
        return cell
    }
}
