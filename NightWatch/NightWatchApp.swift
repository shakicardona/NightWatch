//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Mar Cardona Aranda on 1/12/25.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @State private var nightWatchViewModel = NightWatchViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchViewModel: self.nightWatchViewModel)
        }
    }
}
