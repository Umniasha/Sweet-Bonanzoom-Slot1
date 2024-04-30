//
//  InfoButton.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 26.04.2024.
//

import SwiftUI

struct TopBarIcon: View {
    var imageName : String 
    var body: some View {
        
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 50)
            .shadow(color: .black, radius: 2, x: 0, y: 2)

//
    }
}

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        TopBarIcon(imageName: "InfoBTN")
    }
}
