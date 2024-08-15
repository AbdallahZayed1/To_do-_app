//
//  MainView.swift
//  To_do _app
//
//  Created by Abdallah Zayed on 12/07/2024.
//

import SwiftUI

struct MainView: View {
   
    @Environment(MainViewModel.self) var mainModel
    
   
    var body: some View {
       
      
      
           List(content: {
               //kanet
               ForEach(mainModel.list_items) { item in
                   Itemview(item: item)
                       .onTapGesture {
                           mainModel.update_completion(itex: item)
                       }
               }
               .onDelete(perform: mainModel.delete)
               .onMove(perform: mainModel.move)
               
           }
           )
           .navigationTitle("To Do App ")
           
           .toolbar(content: {
               ToolbarItem(placement: .topBarLeading) {
                   EditButton()
               }
               ToolbarItem(placement: .topBarTrailing) {
                   NavigationLink("add") {
                       add_View()
                   }
                   
               }
               ToolbarItem(placement: .bottomBar) {
                   Button(action: {
                       mainModel.delete_all()
                
                   }, label: {
                       Text("Clear queue")
                           .foregroundStyle(.red)
                           .font(.system(size: 25 , weight: .bold))
                           
                           
                           
                   })
               }
           })
        
            }

    
}

#Preview {
    NavigationStack{
        @State var mainViewModel  = MainViewModel()
        MainView()
            .environment(mainViewModel)
    }
}
