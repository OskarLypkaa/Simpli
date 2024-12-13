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
                Image(systemName: imageName)
            }
            .font(.title2)
            .padding(.vertical, 6)
            .scaleEffect(isHovered ? 1.02 : 1) // Efekt powiększenia przy hover
        }
        .frame(maxWidth: .infinity)
        .onHover { hovering in
            withAnimation {
                isHovered = hovering // Obsługa hover
            }
        }
    }
}

#Preview {
    ContentView()
}
