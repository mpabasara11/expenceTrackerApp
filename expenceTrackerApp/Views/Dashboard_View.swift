//
//  Dashboard_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-15.
//

import SwiftUI

struct Dashboard_View: View {
        var body: some View {
            
            
            TabView{
            NavigationView {
                           ExpenseTracking_View()
                        }
                            .tabItem {
                                Label("Home", systemImage: "house")
                            }

                        NavigationView {
                            ExpenseTracking_View()
                        }
                            .tabItem {
                                Label("Expense Tracking", systemImage: "star")
                            }

                        NavigationView {
                           Settings_View()
                        }
                            .tabItem {
                                Label("Settings", systemImage: "gear")
                            }
                    
            }
                
            }        
}
struct Dashboard_View_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard_View()
            .preferredColorScheme(.dark)
    }
}

