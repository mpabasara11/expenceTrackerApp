//
//  Settings_ViewModel.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-23.
//
import Firebase
import Foundation
class Settings_ViewModel: ObservableObject
{
  
    
    @Published var usdUserId = UserDefaults.standard.string(forKey: "userId")

    //this model is used to take input data
    @Published var userAllowance_modelWrite =  userAllowance_Model(userId: "", mnthlyGrocerries: 0, mnthlyEntertainment: 0, mnthlyRent: 0, mnthlyUtility: 0, mnthlyTransportation: 0, mnthlyDiningOut: 0, mnthlyShopping: 0,date: Date())
    
    //this model is used to read data
   @Published var userAllowance_modelRead =  userAllowance_Model(userId: "", mnthlyGrocerries: 0, mnthlyEntertainment: 0, mnthlyRent: 0, mnthlyUtility: 0, mnthlyTransportation: 0, mnthlyDiningOut: 0, mnthlyShopping: 0,date: Date())
    
    //this model is used to send  data to DB
   @Published var userAllowance_modelSendToDb =  userAllowance_Model(userId: "", mnthlyGrocerries: 0, mnthlyEntertainment: 0, mnthlyRent: 0, mnthlyUtility: 0, mnthlyTransportation: 0, mnthlyDiningOut: 0, mnthlyShopping: 0,date: Date())
    
    
    @Published var notSuccessOperation: Bool = false
    @Published var successOperation: Bool = false
    
    @Published var isLoggedOut: Bool = false
    
    
    
    //added for debugging purposes
    @Published var showMessage = false
    @Published var massage = ""
    
    
    
    
    
    init() {
        loadLabels(userId: usdUserId ?? "")
    }
    
    
    
    //inpt fields clear
    func clearFields()
    {
        userAllowance_modelWrite.userId = ""
        userAllowance_modelWrite.mnthlyGrocerries = 0
        userAllowance_modelWrite.mnthlyEntertainment = 0
        userAllowance_modelWrite.mnthlyRent = 0
        userAllowance_modelWrite.mnthlyUtility = 0
        userAllowance_modelWrite.mnthlyTransportation = 0
        userAllowance_modelWrite.mnthlyDiningOut = 0
        userAllowance_modelWrite.mnthlyShopping = 0
        userAllowance_modelWrite.date = Date()
   
  
    }
    
    
    
    //validate inputs and add necessary missing values to the model
  func validateGroceries(userId: String,mnthlyGrocerries: Double,mnthlyEntertainment: Double,mnthlyRent: Double,mnthlyUtility: Double,mnthlyTransportation: Double,mnthlyDiningOut: Double,mnthlyShopping: Double,date: Date)  {
        
        userAllowance_modelSendToDb.userId = userId
        userAllowance_modelSendToDb.date = date
        
   
        if userAllowance_modelWrite.mnthlyGrocerries.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyGrocerries = userAllowance_modelRead.mnthlyGrocerries
        }else
        {
            userAllowance_modelSendToDb.mnthlyGrocerries = userAllowance_modelWrite.mnthlyGrocerries
        }
        
        if userAllowance_modelWrite.mnthlyEntertainment.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyEntertainment = userAllowance_modelRead.mnthlyEntertainment
        }else
        {
            userAllowance_modelSendToDb.mnthlyEntertainment = userAllowance_modelWrite.mnthlyEntertainment

        }

        if userAllowance_modelWrite.mnthlyRent.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyRent = userAllowance_modelRead.mnthlyRent
        }else
        {
            userAllowance_modelSendToDb.mnthlyRent = userAllowance_modelWrite.mnthlyRent
        }

        if userAllowance_modelWrite.mnthlyUtility.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyUtility = userAllowance_modelRead.mnthlyUtility
        }else
        {
            userAllowance_modelSendToDb.mnthlyUtility = userAllowance_modelWrite.mnthlyUtility

        }

        if userAllowance_modelWrite.mnthlyTransportation.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyTransportation = userAllowance_modelRead.mnthlyTransportation
        }else
        {
            userAllowance_modelSendToDb.mnthlyTransportation = userAllowance_modelWrite.mnthlyTransportation
        }

        if userAllowance_modelWrite.mnthlyDiningOut.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyDiningOut = userAllowance_modelRead.mnthlyDiningOut
        }else
        {
            userAllowance_modelSendToDb.mnthlyDiningOut = userAllowance_modelWrite.mnthlyDiningOut
        }

        if userAllowance_modelWrite.mnthlyShopping.isEqual(to: 0)
        {
            userAllowance_modelSendToDb.mnthlyShopping = userAllowance_modelRead.mnthlyShopping
        }else
        {
            userAllowance_modelSendToDb.mnthlyShopping = userAllowance_modelWrite.mnthlyShopping
        }
       }
    

    
 
   
    //button function
    public func updateSettings(userId: String,mnthlyGrocerries: Double,mnthlyEntertainment: Double,mnthlyRent: Double,mnthlyUtility: Double,mnthlyTransportation: Double,mnthlyDiningOut: Double,mnthlyShopping: Double,date: Date)
    {
        
     validateGroceries(userId: userId, mnthlyGrocerries: mnthlyGrocerries, mnthlyEntertainment: mnthlyEntertainment, mnthlyRent: mnthlyRent, mnthlyUtility: mnthlyRent, mnthlyTransportation: mnthlyTransportation, mnthlyDiningOut: mnthlyDiningOut, mnthlyShopping: mnthlyShopping,date: date)
        
        addToDatabase(collectionName: "Allowance", userId: userAllowance_modelSendToDb.userId, mnthlyGrocerries: userAllowance_modelSendToDb.mnthlyGrocerries, mnthlyEntertainment: userAllowance_modelSendToDb.mnthlyEntertainment, mnthlyRent: userAllowance_modelSendToDb.mnthlyRent, mnthlyUtility: userAllowance_modelSendToDb.mnthlyUtility, mnthlyTransportation: userAllowance_modelSendToDb.mnthlyTransportation, mnthlyDiningOut: userAllowance_modelSendToDb.mnthlyDiningOut, mnthlyShopping: userAllowance_modelSendToDb.mnthlyShopping, date: userAllowance_modelSendToDb.date)
   
        
    }
    
    
    
    ////save to db
    private func addToDatabase (collectionName: String,userId: String,mnthlyGrocerries: Double,mnthlyEntertainment: Double,mnthlyRent: Double,mnthlyUtility: Double,mnthlyTransportation: Double,mnthlyDiningOut: Double,mnthlyShopping: Double,date: Date)
    {
     
        
        let dtformatter = DateFormatter()
        dtformatter.dateFormat = "YYYY/MM/dd"
        let dateToDb = dtformatter.string(from: date)
        
        let data: [String: Any] = [
         "Groceries": Double(mnthlyGrocerries) ,
           "Entertainment": Double(mnthlyEntertainment),
           "Rent": Double(mnthlyRent),
            "Utilities": Double(mnthlyUtility),
            "Transportation": Double(mnthlyTransportation),
            "Dining Out": Double(mnthlyDiningOut),
             "Shopping": Double(mnthlyShopping),
            "date": dateToDb
         
        ]
        
       
        
     
        let collectionName = collectionName
        let documentName = userId
        let docrf = Firestore.firestore().collection(collectionName).document(documentName)
        docrf.getDocument {(document,error) in
            if let document = document
            {
                //if exist update the current doc
                if document.exists
                {
                  
          
                    // using the existing document reference
                    docrf.updateData(data) { error in
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
                //if not exist create a new one
                else
                {
               
                    // using the existing document reference
                    docrf.setData(data) { error in
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
     
        }
        
           
        
    }
    
    
    
    
    
    //load settings labels
    func loadLabels(userId: String)
    {
      
        
        let docrf = Firestore.firestore().collection("Allowance").document(userId)
        docrf.getDocument { (document, error) in
            defer {
               
            }
            if let document = document {
               
                if let dinOut = document.data()?["Dining Out"] as? Double {
                    self.userAllowance_modelRead.mnthlyDiningOut = dinOut
                }
                
                if let entert = document.data()?["Entertainment"] as? Double {
                    self.userAllowance_modelRead.mnthlyEntertainment = entert
                }
                
                if let groce = document.data()?["Groceries"] as? Double {
                    self.userAllowance_modelRead.mnthlyGrocerries = groce
                }
                
                if let rent = document.data()?["Rent"] as? Double {
                    self.userAllowance_modelRead.mnthlyRent = rent
                }
                
                if let shopp = document.data()?["Shopping"] as? Double {
                    self.userAllowance_modelRead.mnthlyShopping = shopp
                }
                
                if let trnas = document.data()?["Transportation"] as? Double {
                    self.userAllowance_modelRead.mnthlyTransportation = trnas
                }
                
                if let uti = document.data()?["Utilities"] as? Double {
                    self.userAllowance_modelRead.mnthlyUtility = uti
                }
            }
        }
        

    }
    
    //sign out button func
    func sighOut()
    {
 
        //reset user defaults
        let useTouchId = false
        let uid = ""
        UserDefaults.standard.set(uid,forKey: "userId")
      
        UserDefaults.standard.setValue(useTouchId, forKey: "useTouchId")
        
        
        //redirect to login
        isLoggedOut = true
    }
    
    
    
  //  UserDefaults.standard.set(uid,forKey: "userId")
  //  UserDefaults.standard.set(isLoggedIn,forKey: "isLoggedIn")
    
    
}



