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
    @Published var isSheetPresent: Bool = false
    @Published var usdUserId = UserDefaults.standard.string(forKey: "userId")
    init() {
        addSampleExpenses()
    }
    
    private func addSampleExpenses() {
        let sampleExpense1 = expense_Model(userId:"jasaya",date: Date(), category: "Groceries", amount: 50.0, description: "Weekly grocery shopping", place: "Supermarket")
        let sampleExpense2 = expense_Model(userId: "junda",date: Date(), category: "Entertainment", amount: 20.0, description: "Movie night", place: "Cinema")
            
        expense_model = [sampleExpense1, sampleExpense2]
        }
    
    
}
