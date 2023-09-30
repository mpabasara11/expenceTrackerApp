//
//  OverView_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-28.
//

import SwiftUI

struct OverView_View: View {
    
    
     @ObservedObject var overview_viewModel = OverView_ViewModel()

     
    
    
    
    var body: some View {
      
        
        NavigationView{
        
        Form {
            
                Section(header: Text("This month")) {
                    HStack {
                        Text("Allowance Limit :")
                        Spacer()
                        Text("Rs \(overview_viewModel.overview_model.totalAllowance, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Total Expenses :")
                        Spacer()
                        Text("Rs \(overview_viewModel.overview_model.totalExpenses, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Remaining Budget:")
                        Spacer()
                        Text("Rs \(overview_viewModel.overview_model.totalAllowance - overview_viewModel.overview_model.totalExpenses  , specifier: "%.2f")")
                            .foregroundColor((overview_viewModel.overview_model.totalAllowance - overview_viewModel.overview_model.totalExpenses ) >= 0 ? .green : .red)
                    }
                   //  Progress for remaining budget
                   ProgressView(value: min(max((overview_viewModel.overview_model.totalExpenses / overview_viewModel.overview_model.totalAllowance), 0.0), 1.0))
                    .progressViewStyle(LinearProgressViewStyle(tint: (overview_viewModel.overview_model.totalAllowance - overview_viewModel.overview_model.totalExpenses) >= 0 ? .green : .red))
                }

                Section(header: Text("Expense Categories")) {
                    // Display expense categories and their
                    
                    VStack{
                        
                        Text("Groceries")
                    
                    ProgressView(value: min(max((overview_viewModel.overview_model.expenseGroceries / overview_viewModel.overview_model.allowanceGroceries), 0.0), 1.0))
                        .progressViewStyle(LinearProgressViewStyle(tint: (overview_viewModel.overview_model.allowanceGroceries - overview_viewModel.overview_model.expenseGroceries) >= 0 ? .green : .red))
                    
                    }.padding(.vertical,20)
                    
                    VStack{
                        
                        Text("Entertainment")
                    
                    ProgressView(value: min(max((overview_viewModel.overview_model.expenseEntertainment / overview_viewModel.overview_model.allowanceEntertainment), 0.0), 1.0))
                        .progressViewStyle(LinearProgressViewStyle(tint: (overview_viewModel.overview_model.allowanceEntertainment - overview_viewModel.overview_model.expenseEntertainment) >= 0 ? .green : .red))
                    
                    }.padding(.vertical,20)
                    
                    
                    
                    VStack{
                        
                        Text("Dining Out")
                    
                    ProgressView(value: min(max((overview_viewModel.overview_model.expenseDining / overview_viewModel.overview_model.allowanceDining), 0.0), 1.0))
                        .progressViewStyle(LinearProgressViewStyle(tint: (overview_viewModel.overview_model.allowanceDining - overview_viewModel.overview_model.expenseDining) >= 0 ? .green : .red))
                    
                    }.padding(.vertical,20)
                    
                    
                    
                    VStack{
                        
                        Text("Rent")
                    
                    ProgressView(value: min(max((overview_viewModel.overview_model.expenseRent / overview_viewModel.overview_model.allowanceRent), 0.0), 1.0))
                        .progressViewStyle(LinearProgressViewStyle(tint: (overview_viewModel.overview_model.allowanceRent - overview_viewModel.overview_model.expenseRent) >= 0 ? .green : .red))
                    
                    }.padding(.vertical,20)
                    
                    
                    
                    VStack{
                        
                        Text("Shopping")
                    
                    ProgressView(value: min(max((overview_viewModel.overview_model.expenseShopping / overview_viewModel.overview_model.allowanceShopping), 0.0), 1.0))
                        .progressViewStyle(LinearProgressViewStyle(tint: (overview_viewModel.overview_model.allowanceShopping - overview_viewModel.overview_model.expenseShopping) >= 0 ? .green : .red))
                    
                    }.padding(.vertical,20)
                    
                    
                    
                    VStack{
                        
                        Text("Transportation")
                    
                    ProgressView(value: min(max((overview_viewModel.overview_model.expenseTransportation / overview_viewModel.overview_model.allowanceTransportation), 0.0), 1.0))
                        .progressViewStyle(LinearProgressViewStyle(tint: (overview_viewModel.overview_model.allowanceTransportation - overview_viewModel.overview_model.expenseTransportation) >= 0 ? .green : .red))
                    
                    }.padding(.vertical,20)
                    
                    
                    
                    VStack{
                        
                        Text("Utilities")
                    
                    ProgressView(value: min(max((overview_viewModel.overview_model.expenseUtilities / overview_viewModel.overview_model.allowanceUtilities), 0.0), 1.0))
                        .progressViewStyle(LinearProgressViewStyle(tint: (overview_viewModel.overview_model.allowanceUtilities - overview_viewModel.overview_model.expenseUtilities) >= 0 ? .green : .red))
                    
                    }.padding(.vertical,20)
                    
                
                }

            
                Section(header: Text("Alerts and Notifications")) {
                    // Show alerts or notifications related to budget limits.
                }
            }
        .navigationBarTitle("Budget Overview",displayMode: .automatic)
       
        }
        /////
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
    }
}

struct OverView_View_Previews: PreviewProvider {
    static var previews: some View {
        OverView_View()
    }
}
