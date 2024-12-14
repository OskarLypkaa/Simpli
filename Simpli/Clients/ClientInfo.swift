import SwiftUI

struct ClientInfo: View {
    
    var body: some View {
        VStack(spacing: 20) {
            // Nagłówek
            Text("Informacje o kliencie")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // Imię klienta
            HStack {
                Text("Imię:")
                    .font(.headline)
                Text("Example name")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // Email klienta
            HStack {
                Text("Email:")
                    .font(.headline)
                Text("Example email")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // Telefon klienta
            HStack {
                Text("Phone:")
                    .font(.headline)
                Text("Example phone")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            // Adres klienta
            HStack {
                Text("Address:")
                    .font(.headline)
                Text("Example address")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}
