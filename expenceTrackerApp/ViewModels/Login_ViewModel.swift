//
//  login_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-12.
//

import Foundation
import Firebase


class Login_ViewModel : ObservableObject
{
    
    @Published var notValidLogin: Bool = false
    
    
    
    
    func login(email : String , password : String) -> (Bool)
    {
       // var retVal: Bool = false

        Auth.auth().signIn(withEmail: email, password: password) {
            result , error in
            
            
            if error != nil
            {
                print(error!.localizedDescription)
                self.notValidLogin = true
            }
            else
            {
             
           //   retVal = true
                self.notValidLogin = false            }
        }
  //  return retVal
        return true
    }
    
    
}
