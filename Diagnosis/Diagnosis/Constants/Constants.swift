//
//  Constants.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import Foundation

class Constants {
    let BASE_URL = "http://www.madmenbarbershop.com"
    let API_INITIALIZE_API = ""
    
    let COLOR_PRIMARY = "#FF8E01"
    
    func initAPI() ->String {
        return BASE_URL + API_INITIALIZE_API
    }
}