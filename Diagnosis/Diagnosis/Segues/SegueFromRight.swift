//
//  SegueFromRight.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class SegueFromRight: UIStoryboardSegue {
    
    /*
     override func perform() {
     let src: UIViewController = self.sourceViewController
     let dst: UIViewController = self.destinationViewController
     let transition: CATransition = CATransition()
     let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
     transition.duration = 0.25
     transition.timingFunction = timeFunc
     transition.type = kCATransitionPush
     transition.subtype = kCATransitionFromRight
     src.navigationController!.view.layer.addAnimation(transition, forKey: kCATransition)
     src.navigationController!.pushViewController(dst, animated: false)
     }
     */
    
    override func perform() {
        // Assign the source and destination views to local variables.
        let firstVCView = self.sourceViewController.view as UIView!
        let secondVCView = self.destinationViewController.view as UIView!
        
        // Get the screen width and height.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        secondVCView.frame = CGRectMake(screenWidth, 0.0, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, -screenWidth, 0.0)
            secondVCView.frame = CGRectOffset(secondVCView.frame, -screenWidth, 0.0)
            
        }) { (Finished) -> Void in
            self.sourceViewController.presentViewController(self.destinationViewController ,
                                                            animated: false,
                                                            completion: nil)
        }
        
    }
    
}