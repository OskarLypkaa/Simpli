import SwiftUI


// Widok pojedynczego klienta
struct Actions: View {
    var image: Int = 2
    var text: Int = 3
    var other: Int = 1
    
    @Binding var highlighted: Bool

    @State private var isHovered: Bool = false // Stan najechania
    @State private var isPressed: Bool = false // Stan kliknięcia
    
    @State private var showSheet = false
    var actionStatus: ActionStatus

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

            VStack {
                
                // Imię klienta z ikoną
                HStack {
                    Image(systemName: "person.fill")
                        .frame(width: 24, height: 24)
                    Text("Dummy client")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                // Pionowy separator
                Divider()
                    .background(Color.gray)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.")
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    let totalItems = image + text + other
                    let maxDisplayCount = 4

                    let allItems = Array(repeating: "photo.fill", count: image) +
                                   Array(repeating: "text.document.fill", count: text) +
                                   Array(repeating: "document.fill", count: other)

                    ForEach(0..<min(totalItems, maxDisplayCount), id: \.self) { index in
                        Image(systemName: allItems[index])
                            .font(.headline)
                    }

                    if totalItems > maxDisplayCount {
                        Text("+\(totalItems - maxDisplayCount)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    switch actionStatus {
                        case .done:
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                        case .onHold:
                            Image(systemName: "circle.fill")
                                .foregroundColor(.yellow)
                        case .todo:
                            Image(systemName: "circle.fill")
                                .foregroundColor(.red)
                        case .inProgress:
                            Image(systemName: "circle.fill")
                                .foregroundColor(.blue)
                    }
                }
                .padding(.top, 5)
                Spacer()
                Text("\(Date(), formatter: DateFormatter.shortDateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)


                
                
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
    ActionListView()
}
