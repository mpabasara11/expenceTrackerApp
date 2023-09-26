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
    
    
    //custom numberformatter for removing zero on textboxes
    let quentityFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        formatter.allowsFloats = false
      //  formatter.allowsFloats = true
    
        return formatter
    }()
    
    

    var body: some View {
        NavigationView
        {
        Form
        {
           
            Section(header: Text("Basic"))
                {
                
                TextField("Description",text:$addExpense_viewModel.expense_model.description)   .alert(isPresented: $addExpense_viewModel.notValiDescription) {
                    Alert(title: Text("Empty Description"), message: Text("Description cannot be empty"), dismissButton: .default(Text("OK"))
                        {
                        addExpense_viewModel.dismissAlert()
                    })}
        
                TextField("Place",text: $addExpense_viewModel.expense_model.place)
                    .alert(isPresented: $addExpense_viewModel.notValidPlace) {
                        Alert(title: Text("Empty Place"), message: Text("Place cannot be empty"), dismissButton: .default(Text("OK"))
                            {
                            addExpense_viewModel.dismissAlert()
                        })}
                
                //this alert is for amount textfield.but it seems alerts are not working with textfield which output values
                    .alert(isPresented: $addExpense_viewModel.notValidAmountValueZero) {
                        Alert(title: Text("Empty Amount"), message: Text("Amount cannot be empty"), dismissButton: .default(Text("OK"))
                            {
                            addExpense_viewModel.dismissAlert()
                        })}
                
                
                
                
                
                
                
                    TextField("Amount",value: $addExpense_viewModel.expense_model.amount,formatter:quentityFormatter).keyboardType(.decimalPad)
                 
                    
            
                
          
                
                DatePicker("Date",selection: $addExpense_viewModel.expense_model.date,displayedComponents: .date)
                            
            
     
            
            
                
                //not success alert
                .alert(isPresented: $addExpense_viewModel.notSuccessOperation) {
                    Alert(title: Text("Something Happened!"), message: Text("Could not add the expense.plese try again"), dismissButton: .default(Text("OK"))
                        {
                       
                    })}
                
                //success alert
                .alert(isPresented: $addExpense_viewModel.successOperation) {
                    Alert(title: Text("Success"), message: Text("Expense added successfully"), dismissButton: .default(Text("OK"))
                        {
                        addExpense_viewModel.clearFields()
                        
                    })}
                
                
                
                
                
                
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
                   
                    
                    //assigning local catagory value to the model value since it cannot do outside of a method
                    addExpense_viewModel.expense_model.category = selectedOp
                    
                    
                    //setting the username before calling the method
                    addExpense_viewModel.expense_model.userId = "test user"
                    
                    
                    addExpense_viewModel.addExpense(userId:addExpense_viewModel.expense_model.userId, description: addExpense_viewModel.expense_model.description, place: addExpense_viewModel.expense_model.place, amount: addExpense_viewModel.expense_model.amount, date: addExpense_viewModel.expense_model.date, category: addExpense_viewModel.expense_model.category)
                }){
                    Text("Submit")
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                 
                }.buttonStyle(BorderlessButtonStyle())
                
                Button(action: {
                    addExpense_viewModel.clearFields()
                }){
                    
                    Text("Clear All")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
              
                    }  } .buttonStyle(BorderlessButtonStyle())           
        }.navigationTitle("Add expense")
    }
        
    }
}

struct AddExpense_View_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense_View()
            .preferredColorScheme(.dark)
            
    }
}

