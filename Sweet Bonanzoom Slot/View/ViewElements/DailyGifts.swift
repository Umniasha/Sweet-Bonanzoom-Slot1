//
//  DailyGifts.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 26.04.2024.
//

import SwiftUI

struct DailyGifts: View {
    var body: some View {
        
        ZStack{
            Image("GiftLine")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            HStack{
                
                ForEach(0..<5) {i in
                    if i < 4 {
                    Image("ClosedBox\(i+1)")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Spacer()
                    } else {
                        Image("ClosedBox\(i+1)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)
                    }
                }
            }
        }
        
    }
    func showGifts(){
        
    }
}

struct DailyGifts_Previews: PreviewProvider {
    static var previews: some View {
        DailyGifts()
    }
}
