import SwiftUI

// Widok pojedynczego klienta
struct Clients: View {
    var clientName: String
    var clientEmail: String
    var clientPhone: String
    var clientAddress: String

    @Binding var highlighted: Bool

    @State private var isHovered: Bool = false // Stan najechania
    @State private var isPressed: Bool = false // Stan kliknięcia
    
    @State private var showSheet = false

    var body: some View {
        ZStack {
            // Tło z animacją
            Rectangle()
                .fill(
                    highlighted ? Color.yellow.opacity(0.2) :
                    isPressed ? Color.gray.opacity(0.3) :
                    isHovered ? Color.gray.opacity(0.12) :
                    Color.gray.opacity(0.07)
                )
                .cornerRadius(8)
                .animation(.easeInOut(duration: 0.7), value: highlighted) // Animacja koloru

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
                Divider()
                    .frame(height: 30)
                    .background(Color.gray)

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
                Divider()
                    .frame(height: 30)
                    .background(Color.gray)

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
                Divider()
                    .frame(height: 30)
                    .background(Color.gray)

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
        .scaleEffect(isHovered ? 1.005 : 1) // Powiększenie przy hover
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
        .onTapGesture {
            isPressed.toggle() // Zmiana stanu kliknięcia
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            ClientInfo() // Okno, które się pojawi po kliknięciu przycisku
        }
        .onAppear {
            // Zaczynamy nasłuchiwanie na naciśnięcie klawisza ESC
            NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
                if event.keyCode == 53 { // ESC key code
                    isPressed = false // Zmieniamy stan na false po naciśnięciu ESC
                }
                return event
            }
        }
    
    }
}

#Preview {
    ClientListView()
}
