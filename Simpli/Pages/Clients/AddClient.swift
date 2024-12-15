import SwiftUI

struct AddClient: View {
    @State private var clientName: String = ""
    @State private var clientEmail: String = ""
    @State private var clientPhone: String = ""
    @State private var clientAddress: String = ""

    var body: some View {
        VStack(spacing: 20) {
            // Nagłówek formularza
            Text("Add new client")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            // Pole dla imienia klienta
            HStack {
                Text("Name:   ")
                    .font(.headline)
                TextField("Set name", text: $clientName)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }

            // Pole dla emaila klienta
            HStack {
                Text("Email:    ")
                    .font(.headline)
                TextField("Set email", text: $clientEmail)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }

            // Pole dla telefonu klienta
            HStack {
                Text("Phone:   ")
                    .font(.headline)
                TextField("Set phone", text: $clientPhone)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }

            // Pole dla adresu klienta
            HStack {
                Text("Address:")
                    .font(.headline)
                TextField("Set address", text: $clientAddress)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .padding(.horizontal)
            }

            // Przycisk "Dodaj klienta"
            Button(action: {
                // Akcja po kliknięciu przycisku (na razie pusta)
            }) {
                Text("Add client")
                    .font(.headline) // Zwiększona czcionka
                    .foregroundColor(.primary) // Kolor tekstu - w zależności od ustawienia motywu (czarny w jasnym, biały w ciemnym)
                    .frame(maxWidth: .infinity, maxHeight: 60) // Ustalamy szerokość i wysokość
                    .background(Color.gray.opacity(0.1)) // Tło przycisku (delikatna szarość)
                    .cornerRadius(8) // Zaokrąglone rogi
                   
            }


            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddClient()
}
