//
//  StarbucksViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/11/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class StarbucksViewController: UITableViewController {
    var mealImages = [UIImage]()
    var mealNames = [String]()
    
    private func loadSampleMeals() {
        guard let photo1 = UIImage(named: "coffee1") else { fatalError("error") }
        guard let photo2 = UIImage(named: "coffee2") else { fatalError("error") }
        guard let photo3 = UIImage(named: "coffee3") else { fatalError("error") }
        guard let photo4 = UIImage(named: "coffee4") else { fatalError("error") }
        guard let photo5 = UIImage(named: "coffee5") else { fatalError("error") }
        guard let photo6 = UIImage(named: "chai") else { fatalError("error") }
        guard let photo7 = UIImage(named: "tea1") else { fatalError("error") }
        guard let photo8 = UIImage(named: "tea2") else { fatalError("error") }
        guard let photo9 = UIImage(named: "s2") else { fatalError("error") }
        guard let photo10 = UIImage(named: "espresso") else { fatalError("error") }
        mealImages.append(photo1)
        mealImages.append(photo2)
        mealImages.append(photo3)
        mealImages.append(photo4)
        mealImages.append(photo5)
        mealImages.append(photo6)
        mealImages.append(photo7)
        mealImages.append(photo8)
        mealImages.append(photo9)
        mealImages.append(photo10)

        
        mealNames += ["Latte", "Coffee with Milk", "Iced Coffee", "Coffee with Whipped Cream", "Caramel Macchiato", "Chai", "Green Tea", "Chamomile Tea", "Black Cofee", "Espresso"]
    }
    
    override func viewDidLoad() {
        print("HELLO")

        super.viewDidLoad()
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        // the default direction is right
        view.addGestureRecognizer(rightSwipe)
        
        // Load the sample data.
        loadSampleMeals()
    }
    

    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                view.backgroundColor = .red
                let newViewController = UIViewController()
                
                self.navigationController?.pushViewController(newViewController, animated: true)
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "foodView") as! UIViewController
                
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
        let cellIdentifier = "MealTableViewCell2"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell2  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell2.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let meal = mealImages[indexPath.row]
        // Configure the cell...
        // print("Curr meal is: ",mealNames[indexPath.row])
//        cell.foodLabel.text = mealNames[indexPath.row]
//        cell.imageFood.image = meal
        cell.FoodImageStarbucks.image = meal
        cell.FoodLabelStarbucks.text = mealNames[indexPath.row]
        return cell
    }
}
