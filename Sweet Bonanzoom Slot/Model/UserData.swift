//
//  UserData.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 28.04.2024.
//

import Foundation

class UserData: ObservableObject {
    @Published var coins: Int = 1000
    @Published var selectedElement: String?
    let elements : [ (String,String, String)] = [("Apple","x2", "Very Common"),
                                                 ("Banana","x3", "Common"),
                                                 ("Plum","x4", "Common"),
                                                 ("Watermelon","x5","Uncommon"),
                                                 ("Grapes","x6","Uncommon"),
                                                 ("Purple candy","x7", "Rare"),
                                                 ("Blue candy","x8", "Rare"),
                                                 ("Green candy","x12", "Very rare"),
                                                 ("Red candy","x20", "Ultra rare")
                                                ]
    @Published var myBackgrounds : [String] = []
    
    
}
