//
//  AddView.swift
//  TODOLIST
//
//  Created by suraj kumar on 11/03/23.
//
import SwiftUI
struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Somthing here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            }
            .padding(14)
            
        }
        .navigationTitle("Add an item🖊")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    
    func saveButtonPressed() {
        if textIsApproprate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
            
        }
    }
    
    func textIsApproprate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "You new todo Item must be at least 3 Character🥱🥴"
            showAlert.toggle()
            
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
        
    }
}
