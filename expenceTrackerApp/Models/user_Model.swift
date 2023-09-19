//
//  user_Model.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-12.
//

import Foundation

struct user_Model : Identifiable
{
    var id = UUID()
    var email : String
    var password : String
    var confirmPassword : String
    
    init(email: String,password: String,confirmPassword: String)
   {
    
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
    
  
    
}
