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
    @Published var isLoggedIn: Bool = false
    
    
    
    
    func login(email : String , password : String)
    {
       

        Auth.auth().signIn(withEmail: email, password: password) {
            result , error in
            
            
            if error != nil
            {
                print(error!.localizedDescription)
                self.notValidLogin = true
            }
            else
            {
             
                self.isLoggedIn = true
                self.notValidLogin = false            }
        }
 
    }
    
    
}
