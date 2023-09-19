//
//  forgotPassword_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-13.
//

import Foundation
import Firebase


class ForgotPassword_ViewModel: ObservableObject
{
    @Published var user_model = user_Model(email: "", password: "", confirmPassword: "")
    
    @Published var notValidMail: Bool = false
    @Published var successReset: Bool = false
    
    func dismissAlert()
    {
        notValidMail = false
        successReset = false
        
    }
    
    
    
    private func isValidMail(email : String)
    {
        let emailRegexPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegexPattern)
        notValidMail = !emailPredicate.evaluate(with: email)
      
    }
    
    private func clearFields()
    {
        user_model.email = ""
        user_model.password = ""
        user_model.confirmPassword = ""
    }
    
    
    
    func resPass(email : String )
   {
        user_model.email = email
        
        
        isValidMail(email : user_model.email)
     
        
      
        if notValidMail
        {
            
        }
        else
        {
            Auth.auth().sendPasswordReset(withEmail: user_model.email) { error in
                if error != nil
                {
                    print(error!.localizedDescription)
                
                }
                else
                {
                    self.successReset = true
                    self.clearFields()
                }
                
            }
        }
    }
    
    
}
