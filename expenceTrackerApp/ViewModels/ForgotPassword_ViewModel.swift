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
    
    
    
    func resPass(email : String )
   {
        isValidMail(email : email)
     
        
      
        if notValidMail
        {
            
        }
        else
        {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    self.successReset = true
                  
                }            }
        }
    }
    
    
}
