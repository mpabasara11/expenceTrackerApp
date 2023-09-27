//
//  ExpenseTracking_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-19.
//

import SwiftUI

struct ExpenseTracking_View: View {
    
    
    @ObservedObject var expenseTracking_viewModel = ExpenseTracking_ViewModel()
    
    
    
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            return formatter
    }()
    
    
    var body: some View {
        
        NavigationView
        {
            VStack{
                List(expenseTracking_viewModel.expense_model, id: \.id) { expense in
                    
                    VStack(alignment:.leading){
                        
                        HStack{
                            Text("🚀").font(.title2)
                            Text("Category: \(expense.category)").font(.title3).bold()
                                .foregroundColor(.primary)
                            
                            
                        }
                        
                        
                        HStack{
                            Text("💰").font(.subheadline)
                            Text("Amount: \(expense.amount)").font(.title3)
                                .foregroundColor(.secondary)
                            
                        }
                        
                        HStack{
                            Text("📅").font(.subheadline)
                            Text("Date: \(expense.date,formatter:dateFormatter)").font(.title3)
                                .foregroundColor(.secondary)

                            
                            
                        }
                        
                  
                        
                        HStack{
                            Text("📌").font(.subheadline)
                            Text("Description: \(expense.description)").font(.title3)
                                .foregroundColor(.secondary)

                            
                            
                        }
                        
                        
                        HStack{
                            Text("🏠").font(.subheadline)
                            Text("Location: \(expense.place)").font(.title3)
                                .foregroundColor(.secondary)
                                

                            
                            
                        }
                        
                        
                        
                    }.background(Color.gray)
                    
                    
            
                }.padding(8)
                .background(Color.blue)
                .cornerRadius(10)
                //.shadow(radius: 5)
                    
                    Button(action: {
                        expenseTracking_viewModel.isSheetPresent = true
                    })
                        {
                        Text("Add New Expense")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                           .padding()
                           .background(Color.blue)
                           .cornerRadius(10)
                            .shadow(radius: 5)
                    }.padding()
                    
            

                    
            }.sheet(isPresented: $expenseTracking_viewModel.isSheetPresent,onDismiss:
                        {
                            expenseTracking_viewModel.isSheetPresent = false
                        })
                {
                
                AddExpense_View()
            
    
            }.navigationTitle("Your expenses")
     
        
        }
         
        
        
    }
    
}

struct ExpenseTracking_View_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTracking_View()
         //  .preferredColorScheme(.dark)
        
    }
}


