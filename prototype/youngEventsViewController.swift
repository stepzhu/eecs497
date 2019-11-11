//
//  youngEventsViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/11/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class youngEventsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        imageArray = [UIImage(named:"eventsYoung")] as! [UIImage]
        //imageArray = Cafe.createCafes();
        // call helper function to add images to scroll
        addImagesToFoodScroll(imageArray)
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var youngEventsScroll: UIScrollView!
    var imageArray = [UIImage]()

    
    func addImagesToFoodScroll(_ images: [UIImage]) {
        for i in 0..<images.count {
            
            let imageView = UIImageView()
            imageView.image = images[i]
            
            
            imageView.tag = i;
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: youngEventsScroll.frame.width, height: youngEventsScroll.frame.height)
            imageView.contentMode = .scaleAspectFit
            youngEventsScroll.contentSize.width = youngEventsScroll.frame.width * CGFloat(i + 1)
            youngEventsScroll.addSubview(imageView)
            youngEventsScroll.delegate = self as! UIScrollViewDelegate
        }
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
