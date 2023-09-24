//
//  AddExpense_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-22.
//

import Foundation
import SwiftUI
import Foundation

class AddExpense_ViewModel: ObservableObject
{
    @Published var expense_model = expense_Model(date: Date(), category: "", amount: 500, description: "", place: "")
    
    @Published var notValiDescription: Bool = false
    @Published var notValidPlace: Bool = false
    @Published var notSuccessOperation: Bool = false
    @Published var successOperation: Bool = false
   

   
  
    
    
     func clearFields()
    {
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
        
            if let url = URL(string: "https://firestore.googleapis.com/v1/projects/walletwise-e8632/databases/(default)/documents/"+collectionName) {
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let postData = [
                    "fields": [
                        "userId": ["stringValue": userId],
                        "description": ["stringValue": description],
                        "place": ["stringValue": place],
                        "amount": ["doubleValue": amount],
                        "date": ["stringValue": dateToDb],
                        "category": ["stringValue": category]
                    ]
                ]
              
                if let jsonData = try? JSONSerialization.data(withJSONObject: postData) {
                    request.httpBody = jsonData
                    
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        if let error = error {
                            print("Error: \(error)")
                            self.notSuccessOperation = true
                            self.successOperation = false
                            
                        } else if let data = data {
                            if let responseString = String(data: data, encoding: .utf8) {
                                print("Response: \(responseString)")
                                self.notSuccessOperation = false
                                self.successOperation = true
                            }
                        }
                    }.resume()
                }
                
          
               
            }


        
        
        /////////
    }
    
    
    
    
    
}
