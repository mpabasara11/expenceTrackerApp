//
//  AddExpense_View.swift
//  expenceTrackerApp
//
//  Created by malindu pabasara on 2023-09-22.
//

import SwiftUI

struct AddExpense_View: View {
    
    @ObservedObject var addExpense_viewModel = AddExpense_ViewModel()
    @State var selectedOp = "Groceries"
  


    let predefinedCategories = ["Groceries","Entertainment","Rent","Utilities","Transportation","Dining Out","Shopping"]
    

    var body: some View {
        NavigationView
        {
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
                   
                    addExpense_viewModel.addExpense()
                }){
                    Text("Submit")
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                       // .padding()
                       // .background(Color.blue)
                    //    .cornerRadius(10)
                     //   .shadow(radius:5)
                }.buttonStyle(BorderlessButtonStyle())
                
                Button(action: {
                    
                }){
                    
                    Text("Clear All")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                       // .padding()
                    //   .background(Color.red)
                     //   .cornerRadius(10)
                     //   .shadow(radius:5)
                    }  } .buttonStyle(BorderlessButtonStyle())           
        }.navigationTitle("Add expense")
    }
        
    }
}

struct AddExpense_View_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense_View()
            
    }
}

