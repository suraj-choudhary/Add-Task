//
//  ListRowView.swift
//  TODOLIST
//
//  Created by suraj kumar on 10/03/23.
//

import SwiftUI
/// List Row View
struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static let item = ItemModel(title: "this is title", isCompleted: true)
    static let item2 = ItemModel(title: "this is title", isCompleted: false)
    static var previews: some View {
        Group {
            ListRowView(item: item)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)

        
    }
}
