//
//  Sweet_Bonanzoom_SlotApp.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 24.04.2024.
//

import SwiftUI

@main
struct Sweet_Bonanzoom_SlotApp: App {
    
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
                .onAppear {
//                                    let today = Date()
//                                    UserDefaults.standard.set(today, forKey: "todayDate")
                    print(UserDataManager.shared.firstStart)
                    
                                }
        }
    }
}
