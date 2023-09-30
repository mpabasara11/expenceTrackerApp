//
//  OverView_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-29.
//

import Foundation
import Firebase

class OverView_ViewModel: ObservableObject
{
    //get default userId fron usr defaults
    @Published var usdUserId = UserDefaults.standard.string(forKey: "userId")
    
    @Published var totalAmount = 0.0

    
    //overview model instance
    @Published var overview_model = overView_Model(totalAllowance: 0.0, totalExpenses: 0.0, allowanceDining: 0.0, allowanceEntertainment: 0.0, allowanceGroceries: 0.0, allowanceRent: 0.0, allowanceShopping: 0.0, allowanceTransportation: 0.0, allowanceUtilities: 0.0, expenseDining: 0.0, expenseEntertainment: 0.0, expenseGroceries: 0.0, expenseRent: 0.0, expenseShopping: 0.0, expenseTransportation: 0.0, expenseUtilities: 0.0)
    
    init() {
        fetchData(userId: usdUserId ?? "")
    }
    
    
   public func fetchData(userId: String)
    {
        ////////////////////////
        
        var dinOut = 0.0
        var entert = 0.0
        var groce = 0.0
        var rnt = 0.0
        var shpng = 0.0
        var trnsp = 0.0
        var util = 0.0
        
        let db = Firestore.firestore()
        
        
        let docrf = db.collection("Allowance").document(userId)
        docrf.getDocument { (document, error) in
            defer {
        
            }
            if let document = document {
   
                if let diningOut = document.data()?["Dining Out"] as? Double {
        
                dinOut  = diningOut
                }
                
                if let entertainment = document.data()?["Entertainment"] as? Double {
        
                  entert = entertainment
                }
                
                if let groceries = document.data()?["Groceries"] as? Double {
        
                        groce = groceries
                    
                }
                
                if let rent = document.data()?["Rent"] as? Double {
        
                          rnt = rent
                }
                
                if let shopping = document.data()?["Shopping"] as? Double {
        
                    shpng = shopping
                }
                
                if let transportation = document.data()?["Transportation"] as? Double {
        
                    trnsp = transportation
                }
                
                if let utilities = document.data()?["Utilities"] as? Double {
        
                
                    util = utilities
                }
                
                
                
                
                self.overview_model.totalAllowance = dinOut + entert + groce + rnt +  shpng +  trnsp + util
                
                
                self.overview_model.allowanceDining = dinOut
                self.overview_model.allowanceEntertainment = entert
                self.overview_model.allowanceGroceries = groce
                self.overview_model.allowanceRent = rnt
                self.overview_model.allowanceShopping = shpng
                self.overview_model.allowanceTransportation = trnsp
                self.overview_model.allowanceUtilities = util
                
                
            }
        }
        ///////////////////////////
      
        ////////////////////////////
        
        
        let dtformatter1 = DateFormatter()
        dtformatter1.dateFormat = "YYYY/MM"
        let dtForOp1 = dtformatter1.string(from: Date())

        
        
      
        let collectionRef = db.collection("Expenses")

        collectionRef
            .whereField("userId", isEqualTo: userId)
            .whereField("dtForOperations", isEqualTo: dtForOp1)
            .getDocuments { (querySnapshot, error) in
                defer {
            
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

        
                self.overview_model.totalExpenses = tempTotalAmount
            }
        

        
      ////////////////////
        
        ////////////////////

        
        
        
        
        let dtformatter = DateFormatter()
        dtformatter.dateFormat = "YYYY/MM"
        let dtForOp = dtformatter.string(from: Date())

        
        //dining out expenses
        let collectionRef1 = db.collection("Expenses")
        collectionRef1
            .whereField("userId", isEqualTo: userId)
            .whereField("category", isEqualTo: "Dining Out")
            .whereField("dtForOperations", isEqualTo: dtForOp)
            .getDocuments { (querySnapshot, error) in
                defer {
            
                }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }

                var temp: Double = 0.0

                for document in querySnapshot!.documents {
                    if let amount = document.data()["amount"] as? Double {
                        temp += amount
                    }
                }

        
                self.overview_model.expenseDining = temp
            }
        
        
        
        //entertainment out expenses
        let collectionRef2 = db.collection("Expenses")
        collectionRef2
            .whereField("userId", isEqualTo: userId)
            .whereField("category", isEqualTo: "Entertainment")
            .whereField("dtForOperations", isEqualTo: dtForOp)
            .getDocuments { (querySnapshot, error) in
                defer {
            
                }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }

                var temp: Double = 0.0

                for document in querySnapshot!.documents {
                    if let amount = document.data()["amount"] as? Double {
                        temp += amount
                    }
                }

        
                self.overview_model.expenseEntertainment = temp
            }
        
        
        //grocerry out expenses
        let collectionRef3 = db.collection("Expenses")
        collectionRef3
            .whereField("userId", isEqualTo: userId)
            .whereField("category", isEqualTo: "Groceries")
            .whereField("dtForOperations", isEqualTo: dtForOp)
            .getDocuments { (querySnapshot, error) in
                defer {
            
                }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }

                var temp: Double = 0.0

                for document in querySnapshot!.documents {
                    if let amount = document.data()["amount"] as? Double {
                        temp += amount
                    }
                }

        
                self.overview_model.expenseGroceries = temp
            }
        
        
        
        //rent out expenses
        let collectionRef4 = db.collection("Expenses")
        collectionRef4
            .whereField("userId", isEqualTo: userId)
            .whereField("category", isEqualTo: "Rent")
            .whereField("dtForOperations", isEqualTo: dtForOp)
            .getDocuments { (querySnapshot, error) in
                defer {
            
                }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }

                var temp: Double = 0.0

                for document in querySnapshot!.documents {
                    if let amount = document.data()["amount"] as? Double {
                        temp += amount
                    }
                }

        
                self.overview_model.expenseRent = temp
            }
        
        
        
        //shopping out expenses
        let collectionRef5 = db.collection("Expenses")
        collectionRef5
            .whereField("userId", isEqualTo: userId)
            .whereField("category", isEqualTo: "Shopping")
            .whereField("dtForOperations", isEqualTo: dtForOp)
            .getDocuments { (querySnapshot, error) in
                defer {
            
                }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }

                var temp: Double = 0.0

                for document in querySnapshot!.documents {
                    if let amount = document.data()["amount"] as? Double {
                        temp += amount
                    }
                }

        
                self.overview_model.expenseShopping = temp
            }
        
        
        //transportation out expenses
        let collectionRef6 = db.collection("Expenses")
        collectionRef6
            .whereField("userId", isEqualTo: userId)
            .whereField("category", isEqualTo: "Transportation")
            .whereField("dtForOperations", isEqualTo: dtForOp)
            .getDocuments { (querySnapshot, error) in
                defer {
            
                }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }

                var temp: Double = 0.0

                for document in querySnapshot!.documents {
                    if let amount = document.data()["amount"] as? Double {
                        temp += amount
                    }
                }

        
                self.overview_model.expenseTransportation = temp
            }
        
        
        //utility out expenses
        let collectionRef7 = db.collection("Expenses")
        collectionRef7
            .whereField("userId", isEqualTo: userId)
            .whereField("category", isEqualTo: "Utility")
            .whereField("dtForOperations", isEqualTo: dtForOp)
            .getDocuments { (querySnapshot, error) in
                defer {
            
                }
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }

                var temp: Double = 0.0

                for document in querySnapshot!.documents {
                    if let amount = document.data()["amount"] as? Double {
                        temp += amount
                    }
                }

        
                self.overview_model.expenseUtilities = temp
            }
        
        
        
        
        
    
        
        //////////////////
        
    }
    
    
    
    
    
    
    
    
    
}
