//
//  MainTableViewController.swift
//  PolkopApp
//
//  Created by GSK on 06/09/2017.
//  Copyright © 2017 Marcel Mierzejewski. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView.init()
    var userData: [UserModel] = []
    
    var data: [ProductModel] = []
    var maxOffset = -1
    
    let realBackground = UIImageView.init()
    let fakeBackground = UIImageView.init()
    let mainImage = UIImageView.init()
    let descriptionLabel = UILabel.init()
    let searchBar = UISearchBar.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.title = "Product List".localized
        
        self.realBackground.backgroundColor = UIColor.white
        self.realBackground.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.realBackground)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.realBackground,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.realBackground,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.realBackground,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.realBackground,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 180
                )
            ]
        )
        
        self.fakeBackground.backgroundColor = UIColor.main
        self.fakeBackground.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.fakeBackground)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.fakeBackground,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.fakeBackground,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.fakeBackground,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.fakeBackground,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 30
                )
            ]
        )
        
        self.mainImage.translatesAutoresizingMaskIntoConstraints = false
        self.mainImage.backgroundColor = UIColor.lightGray
        self.mainImage.contentMode = .scaleAspectFill
        self.mainImage.layer.cornerRadius = 60
        self.mainImage.layer.masksToBounds = true
        self.mainImage.sd_setImage(with: URL.init(string:"https://scontent-waw1-1.xx.fbcdn.net/v/t31.0-8/12716009_1657059021209851_3139532092188433701_o.jpg?oh=78e38b7e8fd92faf36227e1290430291&oe=5A54A7BB"))
        self.view.addSubview(self.mainImage)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.mainImage,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.fakeBackground,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 10
                ),
                NSLayoutConstraint.init(
                    item: self.mainImage,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 12
                ),
                NSLayoutConstraint.init(
                    item: self.mainImage,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 120
                ),
                NSLayoutConstraint.init(
                    item: self.mainImage,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 120
                )
            ]
        )
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.font = UIFont.normal
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(self.descriptionLabel)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.descriptionLabel,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.mainImage,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.descriptionLabel,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.mainImage,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 16
                ),
                NSLayoutConstraint.init(
                    item: self.descriptionLabel,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: -16
                ),
            ]
        )
        
        self.descriptionLabel.text = "Welcome to PolkopApp. \n In the search bar below, enter the name of the product you wanna borrow."
        
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.backgroundColor = UIColor.clear
        self.searchBar.barTintColor = UIColor.white
        self.view.addSubview(self.searchBar)
        self.searchBar.snp.makeConstraints { (item) in
            item.left.equalToSuperview().offset(16)
            item.right.equalTo(self.descriptionLabel.snp.right).offset(0)
            item.top.equalTo(self.descriptionLabel.snp.bottom).offset(6)
        }
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(BasicTableViewCell.self, forCellReuseIdentifier: "basic")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.realBackground,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 0
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
//        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: Constants.Keys.UserDataLoaded),object: nil)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
//            print("User data loading")
//            FlowManager.loadUser()
//        })
        
    }
    
    //MARK: - UITableView Delegate & Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
//        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath) as! BasicTableViewCell
//        let model = self.data[indexPath.row]
        
        cell.itemImage.image = #imageLiteral(resourceName: "DuraStar_LocalDelivery_M_2x_750x520")
        cell.itemLabel.text = "Trunk number \(indexPath.item) to rent"
        cell.descriptionLabel.text = "Poznań, Rataje, 📍2.4km"
        
        if indexPath.item > 3{
            cell.premiumImage.removeFromSuperview()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
//    
//    func refresh() {
//        guard
//            let user = FlowManager.currentUser
//            else { return }
//        
//        self.testImage.sd_setImage(with: URL(string: user.avatar ?? ""))
//        self.testLabel.text = "\(user.name ?? "") \(user.surname ?? "")"
//        
//        self.fetchData()
//    }
//    
//    func fetchData(){
//        Network.GetProducts().responseModel(successCompletion: { (list: ProductList ) in
//            
//            guard
//                let items = list.list
//                else { return }
//            
//            self.data = items
//            self.tableView.reloadData()
//        }) { (_) in
//            
//        }
//    }
}
