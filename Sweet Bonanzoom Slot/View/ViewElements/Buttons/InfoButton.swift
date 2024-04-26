//
//  InfoButton.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 26.04.2024.
//

import SwiftUI

struct InfoButton: View {
    var body: some View {
        Button(action: {
            
            
                }) {
                    Image("InfoBTN")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        
                }
    }
}

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        InfoButton()
    }
}
