//
//  BreatheViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/19/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

import SwiftGifOrigin

class BreatheViewController: UIViewController {
    
    //@IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var breatheInstructions: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let breatheGif = UIImage.gifImageWithName("breathe")
        let imageView = UIImageView()
        //        imageView.loadGif(name: "breathe")
        imageView.image = UIImage.gif(name: "breathe")
        //        let imageView = UIImageView(image: breatheGif)
        imageView.frame = CGRect(x: 20.0, y: 250.0,
                                 width: self.view.frame.size.width - 40,
                                 height: 300.0)
        self.view.addSubview(imageView)
        print("WTFFFFF")
        breatheInstructions.lineBreakMode = NSLineBreakMode.byWordWrapping
        breatheInstructions.numberOfLines = 0
        // Do any additional setup after loading the view.
    }
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                let newViewController = UIViewController()
                
                self.navigationController?.pushViewController(newViewController, animated: true)
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "stressRelief") as! UIViewController
                
                self.present(vc, animated: true, completion: nil)
            default:
                break
            }
        }
    }
}