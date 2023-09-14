//
//  ContentView.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-10.
//

import SwiftUI

struct Login_View: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var showPasswordReset = false
    
    
    //  Example login validation function
        func isValidLogin() -> Bool {
            // Add your own logic to validate the login here
            return email == "your_username" && password == "your_password"
        }
 
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
                                .shadow(radius: 2)                              //     .frame(maxWidth:.infinity,alignment: .leading)
                                  
                       
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
                                // Add your login logic here
                                if isValidLogin() {
                                    // Navigate to the next screen or perform the desired action
                                } else {
                                    showAlert = true
                                }
                            }) {
                                Text("Login")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)                            }
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("Invalid Login"), message: Text("Please check your Email and password and try again."), dismissButton: .default(Text("OK")))
                            }
                
                
              NavigationLink(
                destination: CreateAccount_View(),
                label: {
                   
                
                                   Text("Create Account")
                                       .font(.headline)
                                       .foregroundColor(.blue) // You can customize the color
                                       .padding()
                                       .frame(maxWidth: .infinity)
                                    .shadow(radius: 2)
                } )
                
                NavigationLink(
                    destination:ForgotPassword_View(),
                    label:{
                                     Text("Forgot Password?")
                                         .foregroundColor(.blue)
                                        .shadow(radius: 2)                                     //    .padding()
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
