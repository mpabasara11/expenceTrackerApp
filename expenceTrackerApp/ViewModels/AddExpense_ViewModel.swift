//
//  AddExpense_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-22.
//

import Foundation
import SwiftUI
import Foundation
import Firebase

class AddExpense_ViewModel: ObservableObject
{
    @Published var expense_model = expense_Model(userId: "",date: Date(), category: "", amount: 500, description: "", place: "")
    
    @Published var notValiDescription: Bool = false
    @Published var notValidPlace: Bool = false
    @Published var notSuccessOperation: Bool = false
    @Published var successOperation: Bool = false
   

   
    
     func clearFields()
    {
        expense_model.userId = "" 
        expense_model.date = Date()
        expense_model.amount = 500
        expense_model.description = ""
        expense_model.place = ""
    }
    
    func dismissAlert()
    {
        notValiDescription = false
        notValidPlace = false
  
  
        
    }
    
    
    private func validateDescription(description: String)  {
        notValiDescription = expense_model.description.isEmpty
       }

    private func validatePlace(place: String)  {
         notValidPlace = expense_model.place.isEmpty
       }


    
    
    
    
    
  
    func addExpense(userId: String,description: String,place: String,amount: Double,date: Date,category: String)
    {
        
        
        validateDescription(description: expense_model.description)
        validatePlace(place: expense_model.place)

        
        if notValiDescription
        {
            
        }
        else
        {
            if notValidPlace
            {
                
            }
            else
            {
                addToDatabase(collectionName: "Expenses", userId: userId, description: description, place: place, amount: amount, date: date ,category: category)
            }
            
            
        }
        
        
        
    }
    
    
    
    
    private func addToDatabase (collectionName: String,userId: String,description: String,place: String,amount: Double,date: Date,category: String)
    {
     
        
        let dtformatter = DateFormatter()
        dtformatter.dateFormat = "YYYY/MM/dd"
        let dateToDb = dtformatter.string(from: date)
        
       
        
        let db = Firestore.firestore()
               let collectionName = collectionName
               let documentName = "custom_document_name"

               let data: [String: Any] = [
                "amount": Double(amount) ,
                   "category": category,
                   "date": dateToDb,
                   "description": description,
                   "place": place
               ]

               let customDocumentRef = db.collection(collectionName).document(documentName)

               customDocumentRef.setData(data) { error in
                   if let error = error {
                       print("Error creating document: \(error)")
                    self.notSuccessOperation = true
                    self.successOperation = false
                   } else {
                    self.notSuccessOperation = false
                    self.successOperation = true
                   }
               }
        
  
                
        
    }
    
    
    
    
    
}
