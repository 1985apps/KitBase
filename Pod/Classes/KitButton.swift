//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


class KitButton : UIButton {
    
    init(title: String){
        super.init(frame: CGRect.zero)
        self.setTitle(title, forState: .Normal)
        setup()
        style()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.backgroundColor = KitConfig.Color.red
        self.layer.cornerRadius = 2
        self.titleLabel?.font = KitConfig.Font.get(.Bold, size: 14)
    }
    
    // THIS FUNCTION SHOULD BE OVERRIDDEN IN CASE OF SUB CLASSES
    func style(){

    }
    
    
    // Hollow Button
    class Hollow : KitButton {
        
        override func style(){
            super.style()
            self.backgroundColor = UIColor.clearColor()
            self.layer.borderWidth = 1
            self.layer.borderColor = KitConfig.Color.cream.CGColor
        }
        
    }
    
}
