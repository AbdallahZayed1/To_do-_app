//
//  add_View.swift
//  To_do _app
//
//  Created by Abdallah Zayed on 12/07/2024.
//

import SwiftUI

struct add_View: View {
    @State var showalert : Bool = false
    @State var task : String = ""
   @State var alert_title : String = ""
    @Environment(MainViewModel.self) var mainModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
       
        ScrollView{
            VStack{
                TextField("type something ...", text: $task)
                    
                    .font(.system(size: 30))
                    .padding()
                   
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray)
                           
                    ).padding(.horizontal)
                
                Button(action: {
                    if appropriate() {
                 
                        mainModel.add(title: task)
                        dismiss()
                    }
                    
                }, label: {
                    Text("Save")
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , minHeight: 60)
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        .padding()
                })
            }
        } .padding(.vertical)
        .navigationTitle("Add a Task")
        .alert(alert_title, isPresented: $showalert, actions: {
            
        })
    }
    func appropriate() -> Bool {
        if task.count < 3 {
            showalert.toggle()
            alert_title = "can not be less than 3"
            return false
        }
        return true
    }
    
}

#Preview {
    NavigationStack{
        NavigationStack{
            @State var mainViewModel  = MainViewModel()
            add_View()
                .environment(mainViewModel)
        }
    }
}
