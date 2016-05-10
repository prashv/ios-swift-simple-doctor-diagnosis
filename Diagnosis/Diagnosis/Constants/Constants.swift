//
//  Constants.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import Foundation

class Constants {
    
    let BASE_URL = "http://"
    let API_REFRESH_DIAGNOSIS = ""
    let API_POST_DIAGNOSIS = ""
    
    func refreshDiagnosis() ->String {
        return BASE_URL + API_REFRESH_DIAGNOSIS
    }

    func postDiagnosis() ->String {
        return BASE_URL + API_POST_DIAGNOSIS
    }

}