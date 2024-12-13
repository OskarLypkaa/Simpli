import SwiftUI

// Widok pojedynczego klienta
struct Clients: View {
    var clientName: String
    var clientEmail: String
    var clientPhone: String
    var clientAddress: String
    var isHighlighted: Bool // Przekazywana z zewnątrz właściwość do animacji

    @State private var isHovered: Bool = false // Stan najechania
    @State private var isPressed: Bool = false // Stan kliknięcia

    @State private var highlightAnimation: Bool = false

    var body: some View {
        ZStack {
            // Tło z animacją
            Rectangle()
                .fill(highlightAnimation ? Color.yellow.opacity(0.1) : Color.gray.opacity(0.1))
                .cornerRadius(8)
                .shadow(radius: 5)
                .scaleEffect(isHovered ? 1.05 : 1) // Powiększenie przy hover
                .onHover { hovering in
                    isHovered = hovering // Zmiana stanu podczas najechania
                }

            HStack {
                // Imię klienta z ikoną
                HStack {
                    Image(systemName: "person.fill")
                        .frame(width: 24, height: 24)
                    Text(clientName)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Pionowy separator
                Rectangle()
                    .frame(width: 1, height: 30)
                    .foregroundColor(.gray)

                // Email z ikoną
                HStack {
                    Image(systemName: "envelope.fill")
                        .frame(width: 24, height: 24)
                    Text(clientEmail)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Pionowy separator
                Rectangle()
                    .frame(width: 1, height: 30)
                    .foregroundColor(.gray)

                // Telefon z ikoną
                HStack {
                    Image(systemName: "phone.fill")
                        .frame(width: 24, height: 24)
                    Text(clientPhone)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Pionowy separator
                Rectangle()
                    .frame(width: 1, height: 30)
                    .foregroundColor(.gray)

                // Adres z ikoną
                HStack {
                    Image(systemName: "map.fill")
                        .frame(width: 24, height: 24)
                    Text(clientAddress)
                        .lineLimit(1)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(16)
        }
    }
}
#Preview {
    ClientListView()
}
