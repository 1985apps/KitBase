//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


class KitBaseMenuView : UIView {
    
    var delegate : KitMenuDelegate?
    
    init(){
        super.init(frame: CGRect.zero)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.backgroundColor = UIColor.greenColor()
        let b = KitButton(title: "Call")
        self.addSubview(b)
        b.snp_makeConstraints { (make) -> Void in
            make.left.centerY.equalTo(self)
        }
        
        b.addTarget(self, action: "callme:", forControlEvents: .TouchUpInside)
    }

    func callme(sender: AnyObject?){
        self.delegate?.loadContentViewController(ViewController2())
    }
    
}
