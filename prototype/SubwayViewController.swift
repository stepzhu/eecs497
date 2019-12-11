//
//  SubwayViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/11/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit
import Foundation

struct Subway {
    let name:String?
    let country:String?
}
class SubwayAPI {
    static func getSubways() -> [Subway]{
        let Subways = [
            Subway(name: "Black Forest Ham", country: "bo"),
            Subway(name: "Chicken & Bacon Ranch Melt", country: "be"),
            Subway(name: "Italian B.M.T", country: "af"),
            Subway(name: "Spicy Italian", country: "al"),
            Subway(name: "Meatball Marinara", country: "br"),
            Subway(name: "Steak & Cheese", country: "az"),
            Subway(name: "Sweet Onion Chicken Teriyaki", country: "bo"),
            Subway(name: "Veggie Delite", country: "au5"),
            Subway(name: "Apple Sauce", country: "bo"),
            Subway(name: "Chocolate Chip Cookie", country: "au5"),
            Subway(name: "Chips", country: "au5")
        ]
        return Subways
    }
}
class SubwayTableViewCell: UITableViewCell {
    
    var Subway:Subway? {
        didSet {
            guard let SubwayItem = Subway else {return}
            if let name = SubwayItem.name {
                profileImageView.image = UIImage(named: name)
                nameLabel.text = name
            }
            
            if let country = SubwayItem.country {
                countryImageView.image = UIImage(named: country)
            }
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        return img
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Courier-Bold", size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let jobTitleDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(countryImageView)
        self.backgroundColor = .darkGray
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:150).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
        countryImageView.widthAnchor.constraint(equalToConstant:26).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant:26).isActive = true
        countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
}


class SubwayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let Subways = SubwayAPI.getSubways() // model
    let SubwaysTableView = UITableView() // view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SubwaysTableView.contentInset = UIEdgeInsets(top: 75, left: 0, bottom: 0, right: 0)
        view.addSubview(SubwaysTableView)
        
        SubwaysTableView.translatesAutoresizingMaskIntoConstraints = false
        
        SubwaysTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        SubwaysTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        SubwaysTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        SubwaysTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        SubwaysTableView.dataSource = self
        SubwaysTableView.delegate = self
        
        SubwaysTableView.register(SubwayTableViewCell.self, forCellReuseIdentifier: "SubwayCell")
        
        
        
        
        navigationItem.title = "Subways"
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: [])
        button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        button.center = CGPoint(x: 40, y: 60)
        button.titleLabel?.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        self.view.backgroundColor = .darkGray
        SubwaysTableView.backgroundColor = .darkGray
        self.view.addSubview(button)

    }
    
    
    @objc func backAction() -> Void {
        dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Subways.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //      let cell = tableView.dequeueReusableCell(withIdentifier: "SubwayCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubwayCell", for: indexPath) as! SubwayTableViewCell
        cell.isUserInteractionEnabled = false
        
        //      cell.textLabel?.text = Subways[indexPath.row].name
        cell.Subway = Subways[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
}
