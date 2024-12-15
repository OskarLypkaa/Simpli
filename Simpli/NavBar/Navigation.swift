import SwiftUI

struct CustomCard: View {
    var title: String
    var imageName: String
    var isSelected: Bool // Przekazywany z nadrzędnego widoku
    @State private var isHovered: Bool = false // Obsługa efektu hover (jeśli potrzebna)

    var body: some View {
        ZStack {
            // Background color z dynamicznym efektem zaznaczenia i hover
            Rectangle()
                .fill(isSelected ? Color.gray.opacity(0.2) : (isHovered ? Color.gray.opacity(0.05) : Color.clear))
                .cornerRadius(8)

            HStack {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                Image(systemName: imageName)
                    .frame(maxWidth: .infinity)
            }
            .font(.title2)
            .padding(.vertical, 6)
            .scaleEffect(isHovered ? 1.01 : 1) // Efekt powiększenia przy hover
        }
        .frame(maxWidth: .infinity)
        .onHover { hovering in
            withAnimation {
                isHovered = hovering // Obsługa hover
            }
            if isHovered {
                NSCursor.pointingHand.set()
            }
            else {
                NSCursor.arrow.set()
            }
        }
    }
}

#Preview {
    ContentView()
}
