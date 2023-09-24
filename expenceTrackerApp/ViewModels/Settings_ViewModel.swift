//
//  Settings_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-23.
//

import Foundation
class Settings_ViewModel: ObservableObject
{

    //this model is used to write data
    @Published var userAllowance_modelWrite =  userAllowance_Model(userId: "user1", mnthlyGrocerries: 10, mnthlyEntertainment: 0, mnthlyRent: 0, mnthlyUtility: 0, mnthlyTransportation: 0, mnthlyDiningOut: 0, mnthlyShopping: 0, remainGrocerries: 0, remainEntertainment: 0, remainRent: 0, remainUtility: 0, remaiTransportation: 0, remainDiningOut: 0, remainShopping: 0)
    
    //this model is used to read data
   @Published var userAllowance_modelRead =  userAllowance_Model(userId: "user1", mnthlyGrocerries: 0, mnthlyEntertainment: 0, mnthlyRent: 0, mnthlyUtility: 0, mnthlyTransportation: 0, mnthlyDiningOut: 0, mnthlyShopping: 0, remainGrocerries: 0, remainEntertainment: 0, remainRent: 0, remainUtility: 0, remaiTransportation: 0, remainDiningOut: 0, remainShopping: 0)
    
    
    func clearFields()
    {
        userAllowance_modelWrite.userId = ""
        userAllowance_modelWrite.mnthlyGrocerries = 1000
        userAllowance_modelWrite.mnthlyEntertainment = 0
        userAllowance_modelWrite.mnthlyRent = 0
        userAllowance_modelWrite.mnthlyUtility = 0
        userAllowance_modelWrite.mnthlyTransportation = 0
        userAllowance_modelWrite.mnthlyDiningOut = 0
        userAllowance_modelWrite.mnthlyShopping = 0
    
    
    
  
    }
    
    
    
    public func updateSettings(userId: String,mnthlyGrocerries: Double,mnthlyEntertainment: Double,mnthlyRent: Double,mnthlyUtility: Double,mnthlyTransportation: Double,mnthlyDiningOut: Double,mnthlyShopping: Double)
    {
        
    }
    
    
    
}
