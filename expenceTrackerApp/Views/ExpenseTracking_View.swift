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
        formatter.timeStyle = .none
            return formatter
    }()
    
    
    var body: some View {
 /////
        NavigationView
        {
            VStack{
                List(expenseTracking_viewModel.expense_modelArray, id: \.id) { expense in
                    
                    VStack(alignment:.leading){
                        
                        //////////////start hstack
                        
                        
                        HStack{
                            Text("🚀").font(.title2)
                            Text("Category: \(expense.category)").font(.title3).bold()
                               .foregroundColor(.primary)
                           
                       
                            
                        }
                        Spacer()
                        
                        HStack{
                        
                            Text("Amount: \(expense.amount)").font(.title3)
                                .foregroundColor(.secondary)
                            
                        }
                        
                        HStack{
                     
                            Text("Date: \(expense.date,formatter:dateFormatter)").font(.title3)
                               .foregroundColor(.secondary)

                            
                            
                        }
                        
                  
                        
                        HStack{
                       
                            Text("Description: \(expense.description)").font(.title3)
                                .foregroundColor(.secondary)

                            
                            
                        }
                        
                        
                        HStack{
                    
                            Text("Location: \(expense.place)").font(.title3)
                                .foregroundColor(.secondary)
                                

                            
                            
                        }
                        
                        //////////////////////stop hstack
                        
                    }
                    
                    .listRowInsets(EdgeInsets(top:0,leading:0,bottom:10,trailing:0))
            
                }//.padding(.vertical,20)
           
                    
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
                            
                            
                            
                          
    
                            
                            expenseTracking_viewModel.addExpensesToView(userId:   expenseTracking_viewModel.usdUserId ?? "")
                            
                            
                            
                            
                            
                            
                        })
                {
                
                AddExpense_View()
            
    
            }   .navigationBarTitle("Your Expenses",displayMode: .automatic)
            
     
        
        }
         
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)    }
    /////////////
}

struct ExpenseTracking_View_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTracking_View()
         //  .preferredColorScheme(.dark)
        
    }
}


