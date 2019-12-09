//
//  OrderFoodViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/24/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class OrderFoodViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var orderText: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        errorLabel.isHidden = true
        restaurantName.textColor = UIColor.white
        orderText.textColor = UIColor.white
        restaurantName.attributedPlaceholder = NSAttributedString(string:"Enter restaurant name...", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font :UIFont(name: "Courier New", size: 15)!])
        
        orderText.attributedPlaceholder = NSAttributedString(string:"Enter food order...", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font :UIFont(name: "Courier New", size: 15)!])
        
        orderText.delegate = self
        restaurantName.delegate = self
        
        super.viewDidLoad()

        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.white , for: .normal)
        button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        button.center = CGPoint(x: 42, y: 63)
        self.view.addSubview(button)
    }
    
    
    @objc func backAction() -> Void {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ orderText: UITextField) -> Bool {
        self.view.endEditing(true)
        orderText.resignFirstResponder()
        return false
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clickSubmit(_ sender: Any) {
        print("submit button pressed")
        print("order text is", orderText.text, "restaurant is: ", restaurantName.text)
        
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (orderText.text != Optional("") && restaurantName.text != Optional("")) {
            print("in if statement")
            return true
        }
        errorLabel.isHidden = false

        return false
    }
}
