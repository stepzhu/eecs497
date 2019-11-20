//
//  ChatViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 10/19/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let button = UIButton(frame: CGRect(x: 100, y: 100, width:150, height: 150))
        button.setTitle("Facebook", for: .normal)
        button.titleLabel?.font = UIFont(name: "Courier-Bold", size: 24)
        button.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: [])
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        button.center = CGPoint(x: self.view.center.x, y: 600)
        button.backgroundColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1, alpha: 1.0)
        self.view.addSubview(button)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        label.font = UIFont(name: "Courier", size: 24)
        label.center = CGPoint(x: self.view.center.x, y: 350)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 10
        label.textAlignment = NSTextAlignment.center;
        label.text = "Hi, if you want to connect to other kids staying in the hospital, click the button below. This button takes you to a Facebook group that is monitored by parents."
        label.textColor = .white
        self.view.addSubview(label)
    }
    func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                if #available(iOS 10.0, *) {
                    application.open(URL(string: url)!, options: [:], completionHandler: nil)
                }
                else {
                    application.openURL(URL(string: url)!)
                }
                return
            }
        }
    }
    @objc func buttonAction(sender: UIButton!) {
//        var instagramHooks =
//        var instagramUrl = NSURL(string: instagramHooks)
        tryURL(urls: ["https://www.facebook.com/groups/399249621018106/"])
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
