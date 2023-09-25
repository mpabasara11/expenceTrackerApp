//
//  Settings_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-23.
//

import Foundation
class Settings_ViewModel: ObservableObject
{

    //this model is used to take input data
    @Published var userAllowance_modelWrite =  userAllowance_Model(userId: "", mnthlyGrocerries: 0, mnthlyEntertainment: 0, mnthlyRent: 0, mnthlyUtility: 0, mnthlyTransportation: 0, mnthlyDiningOut: 0, mnthlyShopping: 0, remainGrocerries: 0, remainEntertainment: 0, remainRent: 0, remainUtility: 0, remaiTransportation: 0, remainDiningOut: 0, remainShopping: 0)
    
    //this model is used to read data
   @Published var userAllowance_modelRead =  userAllowance_Model(userId: "", mnthlyGrocerries: 0, mnthlyEntertainment: 0, mnthlyRent: 0, mnthlyUtility: 0, mnthlyTransportation: 0, mnthlyDiningOut: 0, mnthlyShopping: 0, remainGrocerries: 0, remainEntertainment: 0, remainRent: 0, remainUtility: 0, remaiTransportation: 0, remainDiningOut: 0, remainShopping: 0)
    
    //this model is used to send  data to DB
   @Published var userAllowance_modelSendToDb =  userAllowance_Model(userId: "", mnthlyGrocerries: 0, mnthlyEntertainment: 0, mnthlyRent: 0, mnthlyUtility: 0, mnthlyTransportation: 0, mnthlyDiningOut: 0, mnthlyShopping: 0, remainGrocerries: 0, remainEntertainment: 0, remainRent: 0, remainUtility: 0, remaiTransportation: 0, remainDiningOut: 0, remainShopping: 0)
    
    
    
    //validation messages triggers
    @Published var notValidGrocery : Bool = false
    
    
    func clearFields()
    {
        userAllowance_modelWrite.userId = ""
        userAllowance_modelWrite.mnthlyGrocerries = 0
        userAllowance_modelWrite.mnthlyEntertainment = 0
        userAllowance_modelWrite.mnthlyRent = 0
        userAllowance_modelWrite.mnthlyUtility = 0
        userAllowance_modelWrite.mnthlyTransportation = 0
        userAllowance_modelWrite.mnthlyDiningOut = 0
        userAllowance_modelWrite.mnthlyShopping = 0
    
    
    
  
    }
    
    //validate inputs and add necessary missing values to the model
    private func validateGroceries(userId: String,mnthlyGrocerries: Double,mnthlyEntertainment: Double,mnthlyRent: Double,mnthlyUtility: Double,mnthlyTransportation: Double,mnthlyDiningOut: Double,mnthlyShopping: Double)  {
        
        userAllowance_modelSendToDb.userId = userId
        
   
        if userAllowance_modelWrite.mnthlyGrocerries.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyGrocerries = userAllowance_modelRead.mnthlyGrocerries
        }else
        {
            userAllowance_modelSendToDb.mnthlyGrocerries = userAllowance_modelWrite.mnthlyGrocerries
        }
        
        if userAllowance_modelWrite.mnthlyEntertainment.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyEntertainment = userAllowance_modelRead.mnthlyEntertainment
        }else
        {
            userAllowance_modelSendToDb.mnthlyEntertainment = userAllowance_modelWrite.mnthlyEntertainment

        }

        if userAllowance_modelWrite.mnthlyRent.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyRent = userAllowance_modelRead.mnthlyRent
        }else
        {
            userAllowance_modelSendToDb.mnthlyRent = userAllowance_modelWrite.mnthlyRent
        }

        if userAllowance_modelWrite.mnthlyUtility.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyUtility = userAllowance_modelRead.mnthlyUtility
        }else
        {
            userAllowance_modelSendToDb.mnthlyUtility = userAllowance_modelWrite.mnthlyUtility

        }

        if userAllowance_modelWrite.mnthlyTransportation.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyTransportation = userAllowance_modelRead.mnthlyTransportation
        }else
        {
            userAllowance_modelSendToDb.mnthlyTransportation = userAllowance_modelWrite.mnthlyTransportation
        }

        if userAllowance_modelWrite.mnthlyDiningOut.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyDiningOut = userAllowance_modelRead.mnthlyDiningOut
        }else
        {
            userAllowance_modelSendToDb.mnthlyDiningOut = userAllowance_modelWrite.mnthlyDiningOut
        }

        if userAllowance_modelWrite.mnthlyShopping.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyShopping = userAllowance_modelRead.mnthlyShopping
        }else
        {
            userAllowance_modelSendToDb.mnthlyShopping = userAllowance_modelWrite.mnthlyShopping
        }

        
     
       }
    

    
  
    
    
    public func updateSettings(userId: String,mnthlyGrocerries: Double,mnthlyEntertainment: Double,mnthlyRent: Double,mnthlyUtility: Double,mnthlyTransportation: Double,mnthlyDiningOut: Double,mnthlyShopping: Double)
    {
        
     validateGroceries(userId: userId, mnthlyGrocerries: mnthlyGrocerries, mnthlyEntertainment: mnthlyEntertainment, mnthlyRent: mnthlyRent, mnthlyUtility: mnthlyRent, mnthlyTransportation: mnthlyTransportation, mnthlyDiningOut: mnthlyDiningOut, mnthlyShopping: mnthlyShopping)
        
    }
    
    
    
}
