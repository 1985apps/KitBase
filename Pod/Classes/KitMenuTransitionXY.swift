//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


class KitMenuTransitionXY : KitMenuTransition {
    
    override func open(){
        UIView.animateWithDuration(KitConfig.Menu.transitionDuration) { () -> Void in
            var frame = (self.mainController?.contentNavigationController!.view.frame)! as CGRect
            frame.origin.x = 200
            frame.origin.y = 200
            self.mainController?.contentNavigationController!.view.frame = frame
        }
    }
    
    
}
