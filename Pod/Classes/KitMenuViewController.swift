//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


class KitMenuViewController : UIViewController, KitMenuDelegate  {
    
    var menuView: KitBaseMenuView?
    var contentNavigationController: UINavigationController?
    var transition = KitMenuTransition()
    var rootViewController = KitBaseViewController()
    
    init(menuView: KitBaseMenuView, rootViewController: KitBaseViewController, transition: KitMenuTransition = KitMenuTransition()){
        
        super.init(nibName: nil, bundle: nil)
        
        self.menuView = menuView
        self.rootViewController = rootViewController
        self.transition = transition
        self.transition.setController(self)
        
        // SET THE DELEGATE TO THE MENU VIEW
        self.menuView!.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        self.view.addSubview(self.menuView!)
        self.menuView!.frame = self.view.frame
        setupNavigationController()
    }
    
    func setupNavigationController(){
        self.contentNavigationController = UINavigationController(rootViewController: self.rootViewController)

        self.addChildViewController(self.contentNavigationController!)
        self.view.addSubview(self.contentNavigationController!.view)
        self.contentNavigationController!.didMoveToParentViewController(self)
        
        // SET THE FRAME TO THE PARENT FRAME
        // THIS DOES NOT USE AUTOLAYOUT - AS THERE WILL BE ANIMATIONS ON THE FRAME
        self.contentNavigationController!.view.frame = self.view.frame
        
        
        // SETUP THE BACKGROUND COLOR OF NAVBAR
        self.contentNavigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.contentNavigationController!.navigationBar.shadowImage = UIImage()
        self.contentNavigationController!.navigationBar.translucent = true
        self.contentNavigationController?.navigationBar.tintColor = UIColor.redColor()
    }
    
    func toggleMenu(){
        self.transition.toggle()
    }
    
    
    /* DELEGATE METHODS */
    func loadContentViewController(viewController: KitBaseViewController) {
        let last = self.contentNavigationController?.viewControllers.last as! KitBaseViewController
        last.pushViewController(viewController)
        self.transition.close()
    }
    

    
}
