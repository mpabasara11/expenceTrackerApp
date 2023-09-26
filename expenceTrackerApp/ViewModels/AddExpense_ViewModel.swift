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
    @Published var expense_model = expense_Model(userId: "",date: Date(), category: "", amount: 0, description: "", place: "")
    
    
    
    
    @Published var notValiDescription: Bool = false
    @Published var notValidPlace: Bool = false
    @Published var notValidAmountValueZero: Bool = false
    @Published var notValidAmountEffiecency:Bool = false
    @Published var notSuccessOperation: Bool = false
    @Published var successOperation: Bool = false
   
    @Published var massage = ""
    @Published var showMessage = false
    
     func clearFields()
    {
        expense_model.userId = "" 
        expense_model.date = Date()
        expense_model.amount = 0
        expense_model.description = ""
        expense_model.place = ""
    }
    
    func dismissAlert()
    {
        notValiDescription = false
        notValidPlace = false
        notValidAmountValueZero = false
        notValidAmountEffiecency = false
  
        
    }
    
    
    private func validateDescription(description: String)  {
        notValiDescription = description.isEmpty
       }

    private func validatePlace(place: String)  {
         notValidPlace = place.isEmpty
       }
    
    private func validateAmountValueZero(amount: Double)  {
        notValidAmountValueZero = !(amount > 0)
     
     
       }
    
    public func validateAmountEfficiancy(amount: Double,collectionName: String,userId: String,category: String)  {
      //  notValidAmountEffiecency
       ///////////////////////
        var totalAllowanceInDb = 0.0
        
        let collectionName = collectionName
        let documentName = userId
        let docrf = Firestore.firestore().collection(collectionName).document(documentName)
        docrf.getDocument {(document,error) in
            if let document = document
            {
                let d = document.data()
                if let fieldVal = d?[category] as? Double
                {
                    totalAllowanceInDb = fieldVal
                }
                else
                {
                    totalAllowanceInDb = 0.0
                }
            
                self.massage = String(totalAllowanceInDb)
                self.showMessage = true
            }
        
        
        
        
        
        }
     /////////////////////
       }


    
    func addExpense(userId: String,description: String,place: String,amount: Double,date: Date,category: String)
    {
        
        
        validateDescription(description: description)
        validatePlace(place: place)
        validateAmountValueZero(amount: amount)

        
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
                if notValidAmountValueZero
                {
                    
                }
                else
                {
                    if notValidAmountEffiecency
                    {
                        
                    }
                    else
                    {
                        addToDatabase(collectionName: "Expenses", userId: userId, description: description, place: place, amount: amount, date: date ,category: category)
                    }
                }
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
             //  let documentName = userId

               let data: [String: Any] = [
                "userId": userId,
                "amount": Double(amount) ,
                   "category": category,
                   "date": dateToDb,
                   "description": description,
                   "place": place
               ]

        let customDocumentRef = db.collection(collectionName).document()
        
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
