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
        VStack{
        List(expenseTracking_viewModel.expense_model, id: \.id) { expense in
            
                        VStack(alignment: .leading) {
                   
                            HStack {
                                   Image(systemName: "folder.fill") // Replace with the appropriate SF Symbol name
                                       .foregroundColor(Color.blue)
                                       .font(.title)
                                   Text("Category: \(expense.category)")
                                       .font(.headline)
                                       .foregroundColor(Color.blue)
                               }
                            
                            HStack {
                                 Image(systemName: "creditcard.fill") // Replace with the appropriate SF Symbol name
                                     .foregroundColor(.secondary)
                                     .font(.subheadline)
                                 Text("Amount: \(String(format: "%.2f", expense.amount))")
                                     .font(.subheadline)
                                     .foregroundColor(.secondary)
                             }
                            HStack {
                                  Image(systemName: "calendar") // Replace with the appropriate SF Symbol name
                                      .foregroundColor(.secondary)
                                      .font(.subheadline)
                                  Text("Date: \(expense.date, formatter: dateFormatter)")
                                      .font(.subheadline)
                                      .foregroundColor(.secondary)
                              }
                            
                            HStack {
                                   Image(systemName: "doc.text") // Replace with the appropriate SF Symbol name
                                       .foregroundColor(.primary)
                                       .font(.body)
                                   Text("Description: \(expense.description)")
                                       .font(.body)
                                       .foregroundColor(.primary)
                               }
                            
                            if let location = expense.location {
                                 HStack {
                                     Image(systemName: "location.fill") // Replace with the appropriate SF Symbol name
                                        .foregroundColor(.primary)
                                         .font(.footnote)
                                     Text("Location: \(location)")
                                         .font(.footnote)
                                         .foregroundColor(.primary)
                                 }
                             }
     
                        }
    
        }.padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
            
            Button(action: {})
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
            
            

            
}
        
        
        
}
}

struct ExpenseTracking_View_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTracking_View()
    }
}

