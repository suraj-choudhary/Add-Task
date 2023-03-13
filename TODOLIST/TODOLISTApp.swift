//
//  TODOLISTApp.swift
//  TODOLIST
//
//  Created by suraj kumar on 10/03/23.
//

import SwiftUI

@main
struct TODOLISTApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
