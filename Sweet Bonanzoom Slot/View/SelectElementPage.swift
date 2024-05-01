//
//  SelectElementPage.swift
//  Sweet Bonanzoom Slot
//
//  Created by Oleg Arnaut  on 01.05.2024.
//

import SwiftUI

struct SelectElementPage: View {
    
    @EnvironmentObject var userData: UserData
    var closeButtonAction: ()->Void
    @State private var selectedElement: String?
   
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Spacer()
                Text("CHOOSE YOUR\nKEY ELEMENT")
                    .font(.custom("Maven Pro", size: 18))
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                Spacer()
                Button {
                    closeButtonAction()
                } label: {
                    TopBarIcon(imageName: "Close")
                }

                
            }
            Spacer()
            
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { column in
                        let index = (row * 3) + column
                        if let element = userData.elements[index] {
                            ChooseElement(elementName: element.0, select: selectedElement == element.0, common: element.2, multiplier: element.1, action: {
                                self.selectedElement = element.0
                            })
                        }
                    }
                }
            }
            Spacer()
            Button {
                userData.selectedElement = selectedElement
                closeButtonAction()
            } label: {
                ZStack{
                    Image(selectedElement != nil ? "AutoSpin": "speenNotActive")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ContentView().frameWidth/2.5)
                    
                    Text("CONFIRM")
                        .font(.custom("Maven Pro", size: 18))
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                        .padding(.bottom, 3)
                }
            }
            .disabled(selectedElement==nil)

            
            
            Spacer()
        }
        .navigationBarHidden(true)
        .background(Image("SelectBG")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fill)
            .frame(width: ContentView().frameWidth))
        .padding([.leading,.trailing])
    }
}

struct SelectElementPage_Previews: PreviewProvider {
    static var previews: some View {
        SelectElementPage( closeButtonAction: {})
            .environmentObject(UserData())
    }
}
