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
  //  @Published private var user_model : user_Model?
    @Published var notValidLogin: Bool = false
    @Published var isLoggedIn: Bool = false
    
    
    
    
    func login(email : String , password : String)
    {
        let user_model = user_Model(id: UUID(),email: email, password: password, confirmPassword: "")
        
        Auth.auth().signIn(withEmail: user_model.email, password: user_model.password) {
            result , error in
            
            
            if error != nil
            {
                print(error!.localizedDescription)
                self.notValidLogin = true
            }
            else
            {
             
                self.isLoggedIn = true
                self.notValidLogin = false
                
            }
        }
 
    }
    
    
}
