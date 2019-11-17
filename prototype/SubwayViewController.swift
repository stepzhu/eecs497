//
//  SubwayViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/11/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class SubwayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        self.view.addSubview(myTableView)
        
        
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor(red: 0.0, green: 122.0/255.0, blue: 1, alpha: 1.0), for: [])
        button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        button.center = CGPoint(x: 42, y: 63)
        self.view.addSubview(button)
    }
    @objc func backAction() -> Void {
        dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }
}

