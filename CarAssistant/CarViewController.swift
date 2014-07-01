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
    let placeholders = [0: "Type a car title here", 1: "Type an owner here"]
    
    let carTitleField: UITextField = UITextField()
    let carOwnerField: UITextField = UITextField()
    
    // Initializers
    
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
    
    // Controls
    
    func configureControls() {
        self.view.backgroundColor = UIColor.whiteColor()
        carTitleField.tag = 0
        carOwnerField.tag = 1
        for field in [carTitleField, carOwnerField] {
            configureTextField(field)
        }
        configureLayout()
    }
    
    func configureTextField(field: UITextField) {
        field.setTranslatesAutoresizingMaskIntoConstraints(false)
        field.placeholder = placeholders[field.tag]
        field.textAlignment = NSTextAlignment.Center;
        field.sizeToFit()
        self.view.addSubview(field)
    }
    
    func configureLayout() {
        var metrics = [
            "topMargin":30,
            "leftMargin": 0
        ]
        var titleTrailingTableViewConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-leftMargin-[carTitleField]-|", options: nil, metrics: metrics, views: ["carTitleField": carTitleField])
    
        var ownerTrailingTableViewConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-leftMargin-[carOwnerField]-|", options: nil, metrics: metrics, views: ["carOwnerField": carOwnerField])
        
        var topTableViewConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[carTitleField]-20-[carOwnerField]-(>=0)-|", options: nil, metrics: metrics, views: ["carOwnerField": carOwnerField, "carTitleField": carTitleField])
        self.view.addConstraints(titleTrailingTableViewConstraints)
        self.view.addConstraints(ownerTrailingTableViewConstraints)
        self.view.addConstraints(topTableViewConstraints)
    }
    
    // Keyboard
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let notyfications = NSNotificationCenter.defaultCenter()
        notyfications.addObserver(self, selector: "handleKeyboardWillShow", name: UIKeyboardWillShowNotification, object: nil)
        notyfications.addObserver(self, selector: "handleKeyboardWillHide", name: UIKeyboardWillShowNotification, object: nil)

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func handleKeyboardWillShow(paramNotification: NSNotification) {
        let userInfo: NSDictionary = paramNotification.userInfo
        let animationDurationObject: NSValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSValue
        let keyboardEndRectObject: NSValue = userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue

//        var animationDuration:  CMutableVoidPointer<Double> = nil
        var animationDuration: Double = 0.0
        var keyboardEndRect: CGRect = CGRectMake(0.0, 0.0, 0.0, 0.0)
        
        animationDurationObject.getValue(&animationDuration)
        keyboardEndRectObject.getValue(&keyboardEndRect)
    }
    
    //
    - (void) handleKeyboardWillShow:(NSNotification *)paramNotification{

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    /* Convert the frame from window's coordinate system to
    our view's coordinate system */
    keyboardEndRect = [self.view convertRect:keyboardEndRect
    fromView:window];
    /* Find out how much of our view is being covered by the keyboard */
    CGRect intersectionOfKeyboardRectAndWindowRect =
    CGRectIntersection(self.view.frame, keyboardEndRect);
    /* Scroll the scroll view up to show the full contents of our view */
    [UIView animateWithDuration:animationDuration animations:^{
    self.scrollView.contentInset =
    UIEdgeInsetsMake(0.0f,
    0.0f,
    intersectionOfKeyboardRectAndWindowRect.size.height,
    0.0f);
    //        [self.scrollView scrollRectToVisible:self.textField.frame animated:NO];
    [self.scrollView scrollRectToVisible:self.signInButton.frame animated:NO];
    }];
    }
    
    - (void) handleKeyboardWillHide:(NSNotification *)paramSender{
    NSDictionary *userInfo = [paramSender userInfo];
    NSValue *animationDurationObject =
    [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
    double animationDuration = 0.0;
    [animationDurationObject getValue:&animationDuration];
    [UIView animateWithDuration:animationDuration animations:^{
    self.scrollView.contentInset = UIEdgeInsetsZero;
    }];
    }
    
    - (BOOL) textFieldShouldReturn:(UITextField *)paramTextField{
    [paramTextField resignFirstResponder];
    return YES;
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureControls()
    }
    
}
