//
//  Settings_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-23.
//

import SwiftUI

struct Settings_View: View {
    
 
    @ObservedObject var settings_viewModel = Settings_ViewModel()
    
    
    //custom numberformatter for removing zero on textboxes
    let quentityFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        formatter.allowsFloats = false
      //  formatter.allowsFloats = true
    
        return formatter
    }()
    
    
   
 
    
    var body: some View {
        
      
        
       
        NavigationView{
        Form
        {
            Section(header: Text("Current"), footer: Text("View your current allowance settings"))
                {
                HStack
                  {
                  Text("Groceries")
                    Spacer()
                    
                    Text("Rs. \(settings_viewModel.userAllowance_modelRead.mnthlyGrocerries,specifier: "%.2f")")
                    
                  }
                HStack
                  {
                  Text("Entertainment")
                    Spacer()
                    Text("Rs. \(settings_viewModel.userAllowance_modelRead.mnthlyEntertainment,specifier: "%.2f")")
                    
                  }
                HStack
                  {
                  Text("Rent")
                    Spacer()
                    Text("Rs. \(settings_viewModel.userAllowance_modelRead.mnthlyRent,specifier: "%.2f")")
                  }
                HStack
                  {
                  Text("Utilities")
                    Spacer()
                    Text("Rs. \(settings_viewModel.userAllowance_modelRead.mnthlyUtility,specifier: "%.2f")")
                    
                  }
                HStack
                  {
                  Text("Transportation")
                    Spacer()
                    Text("Rs. \(settings_viewModel.userAllowance_modelRead.mnthlyTransportation,specifier: "%.2f")")
                  }
                HStack
                  {
                  Text("Dining Out")
                    Spacer()
                    Text("Rs. \(settings_viewModel.userAllowance_modelRead.mnthlyDiningOut,specifier: "%.2f")")
                  }
                HStack
                  {
                  Text("Shopping")
                    Spacer()
                    Text("Rs. \(settings_viewModel.userAllowance_modelRead.mnthlyShopping,specifier: "%.2f")")
                  }
                
               
                }
            
            Section(header: Text("Update"), footer: Text("Update your each allownce settings"))
                {
                
                
            
           

                TextField("Groceries",value: $settings_viewModel.userAllowance_modelWrite.mnthlyGrocerries,formatter:quentityFormatter).keyboardType(.decimalPad)
                
              
                    
                
                TextField("Entertainment",value: $settings_viewModel.userAllowance_modelWrite.mnthlyEntertainment,formatter:quentityFormatter).keyboardType(.decimalPad)
                
                TextField("Rent",value: $settings_viewModel.userAllowance_modelWrite.mnthlyRent,formatter:quentityFormatter).keyboardType(.decimalPad)
                
                TextField("Utilities",value: $settings_viewModel.userAllowance_modelWrite.mnthlyUtility,formatter:quentityFormatter).keyboardType(.decimalPad)
                
                TextField("Transportation",value: $settings_viewModel.userAllowance_modelWrite.mnthlyTransportation,formatter:quentityFormatter).keyboardType(.decimalPad)
                
                TextField("Dining Out",value: $settings_viewModel.userAllowance_modelWrite.mnthlyDiningOut,formatter:quentityFormatter).keyboardType(.decimalPad)
                
                TextField("Shopping",value: $settings_viewModel.userAllowance_modelWrite.mnthlyShopping,formatter:quentityFormatter).keyboardType(.decimalPad)
                
                    //not success alert
                    .alert(isPresented: $settings_viewModel.notSuccessOperation) {
                        Alert(title: Text("Something Happened!"), message: Text("Could not update the allowance.plese try again"), dismissButton: .default(Text("OK"))
                            {
                           
                        })}
                    
                    //success alert
                    .alert(isPresented: $settings_viewModel.successOperation) {
                        Alert(title: Text("Success"), message: Text("Allowance updated successfully"), dismissButton: .default(Text("OK"))
                            {
                            
                            //setting the user id before calling the method
                            settings_viewModel.userAllowance_modelRead.userId = settings_viewModel.usdUserId ?? ""
                            
                            
                            settings_viewModel.clearFields()
                            settings_viewModel.loadLabels( userId: settings_viewModel.userAllowance_modelRead.userId)
                            
                        })}
                
                }
            
            
          
            
            Section{
                Button(action: {
                    
                    
                    //setting the user id before calling the method
                    settings_viewModel.userAllowance_modelWrite.userId =  settings_viewModel.usdUserId ?? ""
                    
                    //setting the date before calling the method
                    let todayDate = Date()
                    
                    settings_viewModel.updateSettings(userId: settings_viewModel.userAllowance_modelWrite.userId, mnthlyGrocerries: settings_viewModel.userAllowance_modelWrite.mnthlyGrocerries, mnthlyEntertainment: settings_viewModel.userAllowance_modelWrite.mnthlyEntertainment, mnthlyRent: settings_viewModel.userAllowance_modelWrite.mnthlyRent, mnthlyUtility: settings_viewModel.userAllowance_modelWrite.mnthlyUtility, mnthlyTransportation: settings_viewModel.userAllowance_modelWrite.mnthlyTransportation, mnthlyDiningOut: settings_viewModel.userAllowance_modelWrite.mnthlyDiningOut, mnthlyShopping: settings_viewModel.userAllowance_modelWrite.mnthlyShopping,date: todayDate)
                   
                }){
                    Text("Update")
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
               
                }.buttonStyle(BorderlessButtonStyle())
                
                Button(action: {
                    settings_viewModel.clearFields()
                }){
                    Text("Clear All")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
           
                } .buttonStyle(BorderlessButtonStyle())           }
                
                
            Section
            {
                Button(action: {
                    settings_viewModel.sighOut()
                }){
                    Text("Sign Out")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
           
                } .buttonStyle(BorderlessButtonStyle())               }
            
            
            
        }.navigationTitle("Settings")
        
        }
    }
}

struct Settings_View_Previews: PreviewProvider {
    static var previews: some View {
        Settings_View()
            .preferredColorScheme(.dark)
            
    }
}
