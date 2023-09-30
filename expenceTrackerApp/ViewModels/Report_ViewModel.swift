//
//  Report_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-30.
//
import Firebase
import Foundation
class Report_ViewModel : ObservableObject
{
    
    public func run() {
      
    
        do
        {
         
            try Auth.auth().signOut()
    
        }catch let error
        {
            
        }
        
        
        
        
       
       
    }
    
    
}
