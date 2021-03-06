//
//  FormViewControllerWithBackButton.swift
//  Auto Stop Race
//
//  Created by Robert Ignasiak on 28.03.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import UIKit
import Eureka

class FormViewControllerWithBackButton: FormViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupViews()
    }
    
    func setupViews() {
        
        setupNavigationBar()
        setupNavigationMenuButton()
    }
    
    func setupNavigationBar() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: self.navigationController!.view.frame.height))
        titleLabel.clipsToBounds = true
        navigationItem.titleView = titleLabel
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.light)
    }
    
    func setupNavigationMenuButton() {
        let menuImage = UIImage(named: "ic_keyboard_backspace_white")?.withRenderingMode(.alwaysOriginal)
        let menuBarButtonItem = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(popBack))
        navigationItem.leftBarButtonItem = menuBarButtonItem
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        let swipeBackGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(popBack))
        swipeBackGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeBackGestureRecognizer)
    }
    
    func swipeBackAction(sender: UISwipeGestureRecognizer) {
        _ = navigationController?.popViewController(animated: false)
    }
    
    @objc func popBack() {
        _ = navigationController?.popViewController(animated: false)
    }
    
}
