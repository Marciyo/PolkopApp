//
//  DrawerMenuViewController.swift
//  PolkopApp
//
//  Created by GSK on 06/09/2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

class DrawerMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView.init()
    let avatarImage = UIImageView.init()
    
    let nameLabel = UILabel.init()
    let cityLabel = UILabel.init()
    let reviewLabel = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.avatarImage.translatesAutoresizingMaskIntoConstraints = false
        self.avatarImage.contentMode = .scaleAspectFit
        self.avatarImage.layer.cornerRadius = 40
        self.avatarImage.layer.masksToBounds = true
        self.avatarImage.sd_setImage(with: URL(string: "https://scontent-waw1-1.xx.fbcdn.net/v/t1.0-9/16425846_1253676674739317_4950162214327130201_n.jpg?oh=82ab57c63e1486449bf3d06a688013fc&oe=5A239A7B"))
        
        self.view.addSubview(self.avatarImage)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.avatarImage,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 30
                ),
                NSLayoutConstraint.init(
                    item: self.avatarImage,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 12
                ),
                NSLayoutConstraint.init(
                    item: self.avatarImage,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 0.3,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.avatarImage,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.avatarImage,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (item) in
            item.left.equalTo(self.avatarImage.snp.right).offset(16)
            item.top.equalTo(self.avatarImage.snp.top).offset(0)
        }
        self.nameLabel.text = "Dawid Kubicki"
        self.nameLabel.font = UIFont.normal
        self.nameLabel.textColor = UIColor.white
        
        self.cityLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.cityLabel)
        self.cityLabel.snp.makeConstraints { (item) in
            item.left.equalTo(self.nameLabel.snp.left).offset(0)
            item.top.equalTo(self.nameLabel.snp.bottom).offset(6)
        }
        self.cityLabel.text = "⌲Poznań"
        self.cityLabel.font = UIFont.normal
        self.cityLabel.textColor = UIColor.white

        self.reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.reviewLabel)
        self.reviewLabel.snp.makeConstraints { (item) in
            item.left.equalTo(self.nameLabel.snp.left).offset(0)
            item.top.equalTo(self.cityLabel.snp.bottom).offset(12)
        }
        self.reviewLabel.text = "🎖🎖🎖🎖/🎖🎖🎖🎖🎖"
        self.reviewLabel.font = UIFont.normal
        self.reviewLabel.textColor = UIColor.white
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(DrawerMenuTableViewCell.self, forCellReuseIdentifier: "drawer")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.avatarImage,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 10
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 0
                ),
            ]
        )
    }
    
    //MARK: - UITableView Delegate & Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drawer", for: indexPath) as! DrawerMenuTableViewCell
        
        switch indexPath.item {
        case 0:
            cell.itemLabel.text = "Account settings"
        case 1:
            cell.itemLabel.text = "Reviews"
        case 2:
            cell.itemLabel.text = "Your offers"
        case 3:
            cell.itemLabel.text = "Favourites"
        case 4:
            return cell
        case 5:
            cell.itemLabel.text = "Terms of use"
        case 6:
            cell.itemLabel.text = "Privacy policy"
        case 7:
            cell.itemLabel.text = "Web adress"
        case 8:
            cell.itemLabel.text = "About us"
        default:
            cell.itemLabel.text = "Menu number \(indexPath.item), \(indexPath.section)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }}
