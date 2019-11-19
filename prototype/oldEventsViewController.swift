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
        guard let photo1 = UIImage(named: "coffee1") else { fatalError("error") }
        guard let photo2 = UIImage(named: "coffee2") else { fatalError("error") }
        guard let photo3 = UIImage(named: "coffee3") else { fatalError("error") }
        guard let photo4 = UIImage(named: "coffee4") else { fatalError("error") }
        guard let photo5 = UIImage(named: "coffee5") else { fatalError("error") }
        guard let photo6 = UIImage(named: "chai") else { fatalError("error") }
        guard let photo7 = UIImage(named: "tea1") else { fatalError("error") }
        
        mealImages.append(photo1)
        mealImages.append(photo2)
        mealImages.append(photo3)
        mealImages.append(photo4)
        mealImages.append(photo5)
        mealImages.append(photo6)
        mealImages.append(photo7)

        mealNames += ["Latte", "Coffee with Milk", "Iced Coffee", "Coffee with Whipped Cream", "Caramel Macchiato", "Chai", "Green Tea"]
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
