//
//  Constants.swift
//  Diagnosis
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Doctor. All rights reserved.
//

import Foundation

class Constants {
    
    let BASE_URL = "http://ec2-54-254-211-253.ap-southeast-1.compute.amazonaws.com:3000"
    let API_REFRESH_DIAGNOSIS = "/api/tasks/"
    let API_POST_DIAGNOSIS = "/api/tasks/"
    
    func refreshDiagnosis() ->String {
        return BASE_URL + API_REFRESH_DIAGNOSIS
    }

    func postDiagnosis() ->String {
        return BASE_URL + API_POST_DIAGNOSIS
    }

}