import SwiftUI
// Widok listy klientów z filtrowaniem i nagłówkami
struct ClientListView: View {
    let clients = [
        Client(name: "John Doe", email: "john.doe@example.com", phone: "+1 234 567 890", address: "123 Elm Street, Springfield"),
        Client(name: "Jane Smith", email: "jane.smith@example.com", phone: "+1 987 654 321", address: "456 Oak Avenue, Rivertown"),
        Client(name: "Michael Brown", email: "michael.brown@example.com", phone: "+44 123 456 789", address: "789 Pine Road, Londontown"),
        Client(name: "Emily Davis", email: "emily.davis@example.com", phone: "+61 987 654 321", address: "101 Maple Lane, Sydney"),
        Client(name: "Chris Johnson", email: "chris.johnson@example.com", phone: "+49 234 567 890", address: "202 Birch Street, Berlin"),
        Client(name: "Patricia Wilson", email: "patricia.wilson@example.com", phone: "+33 123 456 789", address: "303 Cedar Boulevard, Paris"),
        Client(name: "David Miller", email: "david.miller@example.com", phone: "+81 987 654 321", address: "404 Redwood Avenue, Tokyo"),
        Client(name: "Sarah Taylor", email: "sarah.taylor@example.com", phone: "+86 123 456 789", address: "505 Willow Drive, Beijing"),
        Client(name: "Robert Anderson", email: "robert.anderson@example.com", phone: "+34 234 567 890", address: "606 Palm Road, Madrid"),
        Client(name: "Laura Martinez", email: "laura.martinez@example.com", phone: "+39 987 654 321", address: "707 Fir Street, Rome")
    ]
    
    @State private var searchText: String = ""
    @State private var startAnimation: Bool = false
    
    var filteredClients: [Client] {
        if searchText.isEmpty {
            return clients
        } else {
            return clients.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.email.lowercased().contains(searchText.lowercased()) ||
                $0.phone.lowercased().contains(searchText.lowercased()) ||
                $0.address.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack {
            // Pasek wyszukiwania
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                TextField("Wyszukaj klienta", text: $searchText)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.vertical)
            
            // Nagłówki tabeli
            
            ZStack {

                HStack {
                    Text("Name")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Email")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Phone")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Address")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            .padding(.leading, 35)
            .padding(.trailing, 35)
        

            


            // Lista klientów
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(filteredClients, id: \.name) { client in
                        Clients(
                            clientName: client.name,
                            clientEmail: client.email,
                            clientPhone: client.phone,
                            clientAddress: client.address,
                            isHighlighted: startAnimation
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ClientListView()
}

// Poprawić trzeba żeby na żółto wyświetlały się wyszukane pliki
// Trzeba zrobić tak żeby na góże po między polem wyszukania a elementami pojawił się pasek name email itp
// Animacja klikania klienta ma być a animacja najechania ma też powiększać tekst
// trzeba wyrównać pasek na górze i pasek scrolowania
// dodać filtr
// elementy każdego okna mają być w równej odległości
