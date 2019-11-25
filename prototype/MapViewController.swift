//
//  MapViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 10/19/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var MapImage: UIImageView!
    
    let floors = ["Floor 2", "Floor 3", "Floor 4", "Floor 5", "Floor 6", "Floor 7", "Floor 8", "Floor 10", "Floor 11",  "Floor 12"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let colorPickerView = UIColor(white: 1.0, alpha: 1.0)
        pickerView.setValue(colorPickerView, forKey: "textColor")
        return floors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let colorPickerView = UIColor(white: 1.0, alpha: 1.0)
        pickerView.setValue(colorPickerView, forKey: "textColor")
        return floors[row]
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let colorPickerView = UIColor(white: 1.0, alpha: 1.0)

        return NSAttributedString(string: String(floors[row]), attributes: [NSAttributedString.Key.foregroundColor:colorPickerView])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let colorPickerView = UIColor(white: 1.0, alpha: 1.0)
        pickerView.setValue(colorPickerView, forKey: "textColor")
        if row == 0 {
            // Floor 2
            MapImage.image = UIImage(named:"floor2")
        }
        if row == 1 {
            // Floor 3
            MapImage.image = UIImage(named: "floor3")
        }
        if row == 2 {
            MapImage.image = UIImage(named: "floor4")
        }
        if row == 3 {
            MapImage.image = UIImage(named: "floor5")
        }
        if row == 4 {
            MapImage.image = UIImage(named: "floor6")
        }
        if row == 5 {
            MapImage.image = UIImage(named: "floor7")
        }
        if row == 6 {
            MapImage.image = UIImage(named: "floor8")
        }
        if row == 7 {
            MapImage.image = UIImage(named: "floor10")
        }
        if row == 8 {
            MapImage.image = UIImage(named: "floor11")
        }
        if row == 9 {
            MapImage.image = UIImage(named: "floor12")
        }
    }
    
    override func viewDidLoad() {
        
        let colorPickerView = UIColor(white: 1.0, alpha: 1.0)
        pickerView.setValue(colorPickerView, forKey: "textColor")
        pickerView.reloadAllComponents()
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
       
        print("map view did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
         pickerView.reloadAllComponents()
    }
    @IBAction func backAction(_ sender: Any) {
        self.performSegue(withIdentifier: "backSegue", sender: self)
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
