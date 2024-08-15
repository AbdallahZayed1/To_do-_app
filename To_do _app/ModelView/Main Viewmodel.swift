//
//  Main Viewmodel.swift
//  To_do _app
//
//  Created by Abdallah Zayed on 12/07/2024.
//
import SwiftUI
import Foundation

@Observable class MainViewModel {
    
    let key : String = "items"
    var list = Data()
    var list_items : [item] = []{
       
        didSet{
            save_items()
        }
    }
    
    init() {
        
        getItems()
    }
    func getItems (){
        
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let saveditems = try? JSONDecoder().decode([item].self, from: data)
        else{
            return
        }
        list_items = saveditems
        
    }
    
    func delete_all (){
        list_items.removeAll()
    }
    
    func delete (at : IndexSet) {
        list_items.remove(atOffsets: at)
    }
    
    func move (from : IndexSet , to : Int) {
        list_items.move(fromOffsets: from, toOffset: to)
    }
    func add ( title : String){
        list_items.append(item(title: title, is_done: false))
    }
    func update_completion (itex : item)  {
        if let index = list_items.firstIndex(where: { item -> Bool in
            return  item.id == itex.id
        }){
            list_items[index] = itex.change_status()
        }
        
    }
    func save_items () {
        if let encodedData = try? JSONEncoder().encode(list_items)
        {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
    
}
//    func to_json () -> Data {
//        if let converted = try? JSONEncoder().encode(list_items){
//            return converted
//        }else{
//           return Data()
//        }
//    }
//    
//    func from_json (data : Data) -> [item] {
//        if let converted = try? JSONDecoder().decode( [item].self , from: data){
//            return converted
//        }else{
//           return []
//        }
//    }
//    
//    }
//
//// kol da fi el adim meno






