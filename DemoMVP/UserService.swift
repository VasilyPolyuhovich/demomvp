//
//  UserService.swift
//  DemoMVP
//
//  Created by Vasyl Polyuhovich on 6/30/17.
//  Copyright © 2017 Vasyl Polyuhovich. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService {
    
    func getUsers(_ callBack:@escaping ([User]?) -> Void){
        
        Alamofire.request("http://www.mocky.io/v2/5955ec902900009a01cd70db").responseJSON { response in
            if let json = response.result.value {
                if let array = JSON(json).array {
                    var users : [User]? = []
                    for user in array {
                        users?.append(User(json: user))
                    }
                  callBack(users)
                }
            }
        }
    }
}
