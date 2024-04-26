//
//  Gifts.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 26.04.2024.
//

import Foundation

struct Gifts: Identifiable {
    
    enum BoxType: String {
            case Box1, Box2, Box3, Box4, Box5
        }
    
    let id = UUID()
    var lastDate: Int
    var isOpened: Bool
    let dayInterval = 24 * 60 * 60
    
    func letBoxes() ->[Gifts]{
        if lastDate < dayInterval {
            
        }
        return []
    }
    
    
    
}
