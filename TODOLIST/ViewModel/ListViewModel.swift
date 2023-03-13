//
//  ListViewModel.swift
//  TODOLIST
//
//  Created by suraj kumar on 11/03/23.
//

import Foundation
class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    let itemKey: String = "item_list"
    init() {
        getItems()
    }
    func getItems() {
        
        guard let data = UserDefaults.standard.data(forKey: itemKey) else {
           return
        }
        
        guard let saveItem = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        
        self.items = saveItem
        
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)

    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    
    func updateItem(item: ItemModel) {
        
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.title == item.title
//        } {
//
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    
    func saveItem() {
        if let endcodedData = try? JSONEncoder().encode(items) {
            
            UserDefaults.standard.set(endcodedData, forKey: itemKey)
        }
            
    }
}
