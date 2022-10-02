//
//  Data.swift
//  LogInApp
//
//  Created by Kazakov Danil on 02.10.2022.
//

import Foundation


class Account {
    var loginAndPassword : [String:String]
    
    
    init(loginAndPassword: [String : String]) {
        self.loginAndPassword = loginAndPassword
    }


}


var first: Account = Account(loginAndPassword: ["User1":"User2"])
