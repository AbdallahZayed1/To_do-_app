//
//  Model data.swift
//  To_do _app
//
//  Created by Abdallah Zayed on 12/07/2024.
//

import Foundation
//Immutable struct
struct item : Identifiable , Codable {
    let id :  String
    let title : String
    let is_done : Bool
    
    init( id : String = UUID().uuidString , title : String , is_done : Bool) {
        self.id = id
        self.is_done = is_done
        self.title = title
    }
    func change_status () -> Self{
        return item(id: id , title: title, is_done: !is_done)
    }
}
