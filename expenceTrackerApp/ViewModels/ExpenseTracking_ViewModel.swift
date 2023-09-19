//
//  ExpenseTracking_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-19.
//

import Foundation
import SwiftUI

class ExpenseTracking_ViewModel: ObservableObject
{
    @Published var expense_model : [expense_Model] = []
    
    init() {
        addSampleExpenses()
    }
    
    private func addSampleExpenses() {
            let sampleExpense1 = expense_Model(date: Date(), category: "Groceries", amount: 50.0, description: "Weekly grocery shopping", location: "Supermarket")
            let sampleExpense2 = expense_Model(date: Date(), category: "Entertainment", amount: 20.0, description: "Movie night", location: "Cinema")
            
        expense_model = [sampleExpense1, sampleExpense2]
        }
    
    
}
