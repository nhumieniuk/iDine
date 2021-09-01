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
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
