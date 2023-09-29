//
//  overView_Model.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-29.
//

import Foundation

struct overView_Model : Identifiable
{
    var id = UUID()
    var totalAllowance : Double
    var totalExpenses : Double
    
    var allowanceDining : Double
    var allowanceEntertainment : Double
    var allowanceGroceries : Double
    var allowanceRent : Double
    var allowanceShopping : Double
    var allowanceTransportation : Double
    var allowanceUtilities : Double
    
    var expenseDining : Double
    var expenseEntertainment : Double
    var expenseGroceries : Double
    var expenseRent : Double
    var expenseShopping : Double
    var expenseTransportation : Double
    var expenseUtilities : Double
    

    init(totalAllowance: Double,totalExpenses: Double,allowanceDining: Double,
         allowanceEntertainment: Double,
         allowanceGroceries : Double,
         allowanceRent : Double,
         allowanceShopping : Double,
         allowanceTransportation : Double,
         allowanceUtilities : Double,
         expenseDining : Double,
         expenseEntertainment : Double,
         expenseGroceries : Double,
         expenseRent : Double,
         expenseShopping : Double,
         expenseTransportation : Double,
         expenseUtilities : Double)
   {
    
        //allowance limit
        self.totalAllowance = totalAllowance
        
        //total added expenses
        self.totalExpenses = totalExpenses
        
        self.allowanceDining = allowanceDining
        self.allowanceEntertainment = allowanceEntertainment
        self.allowanceGroceries = allowanceGroceries
        self.allowanceRent = allowanceRent
        self.allowanceShopping = allowanceShopping
        self.allowanceTransportation = allowanceTransportation
        self.allowanceUtilities = allowanceUtilities
        
        self.expenseDining = expenseDining
        self.expenseEntertainment = expenseEntertainment
        self.expenseGroceries = expenseGroceries
        self.expenseRent = expenseRent
        self.expenseShopping = expenseShopping
        self.expenseTransportation = expenseTransportation
        self.expenseUtilities = expenseUtilities
        

        
        
    
   }
    
  
    
}
