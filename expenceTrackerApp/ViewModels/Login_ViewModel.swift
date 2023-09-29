//
//  login_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-12.
//

import Foundation
import Firebase
import LocalAuthentication


class Login_ViewModel : ObservableObject
{

    @Published var user_model = user_Model(email: "", password: "", confirmPassword: "")
    
    
    @Published var useTouchId = UserDefaults.standard.bool(forKey: "useTouchId")
    @Published var savedUderId = UserDefaults.standard.string(forKey: "userId")

    
    @Published var notValidLogin: Bool = false
    @Published var isLoggedIn: Bool = false
  //  @Published var loginId = ""
    
    

    
 
    
    
    
    private func clearFields()
    {
        user_model.email = ""
        user_model.password = ""
        user_model.confirmPassword = ""
    }
    
    
     func clearAutoLoginStates()
    {
        isLoggedIn = false
    }
    
    //login with touch id
   public func loginTouchId()
    {
        let context = LAContext()

        var error: NSError?

        // Check if the device supports Touch ID
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate with Touch ID"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // Authentication succeeded
                   
                        self.isLoggedIn = true
                        
                    } else {
                        
                        self.isLoggedIn = false
                        // Authentication failed
                        if let error = authenticationError as? LAError {
                            // Handle the error, show an error message to the user
                            switch error.code {
                            case .userCancel:
                                print("User canceled authentication")
                            case .userFallback:
                                print("User selected fallback option")
                                // can implement a custom authentication method here if needed
                            default:
                                print("Authentication failed: \(error.localizedDescription)")
                            }
                        }
                    }
                }
            }
        } else {
            // Touch ID is not available on this device
            print("Touch ID not available")
        }
    }
    
   public func loginWithPw(email : String , password : String)
    {
        user_model.email = email
        user_model.password = password
        
        
        Auth.auth().signIn(withEmail: user_model.email, password: user_model.password) {
            result , error in
            
            
            if error != nil
            {
               
           

                print(error!.localizedDescription)
                self.notValidLogin = true
                self.isLoggedIn = false
                
           
            }
            else
            {
             
         
                //retrieve userid from firebase authentication db
                let auth = Auth.auth()
                let user = auth.currentUser
                let uid = user?.uid
           //     self.loginId = uid!
                
       
                
           //     var testUserid = "test user"
                
                
                UserDefaults.standard.set(uid,forKey: "userId")
                
                self.isLoggedIn = true
                 self.notValidLogin = false
            //     self.clearFields()
                 
                
      
            }
        }
    }
    
    
    //login with userName
    func login(email : String , password : String)
    {
  
        if useTouchId == true
        {
            if savedUderId == ""
            {
                let value = false
                UserDefaults.standard.setValue(value, forKey: "useTouchId")
                
            }
            else
            {
                loginTouchId()
            }
        }
        else
        {
            loginWithPw(email: email, password: password)
        }
 
    }
    
    
}
