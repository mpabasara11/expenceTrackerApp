//
//  ContentView.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-10.
//

import SwiftUI

struct Login_View: View {
    
    @ObservedObject var loginViewModel = Login_ViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert : Bool = false

    

 
    var body: some View {
        
        
        NavigationView
        {
            
     
            
            VStack
            {
                // Image("lgnpg1")
                        //             .resizable()
                           //          .aspectRatio(contentMode: .fit)
                         //            .frame(width: 100, height: 100)
                            //         .padding()
                        
                
                               Text("Sign In")
                                   .font(.largeTitle)
                                   .bold()
                                   .padding(.vertical)
                                .shadow(radius: 2)
                                .alert(isPresented:$loginViewModel.notValidLogin) {
                                    Alert(title: Text("Invalid Login"), message: Text("Please check your Email and Password "), dismissButton: .default(Text("OK"))
                                        {
                                       
                                    })}
                            
                
                
             
                                  
                       
                TextField("Email", text: $email)
                                 .textFieldStyle(RoundedBorderTextFieldStyle())
                                 .padding(.horizontal)
                                 .padding(.bottom, 5)
                                .shadow(radius: 2)
                
                             SecureField("Password", text: $password)
                                 .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                                .padding(.bottom, 20)
                                .shadow(radius: 2)
                            
                Button(action: {
                            
                    guard loginViewModel.login(email: email, password: password) else {
                                        return
                                    }
                                }) {
                
                                    Text("Login")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                    
                    
                    ////
                    
                  NavigationLink(
                    destination: CreateAccount_View(),
                    label: {
                       
                    
                                       Text("")
                                 
                    } )
                    /////
                    
                                    }

        
                
                
              NavigationLink(
                destination: CreateAccount_View(),
                label: {
                   
                
                                   Text("Create Account")
                                       .font(.headline)
                                       .foregroundColor(.blue)
                                       .padding()
                                       .frame(maxWidth: .infinity)
                                    .shadow(radius: 2)
                } )
                
                NavigationLink(
                    destination:ForgotPassword_View(),
                    label:{
                                     Text("Forgot Password?")
                                         .foregroundColor(.blue)
                                        .shadow(radius: 2)                                        .padding()
                })
                     
                             
                             Spacer()
         
            }
            .padding()
         
            
        }
    
    
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Login_View()
    }
}
}
