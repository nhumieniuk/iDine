//
//  iDineApp.swift
//  iDine
//
//  Created by Student on 8/30/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    @StateObject var favorite = Favorites()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(favorite)
                .environmentObject(order)
        }
        
    }
}
