//
//  DoctorsViewController.swift
//
//
//  Created by Izzy Koningstein on 11/18/19.
//

import UIKit

class DoctorsViewController: UITableViewController {
    
    var doctorNames = [String]()
    var ageRange = [String]()
    
    
    private func loadSampleDoctors() {
        
        doctorNames += ["James Brown", "Samantha Grey", "Noa Smith", "Derek Miller", "Rina Patel", "Meredith Wilson", "Bisma Syed", "Greg Johnson"]
        ageRange += ["Ages: 8-10", "Ages: 8-10", "Ages: 10-12", "Ages: 13-15", "Ages: 13-15", "Ages: 13-15", "Ages: 16-18", "Ages: 16-18"]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.tableView.register(MealTableViewCell.self, forCellReuseIdentifier: "EinsteinMealTableViewCell")
        loadSampleDoctors();
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        // the default direction is right
//        view.addGestureRecognizer(rightSwipe)
        // Do any additional setup after loading the view.
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
//        print("SWIPING!")
//        if sender.state == .ended {
//            switch sender.direction {
//            case .right:
//                view.backgroundColor = .red
//                let newViewController = UIViewController()
//
//                self.navigationController?.pushViewController(newViewController, animated: true)
//
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "stressRelief") as! UIViewController
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
        return doctorNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DoctorsTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DoctorsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of DoctorTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        // Configure the cell...
        cell.nameLabel.text = doctorNames[indexPath.row]
        cell.ageLabel.text = ageRange[indexPath.row]
        
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

