//
//  createAccount_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-10.
//

import SwiftUI


struct CreateAccount_View: View {
    
    @ObservedObject var creatAccountViewModel = CreateAccount_ViewModel()
    
  
    
    var body: some View {
        
        
        VStack {
                  Text("Create Account")
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical)
                    .shadow(radius: 2)
            
            TextField("Email", text: $creatAccountViewModel.user_model.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding(.horizontal)
                      .padding(.bottom, 10)
                    .shadow(radius: 2)
                    .alert(isPresented: $creatAccountViewModel.notValidMail) {
                        Alert(title: Text("Invalid Email"), message: Text("Please check your Email "), dismissButton: .default(Text("OK"))
                            {
                            creatAccountViewModel.dismissAlert()
                        })}
                
                    
            
            SecureField("Password", text: $creatAccountViewModel.user_model.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding(.horizontal)
                      .padding(.bottom, 10)
                    .shadow(radius: 2)
                    .alert(isPresented: $creatAccountViewModel.notValidPass) {
                        Alert(title: Text("Not a Valid Password"), message: Text("Please check your Password"), dismissButton: .default(Text("OK"))
                            {
                            creatAccountViewModel.dismissAlert()
                        })}
            
            
            
            SecureField("Confirm Password", text: $creatAccountViewModel.user_model.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                      .padding(.horizontal)
                      .padding(.bottom, 10)
                    .shadow(radius: 2)
                    .alert(isPresented: $creatAccountViewModel.notMatchedConfirmPass) {
                        Alert(title: Text("Mismatched Password"), message: Text("Please check your Password with Confirm Password "), dismissButton: .default(Text("OK"))
                            {
                            creatAccountViewModel.dismissAlert()
                        })}
                    

  
            
            
                  Button(action: {
                      // Perform account creation logic here
                      // You can validate the input and create an account
                    creatAccountViewModel.createAc(email: creatAccountViewModel.user_model.email, password: creatAccountViewModel.user_model.password, confirmpassword: creatAccountViewModel.user_model.confirmPassword)
                    
                  }) {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .alert(isPresented: $creatAccountViewModel.successAcCreate) {
                            Alert(title: Text("Success"), message: Text("Account has been created succesfully"), dismissButton: .default(Text("OK"))
                                {
                                creatAccountViewModel.dismissAlert()
                            })}                  }
                  .padding(.horizontal)
                  
                  Spacer()
              }
              .padding()
          }

        
        
}

struct createAccount_View_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount_View()
    }
}
