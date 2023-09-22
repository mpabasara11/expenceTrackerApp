//
//  AddExpense_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-22.
//

import SwiftUI

struct AddExpense_View: View {
    
    @ObservedObject var addExpense_viewModel = AddExpense_ViewModel()
    
    
    @State private var selectedOp = "Groceries"

    let predefinedCategories = ["Groceries","Entertainment","Rent","Utilities","Transportation","Dining Out","Shopping"]
    

    var body: some View {
    //    Text("a")
        Form
        {
           
            Section(header: Text("Basic"))
                {
                
                TextField("Description",text:$addExpense_viewModel.expense_model.description)
            
        
                TextField("Place",text: $addExpense_viewModel.expense_model.place)
                
                
                     TextField("Amount",value: $addExpense_viewModel.expense_model.amount,formatter:NumberFormatter())
                 
               
                DatePicker("Date",selection: $addExpense_viewModel.expense_model.date,displayedComponents: .date)
                            
            
     
            }
            Section(header: Text("Additional"))
                {
                Picker("Category",selection: $selectedOp)
                    {
                    ForEach(predefinedCategories, id: \.self)
                        {
                        Text($0)
                        }
                    }.pickerStyle(DefaultPickerStyle())
               // Text("you selected: \(selectedOp)")
                
                         }
            
            Section
            {
                Button(action: {
                    
                }){
                    Text("Submit")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius:5)
                }
                
                Button(action: {
                    
                }){
                    Text("Clear All")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius:5)
                }            }
        }
        
    }
}

struct AddExpense_View_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense_View()
            
    }
}
