//
//  forgotPassword_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-10.
//

import SwiftUI

struct ForgotPassword_View: View {

    @ObservedObject var forgotPassword_ViewModel = ForgotPassword_ViewModel()
    

    
    var body: some View {
        
        VStack {
                  Text("Forgot Password")
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical)
                    .shadow(radius: 2)
                    .alert(isPresented: $forgotPassword_ViewModel.successReset) {
                        Alert(title: Text("Success"), message: Text("Password reset link sent successfully"), dismissButton: .default(Text("OK"))
                            {
                            forgotPassword_ViewModel.dismissAlert()
                        })}
            
            
            
            
            TextField("Email Address", text: $forgotPassword_ViewModel.user_model.email)
              .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
                .shadow(radius: 2)
            
                .alert(isPresented:$forgotPassword_ViewModel.notValidMail) {
                    Alert(title: Text("Invalid Email"), message: Text("Please check your Email "), dismissButton: .default(Text("OK"))
                        {
                        forgotPassword_ViewModel.dismissAlert()
                    })}
            
            
            

        
        

              Button(action: {
            
                
                forgotPassword_ViewModel.resPass(email: forgotPassword_ViewModel.user_model.email)
                
              }) {
                Text("Send")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
              }
              .padding(.horizontal)
              .shadow(radius: 5)}
    }

struct forgotPassword_View_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword_View()
            
    }
}
}
