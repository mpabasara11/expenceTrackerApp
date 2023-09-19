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
     //   @Published private var user_model : user_Model?
       
  // @Published var email: String = ""
   // @Published var password: String = ""
   // @Published var confirmPassword: String = ""
    
    
    @Published var user_model = user_Model(email: "", password: "", confirmPassword: "")
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
    
    
    private func clearFields()
    {
        user_model.email = ""
        user_model.password = ""
        user_model.confirmPassword = ""
    }
    

    
     
    func createAc(email : String , password : String , confirmpassword : String)
   {
    
        
        isValidMail(email : user_model.email)
        isValidPassword(password : user_model.password)
        isConfirmPassValid(password : user_model.password , confirmPassword: user_model.confirmPassword)
        
      
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
                    Auth.auth().createUser(withEmail: user_model.email, password: user_model.password)
                    { result, error in
                        if error != nil
                        {
                            print(error!.localizedDescription)
                        }
                        else
                        {
                            self.successAcCreate = true
                            self.clearFields()
                          
                        }
                        
                    }
                }
                
            }
               
        }
        
        
    
   
   }
    
    
}
