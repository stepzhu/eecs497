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
    }

    // MARK: Properties
    var imageArray = [UIImage]()
    let foodOptions = ["cafeteria", "starbucks", "subway", "einstein"]
    @IBOutlet weak var foodScroll: UIScrollView!
    
    @IBAction func backAction(_ sender: UIButton) {
         self.performSegue(withIdentifier: "backSegue", sender: self)
    }
    //@IBOutlet weak var backButton: UIButton!

    
    func addImagesToFoodScroll(_ images: [UIImage]) {
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.image = images[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: foodScroll.frame.width, height: foodScroll.frame.height)
                imageView.contentMode = .scaleAspectFit
                foodScroll.contentSize.width = foodScroll.frame.width * CGFloat(i + 1)
                foodScroll.addSubview(imageView)
                foodScroll.delegate = self
            }
    }
    
    
//    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
//        let textColor = UIColor.red
//        let textFont = UIFont(name: "Helvetica Bold", size: 30)!
//
//        let scale = UIScreen.main.scale
//        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
//
//        let textFontAttributes = [
//            NSAttributedString.Key.font: textFont,
//            NSAttributedString.Key.foregroundColor: textColor,
//            ] as [NSAttributedString.Key : Any]
//        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
//
//        let rect = CGRect(origin: point, size: image.size)
//        text.draw(in: rect, withAttributes: textFontAttributes)
//
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return newImage!
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        imageArray = [UIImage(named:"cafeteria"), UIImage(named: "starbucks"), UIImage(named: "subway"), UIImage(named: "einstein")] as! [UIImage]
        //imageArray = Cafe.createCafes();
        // call helper function to add images to scroll
        addImagesToFoodScroll(imageArray)
        
        
//        var imagesWithTextArray = [UIImage]()
    
//        for i in 0..<imageArray.count {
//            let imageView = UIImageView()
//            imageView.image = imageArray[i]
//            let point = CGPoint.init(x: 100, y: 100)
//            let newImageWithText = textToImage(drawText: foodOptions[i], inImage: UIImage(named: foodOptions[i])!, atPoint: point)
//            imagesWithTextArray.append(newImageWithText);
//        }
        
//         addImagesToFoodScroll(imagesWithTextArray)
        // Do any additional setup after loading the view.
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
