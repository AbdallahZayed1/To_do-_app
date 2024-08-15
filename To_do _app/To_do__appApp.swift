//
//  To_do__appApp.swift
//  To_do _app
//
//  Created by Abdallah Zayed on 12/07/2024.
//

import SwiftUI

@main
struct To_do__appApp: App {
    @State var mainViewModel  = MainViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MainView()
            }
            .environment(mainViewModel)
        }
    }
}
