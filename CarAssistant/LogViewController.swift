//
//  LogViewController.swift
//  CarAssistant
//
//  Created by Maciek on 27.06.2014.
//  Copyright (c) 2014 Maciej Scisłowski. All rights reserved.
//

import UIKit

class LogViewController: UIViewController,
                         UITableViewDelegate,
                         UITableViewDataSource {
    
    let logTitle = "Log list"
    let iconTitle = "Log"
    let iconName = "icon"
    let iconType = "png"
    let CELL_ID = "cell"
    
    let tableView: UITableView = UITableView()
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        let path: String = NSBundle.mainBundle().pathForResource(iconName, ofType: iconType)
        let image: UIImage = UIImage(contentsOfFile: path)
        self.tabBarItem = UITabBarItem(title: iconTitle, image: image, tag: 0)
        
    }
    
    init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let path: String = NSBundle.mainBundle().pathForResource(iconName, ofType: iconType)
        let image: UIImage = UIImage(contentsOfFile: path)
        self.tabBarItem = UITabBarItem(title: iconTitle, image: image, tag: 0)
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:CustomTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as CustomTableViewCell
        if cell == nil {
            cell = CustomTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        //needed?
        cell.setTranslatesAutoresizingMaskIntoConstraints(false)
        cell.textLabel.text = "AAAAA"
        cell.detailTextLabel.text = "bbbbbb"
        let path: String = NSBundle.mainBundle().pathForResource("icon", ofType: "png")
        let image: UIImage = UIImage(contentsOfFile: path)
        cell.imageView.image = image
        return cell
        
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.navigationController.pushViewController(LogDetailViewController(), animated: true)
    }
    
    func configureControls() {
        
        tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: CELL_ID)
        self.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        let newLogButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: nil)
        self.navigationItem.title = logTitle
        self.navigationItem.rightBarButtonItem = newLogButton
        
        var metrics = [
            "topMargin":0,
            "leftMargin": 0,
            "width": self.view.frame.width,
            "height": self.view.frame.size.height]
        var trailingTableViewConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-leftMargin-[tableView(width)]-|", options: nil, metrics: metrics, views: ["tableView": tableView])
        var topTableViewConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[tableView(height)]-|", options: nil, metrics: metrics, views: ["tableView": tableView])

        self.view.addConstraints(trailingTableViewConstraints)
        self.view.addConstraints(topTableViewConstraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureControls()
    }

    
}