//
//  createAccount_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-12.
//

import Foundation
import Firebase




class CreateAccount_ViewModel : ObservableObject
{
    
        @Published var email: String = ""
        @Published var notValidMail: Bool = false
        @Published var notValidPass: Bool = false
        @Published var notMatchedConfirmPass: Bool = false
        @Published var successAcCreate: Bool = false
    
    
    func dismissAlert()
    {
        notValidMail = false
        notValidPass = false
        notMatchedConfirmPass = false
        successAcCreate = false
        
    }
    
    
    
    private func isValidMail(email : String)
    {
        let emailRegexPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegexPattern)
        notValidMail = !emailPredicate.evaluate(with: email)
      
    }
    
    private func isValidPassword(password : String)
    {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        notValidPass = !passwordPredicate.evaluate(with: password)
        
    }
    
    private func isConfirmPassValid(password : String , confirmPassword : String)
    {
       notMatchedConfirmPass = !(password == confirmPassword)
        
    }
    
    

    
     
    func createAc(email : String , password : String , confirmpassword : String)
   {
        isValidMail(email : email)
        isValidPassword(password : password)
        isConfirmPassValid(password : password, confirmPassword : confirmpassword)
        
        
      
        if notValidMail
        {
            
        }
        else
        {
            if notValidPass
            {
                
            }
            else
            {
                
                if notMatchedConfirmPass
                {
                    
                }
                else
                {
                    Auth.auth().createUser(withEmail: email, password: password) { result, error in
                        if error != nil
                        {
                            print(error!.localizedDescription)
                        }
                        else
                        {
                            self.successAcCreate = true
                          
                        }
                        
                    }
                }
                
            }
               
        }
        
        
    
   
   }
    
    
}
