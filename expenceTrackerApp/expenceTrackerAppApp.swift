//
//  expenceTrackerAppApp.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-10.
//

import SwiftUI
import Firebase

@main
struct expenceTrackerAppApp: App {
   
  
    init() {
        
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
          // Login_View()
            SplashScreen_View()
        }
    }
}
