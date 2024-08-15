//
//  Itemview.swift
//  To_do _app
//
//  Created by Abdallah Zayed on 12/07/2024.
//

import SwiftUI

struct Itemview: View {
   let item : item
    
    @Environment(MainViewModel.self) var mainModel
    var body: some View {
        HStack{
            Image(systemName: item.is_done ? "checkmark.circle.fill" :"circle")
                .foregroundStyle(item.is_done ? .green : .red)
            Text(item.title)
                .font(.system(size: 30))
            Spacer()
        }
    }
}

#Preview {
    NavigationStack{
        @State var mainViewModel  = MainViewModel()
        Itemview(item: item(title: "n=br", is_done: false))
            .environment(mainViewModel)
    }
}
