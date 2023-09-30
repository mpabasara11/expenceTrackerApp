//
//  Reports_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-28.
//

import SwiftUI

struct Reports_View: View {
    
    @ObservedObject var report_viewModel = Report_ViewModel()
    
    var body: some View {
        
     
        
        
        NavigationView{
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
            .navigationBarTitle("Reports",displayMode: .automatic)
            
            
         Button(action: {
             
            report_viewModel.run()
             
  
             
         }) {
         
                             Text("Login")
                             .font(.headline)
                             .foregroundColor(.white)
                             .padding()
                             .frame(maxWidth: .infinity)
                             .background(Color.blue)
                             .cornerRadius(10)
                             .shadow(radius: 5)
             
         
                             }
 
            
            
        }
        
        .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
    }
}

struct Reports_View_Previews: PreviewProvider {
    static var previews: some View {
        Reports_View()
    }
}
