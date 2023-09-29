//
//  ExpenseTracking_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-19.
//

import Foundation
import SwiftUI
import Firebase

class ExpenseTracking_ViewModel: ObservableObject
{
    @Published var expense_modelArray : [expense_Model] = []
    @Published var expense_model = expense_Model(userId: "", date: Date(), category: "", amount: 0.0, description: "", place: "")
    
    @Published var isSheetPresent: Bool = false
    
    @Published var usdUserId = UserDefaults.standard.string(forKey: "userId")

    
    init() {
        addExpensesToView(userId: usdUserId ?? "")
    }
    
    
    
    
    
    
    public func addExpensesToView(userId: String) {

        expense_modelArray.removeAll()
        
   
        let db = Firestore.firestore()
        let collectionRef = db.collection("Expenses")
            collectionRef.whereField("userId",isEqualTo: userId)
            .getDocuments { (querySnapshot, error) in
                    defer {
                
                    }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }
         

            for document in querySnapshot!.documents {
              
                var amnt = 0.0
                var cat = ""
                var dt = ""
                var desc = ""
                var plc = ""
                var uid = ""
                
                
                
                if let amount = document.data()["amount"] as? Double {
                 amnt = amount
                }
                
                if let category = document.data()["category"] as? String {
                    cat = category                }
                
                if let date = document.data()["date"] as? String {
                    dt = date                }
                
                if let description = document.data()["description"] as? String {
                    desc = description                }
                
                if let place = document.data()["place"] as? String {
                     plc = place
                    
                }
                
                if let userId = document.data()["userId"] as? String {
                     uid = userId
                    
                }
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "YYYY/MM/dd"
                let convertedDate = dateFormatter.date(from: dt)
                
                
                
                let sampleExpense = expense_Model(userId:uid,date: convertedDate!, category: cat, amount: amnt, description: desc, place: plc)
                
                
                self.expense_modelArray.append(sampleExpense)
            }

       
            
            
        }

    
    }
    
    
}
