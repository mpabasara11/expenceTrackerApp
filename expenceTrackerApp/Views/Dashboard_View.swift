//
//  Dashboard_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-15.
//

import SwiftUI

struct Dashboard_View: View {
    

    
    
        var body: some View {
            
            TabView  {
                   
                ExpenseTracking_View()
                    .tabItem { Image(systemName: "folder.fill")
                        Text("Expenses")
                    }
                
                
                ExpenseTracking_View()
                    .tabItem { Image(systemName: "folder.fill")
                        Text("Expenses")
                    }
                
                
                Settings_View()
                    .tabItem { Image(systemName: "folder.fill")
                        Text("Expenses")
                    }
                
                
                
            }.navigationBarHidden(true)
            
   
            
        }
               
}
struct Dashboard_View_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard_View()
         //   .preferredColorScheme(.dark)
    }
}

