//
//  ListView.swift
//  TODOLIST
//
//  Created by suraj kumar on 10/03/23.
//

import SwiftUI
struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                
                NoteItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { items in
                        ListRowView(item: items)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: items)
                                }
                                
                            }
                    }
                    .onDelete { indexSet in
                        
                        listViewModel.deleteItem(indexSet: indexSet)
                    }
                    .onMove { indexSet, newOffSet in
                        listViewModel.moveItem(from: indexSet, to: newOffSet)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
     
        .navigationTitle("ToDo List📝")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink(destination: AddView(), label: {
            Text("Add")
        }))
    }
    
}

/// Preview
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ListView()
            
        }
        .environmentObject(ListViewModel())
    }
}


