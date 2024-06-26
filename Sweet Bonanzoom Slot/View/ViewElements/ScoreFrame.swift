//
//  ScoreFrame.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 26.04.2024.
//

import SwiftUI

struct ScoreFrame: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack{ //MARK: score frame
            Image("ScoreFrame")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 45)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
            
            Text(String(userData.coins))
                .font(.custom("Maven Pro", size: 18))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                .padding(.bottom, 5)
                .frame(width: 80)
                .lineLimit(1)
            
            Image("ScoreItem")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .padding(.top , 25)
                .padding(.leading, 100)
        }
    }
}

