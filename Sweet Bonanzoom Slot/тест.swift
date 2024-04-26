import SwiftUI


import SwiftUI

struct ChestView: View {
    @State private var chests: [Chest] = [
        Chest(type: .gold),
        Chest(type: .silver),
        Chest(type: .bronze),
        Chest(type: .diamond),
        Chest(type: .wooden)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(chests) { chest in
                Button(action: {
                    if chest.isOpened {
                        // Здесь можно добавить действие по нажатию на открытый сундук
                        print("Opened \(chest.type.rawValue)")
                    } else {
                        print("This chest is not available yet")
                    }
                }) {
                    Text(chest.type.rawValue.capitalized)
                        .foregroundColor(chest.isOpened ? .primary : .gray)
                }
                .disabled(!chest.isOpened)
            }
        }
        .padding()
    }
}

struct kek: View {
    var body: some View {
        ChestView()
    }
}

struct Chest: Identifiable {
    enum ChestType: String {
        case gold, silver, bronze, diamond, wooden
    }
    let id = UUID()
    var type: ChestType
    var isOpened: Bool
    
    init(type: ChestType) {
        self.type = type
        // Для примера, предположим, что только сундук типа "gold" открыт
        self.isOpened = type == .gold
    }
}



struct  kek_Previews: PreviewProvider {
    static var previews: some View {
        kek()
    }
}
