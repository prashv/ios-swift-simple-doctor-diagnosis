//
//  CommonFunctions.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import Foundation
import UIKit

class CommonFunctions {
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}