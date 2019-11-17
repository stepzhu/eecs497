//
//  GetawayFoodViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/11/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class GetawayFoodViewController: UITableViewController {
    var mealImages = [UIImage]()
    var mealNames = [String]()
    
    private func loadSampleMeals() {
        guard let photo1 = UIImage(named: "chocolateMilkshake") else { fatalError("error") }
        guard let photo2 = UIImage(named: "vanillaMilkshake") else { fatalError("error") }
        guard let photo3 = UIImage(named: "strawberryMilkshake") else { fatalError("error") }
        guard let photo4 = UIImage(named: "berrySmoothie") else { fatalError("error") }
        guard let photo5 = UIImage(named: "greenSmoothie") else { fatalError("error") }
        guard let photo6 = UIImage(named: "oatmeal") else { fatalError("error") }
        guard let photo7 = UIImage(named: "acai") else { fatalError("error") }
        guard let photo8 = UIImage(named: "granola") else { fatalError("error") }
        guard let photo9 = UIImage(named: "muffin") else { fatalError("error") }
        mealImages.append(photo1)
        mealImages.append(photo2)
        mealImages.append(photo3)
        mealImages.append(photo4)
        mealImages.append(photo5)
        mealImages.append(photo6)
        mealImages.append(photo7)
        mealImages.append(photo8)
        mealImages.append(photo9)
        
        mealNames += ["Chocolate Milkshake", "Vanilla Milkshake", "Strawberry Milkshake", "Berry Smoothie", "Green Smoothie", "Oatmeal", "Acai Bowl", "Granola", "Muffin"]
    }
    
    override func viewDidLoad() {
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
        let cellIdentifier = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let meal = mealImages[indexPath.row]
        // Configure the cell...
        cell.foodLabel.text = mealNames[indexPath.row]
        cell.imageFood.image = meal
        
        return cell
    }
}
