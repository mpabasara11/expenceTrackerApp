//
//  Settings_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-23.
//

import SwiftUI

struct Settings_View: View {
    
    @State var x = "nigga"
    @State var y = 12.2
    

    
    var body: some View {
       
        NavigationView{
        Form
        {
            Section(header: Text("Current"))
                {
                HStack
                  {
                  Text("Groceries")
                    Spacer()
                    Text("(x)")
                    
                  }
                HStack
                  {
                  Text("Entertainment")
                    Spacer()
                    Text("(x)")
                    
                  }
                HStack
                  {
                  Text("Rent")
                    Spacer()
                    Text("(x)")
                    
                  }
                HStack
                  {
                  Text("Utilities")
                    Spacer()
                    Text("(x)")
                    
                  }
                HStack
                  {
                  Text("Transportation")
                    Spacer()
                    Text("(x)")
                    
                  }
                HStack
                  {
                  Text("Dining Out")
                    Spacer()
                    Text("(x)")
                    
                  }
                HStack
                  {
                  Text("Shopping")
                    Spacer()
                    Text("(x)")
                    
                  }
                
               
                }
            
            Section(header: Text("Update"))
                {

                TextField("Groceries",value: $y,formatter:NumberFormatter()).keyboardType(.decimalPad)
                
                TextField("Entertainment",value: $y,formatter:NumberFormatter()).keyboardType(.decimalPad)
                
                TextField("Rent",value: $y,formatter:NumberFormatter()).keyboardType(.decimalPad)
                
                TextField("Utilities",value: $y,formatter:NumberFormatter()).keyboardType(.decimalPad)
                
                TextField("Transportation",value: $y,formatter:NumberFormatter()).keyboardType(.decimalPad)
                
                TextField("Dining Out",value: $y,formatter:NumberFormatter()).keyboardType(.decimalPad)
                
                TextField("Shopping",value: $y,formatter:NumberFormatter()).keyboardType(.decimalPad)
                }
            
            Section{
                Button(action: {
                   
                   
                }){
                    Text("Update")
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                       // .padding()
                       // .background(Color.blue)
                    //    .cornerRadius(10)
                     //   .shadow(radius:5)
                }.buttonStyle(BorderlessButtonStyle())
                
                Button(action: {
                    
                }){
                    Text("Clear All")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                       // .padding()
                    //   .background(Color.red)
                     //   .cornerRadius(10)
                     //   .shadow(radius:5)
                } .buttonStyle(BorderlessButtonStyle())           }
    
            
            
            
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
