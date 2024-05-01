import SwiftUI


import SwiftUI

struct ChestView: View {
    @State private var kek: Bool = true
    
    var body: some View {
        Toggle(isOn: $kek) {
            Text("hello")
        }
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
