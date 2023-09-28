//
//  OverView_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-28.
//

import SwiftUI

struct OverView_View: View {
    var body: some View {
       /////
        var   totalExpenses = 1234.56 // Replace with your data
        var expenseLimit = 2000.00 //
        
        NavigationView{
        
        Form {
            
                Section(header: Text("Budget Overview")) {
                    HStack {
                        Text("Total Expenses:")
                        Spacer()
                        Text("$\(totalExpenses, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Expense Limit:")
                        Spacer()
                        Text("$\(expenseLimit, specifier: "%.2f")")
                    }
                    HStack {
                        Text("Remaining Budget:")
                        Spacer()
                     //   Text("$\(expenseLimit - totalExpenses, specifier: "%.2f")")
                         //   .foregroundColor((expenseLimit - totalExpenses) >= 0 ? .green : .red)
                    }
                   //  Progress for remaining budget
                //    ProgressView(value: min(max((totalExpenses / expenseLimit), 0.0), 1.0))
                    //    .progressViewStyle(LinearProgressViewStyle(tint: (expenseLimit - totalExpenses) >= 0 ? .green : .red))
                }

                Section(header: Text("Expense Categories")) {
                    // Display expense categories and their spending in a list or chart.
                    // You can use a ForEach loop to iterate through categories.
                }

                Section(header: Text("Expense Trends")) {
                    // Display a line chart or graph showing spending trends.
                }

                Section(header: Text("Alerts and Notifications")) {
                    // Show alerts or notifications related to budget limits.
                }
            }
            .onAppear {
                // Load and calculate total expenses and expense limit from your data.
                totalExpenses = 1234.56 // Replace with your data
              expenseLimit = 2000.00 // Replace with your data
            }
            .navigationBarTitle("Budget Overview")
        }
        /////
    }
}

struct OverView_View_Previews: PreviewProvider {
    static var previews: some View {
        OverView_View()
    }
}
