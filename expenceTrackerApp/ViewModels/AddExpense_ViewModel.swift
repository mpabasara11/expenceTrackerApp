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
    
    
    
    


    @Published var notValidAmountEffiecency:Bool = false
    @Published var notValidAmountValueZero:Bool = false
    @Published var notSuccessOperation: Bool = false
    @Published var successOperation: Bool = false
    @Published var message = ""
    @Published var showmes: Bool = false
    @Published var canRunTheDbExecution :Bool = false
    @Published var usdUserId = UserDefaults.standard.string(forKey: "userId")
    
    
   

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

        notValidAmountEffiecency = false
        notValidAmountValueZero = false
        canRunTheDbExecution = false
        showmes = false
        message = "pk"

    }
    

    func validateAmountValueZero(amount: Double)
    {
        notValidAmountValueZero = !(amount > 0)
    }

    public func validateAmountEfficiency(amount: Double, collectionName1: String,collectionName2: String, userId: String, category: String, date: Date)  {
      
     
        //avilable total allowance on database
        var totalAllowanceInDb = 0.0
        
        //total amount of selected category  in the selected month
        var totalAmountOfMonth = 0.0
        
        
        
        
        
        
        // Create a DispatchGroup to wait for Firestore queries to complete
       let dispatchGroup = DispatchGroup()
        
        

        // Fetch total allowance from Firestore
        dispatchGroup.enter() // Enter the group before the Firestore query
     
        
        let docrf = Firestore.firestore().collection(collectionName1).document(userId)
        docrf.getDocument { (document, error) in
            defer {
                dispatchGroup.leave() // Leave the group whether the query succeeds or fails
            }
            if let document = document {
                if let fieldVal = document.data()?[category] as? Double {
                    totalAllowanceInDb = fieldVal
                }
            }
        }
        
      

        
        
        // Fetch total amount of selected category in the selected month from Firestore
        dispatchGroup.enter() // Enter the group before the Firestore query
        let dtformatter = DateFormatter()
        dtformatter.dateFormat = "YYYY/MM"
        let dtForOp = dtformatter.string(from: date)

        let db = Firestore.firestore()
        let collectionRef = db.collection(collectionName2)

        collectionRef
            .whereField("userId", isEqualTo: userId)
            .whereField("category", isEqualTo: category)
            .whereField("dtForOperations", isEqualTo: dtForOp)
            .getDocuments { (querySnapshot, error) in
                defer {
                    dispatchGroup.leave() // Leave the group whether the query succeeds or fails
                }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }

                var tempTotalAmount: Double = 0.0

                for document in querySnapshot!.documents {
                    if let amount = document.data()["amount"] as? Double {
                        tempTotalAmount += amount
                    }
                }

                totalAmountOfMonth = tempTotalAmount
            }
        
      
        
        
        // Wait for both Firestore queries to complete
       dispatchGroup.notify(queue: .main) {
            // Now you can use totalAllowanceInDb and totalAmountOfMonth
          
    
            
                if (totalAmountOfMonth + amount) > totalAllowanceInDb
               {
               self.notValidAmountEffiecency = true
            //        self.canRunTheDbExecution = false
                    
               //     self.message = String (totalAllowanceInDb)+" "+String(totalAmountOfMonth)+String(self.notValidAmountEffiecency)
                //    self.showmes = true
               }
            
            
         
        }
    }

    
    

    
    func addExpense(userId: String,description: String,place: String,amount: Double,date: Date,category: String)
    {
        

        let dispatchGroup = DispatchGroup()
        

        validateAmountValueZero(amount: amount)
   
        
        dispatchGroup.enter()
  
        validateAmountEfficiency(amount: amount, collectionName1: "Allowance",collectionName2: "Expenses", userId: userId, category: category,date: date)
      
        dispatchGroup.leave()
        
        
       
        dispatchGroup.notify(queue: .main) {
        
            
            self.message = String (self.notValidAmountValueZero)+String(self.notValidAmountEffiecency)
            self.showmes = true
            
            
            if self.notValidAmountValueZero
            {
                
            }
            else
            {
                if self.notValidAmountEffiecency
                {
                    
                }
                else
                {
                  // self.addToDatabase(collectionName: "Expenses", userId: userId, description: description, place: place, amount: amount, date: date ,category: category)
                }
            }

      
               
        }
    }
    
    private func addToDatabase (collectionName: String,userId: String,description: String,place: String,amount: Double,date: Date,category: String)
    {
     
        
       let dtformatter = DateFormatter()
        dtformatter.dateFormat = "YYYY/MM/dd"
        let dateToDb = dtformatter.string(from: date)
        
        let dtformatter2 = DateFormatter()
         dtformatter2.dateFormat = "YYYY/MM"
         let dateToDb2 = dtformatter2.string(from: date)
        
       
        
        let db = Firestore.firestore()
               let collectionName = collectionName
             //  let documentName = userId

               let data: [String: Any] = [
                "userId": userId,
                "amount": Double(amount) ,
                   "category": category,
                   "date": dateToDb,
                   "description": description,
                "place": place,
                "dtForOperations":dateToDb2
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
