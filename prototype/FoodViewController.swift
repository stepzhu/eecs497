//
//  FoodViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 10/19/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit



class FoodViewController: UIViewController, UIScrollViewDelegate {
    
    class Cafe
    {
        // MARK: - Public API
        var id = ""
        var title = ""
        var description = ""
        var featuredImage: UIImage!
        
        init(id: String, title: String, description: String, featuredImage: UIImage!)
        {
            self.id = id
            self.title = title
            self.description = description
            self.featuredImage = featuredImage
        }
        
        // MARK: - Private
        
        static func createCafes() -> [Cafe]
        {
            return [
                Cafe(id: "r1", title: "Starbucks", description: "Coffee and Pastries", featuredImage: UIImage(named: "starbucks")!),
                Cafe(id: "r2", title: "Einstein Bros. Bagels", description: "Bagels, Coffee, Sandwiches", featuredImage: UIImage(named: "einstein")!),
                Cafe(id: "r3", title: "Subway", description: "Make your own sandwiches", featuredImage: UIImage(named: "subway")!),
                Cafe(id: "r4", title: "Cafeteria", description: "Diverse options available", featuredImage: UIImage(named: "cafeteria")!),
                Cafe(id: "r5", title: "DarkGray", description: ";)", featuredImage: UIImage(named: "DarkGray")!),
            ]
        }
    } // end of Cafe class

    // MARK: Properties
    var imageArray = [UIImage]()
    let foodOptions = ["cafeteria", "starbucks", "subway", "einstein"]
    @IBOutlet weak var foodScroll: UIScrollView!
    
    @IBAction func backAction(_ sender: UIButton) {
         self.performSegue(withIdentifier: "backSegue", sender: self)
    }

    @IBAction func tapFood0(_ sender: UITapGestureRecognizer) {
         print("\ninsde FIRST tap method\n")
        
        let newViewController = UIViewController()
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "gateway") as! UIViewController
        
        self.present(vc, animated: true, completion: nil)
//        self.performSegue(withIdentifier: "menuSegue", sender: self)
        print(sender)
    }
    
    @IBAction func tapFood1(_ sender: UITapGestureRecognizer) {
        print("insde SECOND tap method")
        let newViewController = UIViewController()
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "starbucks") as! UIViewController
        
        self.present(vc, animated: true, completion: nil)
        
//        self.performSegue(withIdentifier: "menuSegue", sender: self)

        print(sender)
    }
    
    @IBAction func tapFood2(_ sender: UITapGestureRecognizer) {
        print("insde THIRD tap method")
        let newViewController = UIViewController()
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "subway") as! UIViewController
        
        self.present(vc, animated: true, completion: nil)

        print(sender)
    }
    @IBAction func tapFood3(_ sender: UITapGestureRecognizer) {
        print("insde FOURTH tap method")
        let newViewController = UIViewController()
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "einstein") as! UIViewController
        
        self.present(vc, animated: true, completion: nil)
        
        //self.performSegue(withIdentifier: "menuSegue", sender: self)
        
        print(sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let senderLocal = sender
        if case let senderLocal = UITapGestureRecognizer() {
//            let senderUI = (UITapGestureRecognizer) sender
            if (segue.identifier == "menuSegue") {
                let secondViewController = segue.destination as! MenuViewController
                let restaurant = senderLocal.view!.restorationIdentifier
                
                if (restaurant == "0") {
                    secondViewController.restaurant = "Gateway"
                } else if (restaurant == "1") {
                    secondViewController.restaurant = "Starbucks"
                }else if (restaurant == "2") {
                    secondViewController.restaurant = "Subway"
                }else if (restaurant == "3") {
                    secondViewController.restaurant = "Einstein"
                }
            }
        } else {
             // do nothing
        }
        
    }
    
    func addImagesToFoodScroll(_ images: [UIImage]) {
        for i in 0..<images.count {
            let imageTap = "tapFood" + String(i) + ":"
            
            let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector((imageTap)))
            singleTap.numberOfTapsRequired = 1
            singleTap.numberOfTouchesRequired = 1
//            singleTap.view!.restorationIdentifier = String(i)
            
            let imageView = UIImageView()
            imageView.image = images[i]
            imageView.addGestureRecognizer(singleTap)
            imageView.isUserInteractionEnabled = true
            
            imageView.tag = i;
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: foodScroll.frame.width, height: foodScroll.frame.height)
                imageView.contentMode = .scaleAspectFit
                foodScroll.contentSize.width = foodScroll.frame.width * CGFloat(i + 1)
                foodScroll.addSubview(imageView)
                foodScroll.delegate = self
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = [UIImage(named:"cafeteria"), UIImage(named: "starbucks"), UIImage(named: "subway"), UIImage(named: "einstein"),UIImage(named: "DarkGray")] as! [UIImage]
        //imageArray = Cafe.createCafes();
        // call helper function to add images to scroll
        addImagesToFoodScroll(imageArray)
    }
}
