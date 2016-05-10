//
//  ToddsSyndrome.swift
//  ToddsSyndrome
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Diagnosis. All rights reserved.
//

import UIKit
import CoreData
import Foundation

public class ToddsSyndrome {
    
    public init() {
        print("ToddsSyndrome Framework has been initialised")
    }
    
    public func probability(age:Int, isMale: Int, hasMigraines: Int, usesDrugs: Int) -> Int {
        var result: Int = 0
        
        if(age <= 15){
            result += 25
        } else if(isMale == 1){
            result += 25
        } else if(hasMigraines == 1){
            result += 25
        } else if(usesDrugs == 1){
            result += 25
        }
        
        return result
    }
}