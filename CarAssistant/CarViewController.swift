//
//  CarViewController.swift
//  CarAssistant
//
//  Created by Maciek on 27.06.2014.
//  Copyright (c) 2014 Maciej Scisłowski. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    let iconTitle = "Car"
    let iconName = "icon"
    let iconType = "png"
    let carTitlePlaceholderText = "Type a car title here"
    let carOwnerPlaceholderText = "Type an owner here"
    
    let carTitleField: UITextField = UITextField()
    let carOwnerField: UITextField = UITextField()
    
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
    
    func configureControls() {
        carTitleField.setTranslatesAutoresizingMaskIntoConstraints(false)
        carOwnerField.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        carTitleField.placeholder = carTitlePlaceholderText
        carOwnerField.placeholder = carOwnerPlaceholderText
        
        self.view.addSubview(carTitleField)
        self.view.addSubview(carOwnerField)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureControls()
    }
    
}
