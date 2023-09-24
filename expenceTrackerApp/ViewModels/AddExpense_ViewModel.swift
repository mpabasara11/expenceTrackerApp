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
    @Published var expense_model = expense_Model(date: Date(), category: "", amount: 0.0, description: "", place: "")
   
  
  
    func addExpense()
    {
     
        
        addToDatabase(collectionName: "colukaray", userId: "aaaa", description: "adsd`", place: "asdasd", amount: 10.6, date: Date() ,category: "asdfsafs")
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
                        } else if let data = data {
                            if let responseString = String(data: data, encoding: .utf8) {
                                print("Response: \(responseString)")
                            }
                        }
                    }.resume()
                }
                
                // Clear the input field
               
            }


        
        
        /////////
    }
    
    
    
    
    
}
