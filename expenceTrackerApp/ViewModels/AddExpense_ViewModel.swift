//
//  AddExpense_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-22.
//

import Foundation
import SwiftUI

class AddExpense_ViewModel: ObservableObject
{
    @Published var expense_model = expense_Model(date: Date(), category: "", amount: 0.0, description: "", place: "")
   
  
  
    func AddExpensedate(date: Date,category: String,amount: Double,description: String,place: String)
    {
        
    }
    
    
    
    
    
}
