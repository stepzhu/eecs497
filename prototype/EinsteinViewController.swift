//
//  EinsteinViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/11/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class EinsteinViewController: UITableViewController {

    
    @IBOutlet weak var backButton: UIBarButtonItem!
    var mealImages = [UIImage]()
    var mealNames = [String]()
    var mealPrices = [String]()

    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "backSegue", sender: self)
    }
    private func loadSampleMeals() {
        guard let photo1 = UIImage(named: "einstein_allnighter") else { fatalError("error") }
        guard let photo2 = UIImage(named: "einstein_avocadotoast") else { fatalError("error") }
        guard let photo3 = UIImage(named: "einstein_blueberrymuffin") else { fatalError("error") }
        guard let photo4 = UIImage(named: "einstein_cinnamonwalnutstrudel") else { fatalError("error") }
        guard let photo5 = UIImage(named: "einstein_frenchtoastbagel") else { fatalError("error") }
        guard let photo6 = UIImage(named: "einstein_hamandswiss") else { fatalError("error") }
        guard let photo7 = UIImage(named: "einstein_heavenlychocolatechip") else { fatalError("error") }
        guard let photo8 = UIImage(named: "einstein_plainbagel") else { fatalError("error") }
        guard let photo9 = UIImage(named: "einsteinfarmhouse") else { fatalError("error") }
        guard let photo10 = UIImage(named: "einstein_hummusvegout") else { fatalError("error") }

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

        mealNames += ["Bacon, Egg and Cheese Bagel", "Avocado Toast", "Bluberry Muffin", "Cinnamon Walnut Strudel", "French Toast Bagel", "Ham and Swiss Bagel", "Heavenly Chocolate Chip Bagel", "Plain Bagel", "Bacon, Ham, Egg and Cheese Bagel", "Hummus and Veggie Bagel"]
        mealPrices += ["$5.39", "$4.39", "$2.50", "$3.50", "$1.20", "$5.39", "$1.20", "$1.00", "$5.39", "$5.39"]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(MealTableViewCell.self, forCellReuseIdentifier: "EinsteinMealTableViewCell")
        loadSampleMeals();
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        // the default direction is right
        view.addGestureRecognizer(rightSwipe)
        // Do any additional setup after loading the view.
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
        let cellIdentifier = "MealTableViewCellEinstein"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCellEinstein  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCellEinstein.")
        }
       
        // Fetches the appropriate meal for the data source layout.
        // Configure the cell...
        cell.foodLabel.text = mealNames[indexPath.row]
        cell.foodImageReal.image = mealImages[indexPath.row]
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
