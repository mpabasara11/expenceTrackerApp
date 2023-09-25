//
//  allowance_Model.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-24.
//

import Foundation
struct userAllowance_Model : Identifiable
{
    var id = UUID()
    var userId : String
    var mnthlyGrocerries : Double
    var mnthlyEntertainment : Double
    var mnthlyRent : Double
    var mnthlyUtility : Double
    var mnthlyTransportation : Double
    var mnthlyDiningOut : Double
    var mnthlyShopping : Double
    
    var date : Date
  //  var remainGrocerries : Double
 //   var remainEntertainment : Double
 //   var remainRent : Double
   // var remainUtility : Double
 //   var remaiTransportation : Double
  //  var remainDiningOut : Double
 //   var remainShopping : Double
    
    
    init(userId: String,mnthlyGrocerries: Double,mnthlyEntertainment: Double,mnthlyRent: Double,mnthlyUtility: Double,mnthlyTransportation: Double,mnthlyDiningOut: Double,mnthlyShopping: Double,date: Date) {
        
        self.userId = userId
        self.mnthlyGrocerries = mnthlyGrocerries
        self.mnthlyEntertainment = mnthlyEntertainment
        self.mnthlyRent = mnthlyRent
        self.mnthlyUtility = mnthlyUtility
        self.mnthlyTransportation = mnthlyTransportation
        self.mnthlyDiningOut = mnthlyDiningOut
        self.mnthlyShopping = mnthlyShopping
       
        self.date = date//     self.remainGrocerries = remainGrocerries
      //  self.remainEntertainment = remainEntertainment
    //    self.remainRent = remainRent
    //    self.remainUtility = remainUtility
    //    self.remaiTransportation = remaiTransportation
     //   self.remainDiningOut = remainDiningOut
     //   self.remainShopping = remainShopping
        
        
    }
    


}

