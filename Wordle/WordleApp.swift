//
//  WordleApp.swift
//  Wordle
//
//  Created by Tugs Khaliunbat on 6/9/23.
//

import SwiftUI

@main
struct WordleApp: App {
    @StateObject var dm = WordleDataModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
