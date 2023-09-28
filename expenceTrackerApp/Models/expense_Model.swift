//
//  expense_Model.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-19.
//

import Foundation
struct expense_Model : Identifiable
{
    var id = UUID()
    var userId : String
    var date : Date
    var category : String
    var amount : Double
    var description : String
    var place : String
    
    
init(userId: String,date: Date,category: String,amount: Double,description: String,place: String) {
        
        self.userId = userId
       self.date = date
        self.category = category
        self.amount = amount
        self.description = description
        self.place = place
    }

}
