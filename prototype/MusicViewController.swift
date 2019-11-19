//
//  MusicViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/19/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let button = UIButton(frame: CGRect(x: 100, y: 100, width:150, height: 150))
        button.setTitle("Spotify", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: [])
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        button.center = view.center
        button.backgroundColor = UIColor(red: 0.0, green: 1, blue: 0, alpha: 1.0)
        self.view.addSubview(button)
        
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
        tryURL(urls: ["https://open.spotify.com/playlist/6gCC8kozvUlLGTzl2YO2MR"])
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
