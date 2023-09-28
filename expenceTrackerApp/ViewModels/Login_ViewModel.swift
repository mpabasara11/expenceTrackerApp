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

    @Published var user_model = user_Model(email: "", password: "", confirmPassword: "")

    
    @Published var notValidLogin: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var loginId = ""
    
    private func clearFields()
    {
        user_model.email = ""
        user_model.password = ""
        user_model.confirmPassword = ""
    }
    
    //login with touch id
    func loginTouchId()
    {
        
    }
    
    
    
    
    //login with userName
    func login(email : String , password : String)
    {
  
        user_model.email = email
        user_model.password = password
        
        
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
                self.clearFields()
                
                //retrieve userid from firebase authentication db
                let auth = Auth.auth()
                let user = auth.currentUser
                let uid = user?.uid
              //  self.loginId = uid!
                
                let isLoggedIn = true
                
                var testUserid = "test user"
                
                
                UserDefaults.standard.set(testUserid,forKey: "userId")
                UserDefaults.standard.set(isLoggedIn,forKey: "isLoggedIn")
            }
        }
 
    }
    
    
}
