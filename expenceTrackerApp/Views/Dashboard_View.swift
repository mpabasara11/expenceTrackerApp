//
//  Dashboard_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-15.
//

import SwiftUI

struct Dashboard_View: View {
    
    @ObservedObject var settings_viewModel = Settings_ViewModel()
    
    
        var body: some View {
           
        
                
            TabView  {
                   
                OverView_View()
                    .tabItem { Image(systemName: "doc.text.fill")
                        Text("Insight")
                       
                    }
                
                
                ExpenseTracking_View()
                    .tabItem {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Expenses")
                    }
                
                Reports_View()
                    .tabItem { Image(systemName: "chart.bar.doc.horizontal.fill")
                        Text("Reports")
                            
                    }
                
                
                
                Settings_View()
                    .tabItem { Image(systemName: "gearshape.fill")
                        
                        Text("Settings")
                    }
      
            }
                
           
                
            
            .edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
        }
               
}
struct Dashboard_View_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard_View()
         //   .preferredColorScheme(.dark)
    }
}

