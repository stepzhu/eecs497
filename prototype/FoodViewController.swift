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
        self.performSegue(withIdentifier: "menuSegue", sender: self)
        print(sender)
    }
    
    @IBAction func tapFood1(_ sender: UITapGestureRecognizer) {
        print("insde SECOND tap method")
        self.performSegue(withIdentifier: "menuSegue", sender: self)

        print(sender)
    }
    
    @IBAction func tapFood2(_ sender: UITapGestureRecognizer) {
        print("insde THIRD tap method")
        self.performSegue(withIdentifier: "menuSegue", sender: self)

        print(sender)
    }
    @IBAction func tapFood3(_ sender: UITapGestureRecognizer) {
        print("insde FOURTH tap method")
        self.performSegue(withIdentifier: "menuSegue", sender: self)

        print(sender)
    }
    
    func addImagesToFoodScroll(_ images: [UIImage]) {
        for i in 0..<images.count {
            let imageTap = "tapFood" + String(i) + ":"
            
            let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector((imageTap)))
            singleTap.numberOfTapsRequired = 1
            singleTap.numberOfTouchesRequired = 1
            
            
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
        
        imageArray = [UIImage(named:"cafeteria"), UIImage(named: "starbucks"), UIImage(named: "subway"), UIImage(named: "einstein")] as! [UIImage]
        //imageArray = Cafe.createCafes();
        // call helper function to add images to scroll
        addImagesToFoodScroll(imageArray)
    }
}
