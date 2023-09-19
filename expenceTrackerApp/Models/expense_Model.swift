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
    let date : Date
    let category : String
    let amount : Double
    let description : String
    let  location : String?
    
    
    init(date: Date,category: String,amount: Double,description: String,location: String?) {
        
        self.date = date
        self.category = category
        self.amount = amount
        self.description = description
        self.location = location
    }

}
