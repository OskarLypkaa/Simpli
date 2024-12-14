import SwiftUI


// Widok listy klientów z filtrowaniem i sortowaniem
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
    @State private var highlighted: Bool = false
    @State private var sortBy: SortCriteria = .name
    @State private var isAscending: Bool = true // Dodane: flaga do przełączania porządku sortowania
    @State private var showSheet = false
    
    enum SortCriteria {
        case name, email, phone, address
    }
    
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
    
    var sortedClients: [Client] {
        let sorted = filteredClients.sorted { (client1, client2) -> Bool in
            switch sortBy {
            case .name:
                return isAscending ? client1.name < client2.name : client1.name > client2.name
            case .email:
                return isAscending ? client1.email < client2.email : client1.email > client2.email
            case .phone:
                return isAscending ? client1.phone < client2.phone : client1.phone > client2.phone
            case .address:
                return isAscending ? client1.address < client2.address : client1.address > client2.address
            }
        }
        return sorted
    }
    
    var body: some View {
        VStack {
            // Pasek wyszukiwania
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                TextField("Search for client", text: $searchText)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                Image(systemName: "person.fill.badge.plus")
                    .font(.system(size: 30))
                    .padding(.leading, 15)
                    .padding(.top, 5)
                    .onHover { hovering in
                        if hovering {
                            NSCursor.pointingHand.set()
                        } else {
                            NSCursor.arrow.set()
                        }
                    }
                    .onTapGesture {
                        showSheet.toggle()
                    }
                    .sheet(isPresented: $showSheet) {
                        AddClient() // Okno, które się pojawi po kliknięciu przycisku
                    }
                Image(systemName: "person.fill.badge.minus")
                    .font(.system(size: 30))
                    .padding(.leading, 15)
                    .padding(.top, 5)
                    .onHover { hovering in
                        if hovering {
                            NSCursor.pointingHand.set()
                        } else {
                            NSCursor.arrow.set()
                        }
                    }
            }
            .padding(.trailing, 20)
            .padding()
            .onChange(of: searchText) {
                highlighted = true
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    highlighted = false
                }
            }

            // Nagłówki tabeli (kliknięcie sortuje)
            HStack {
                HStack {
                    Text("Name")
                        .font(.headline)
                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                        .foregroundColor(.gray)
                        .frame(width: 10, height: 10)
                        .padding(.leading, 3)
                        .onHover { hovering in
                            if hovering {
                                NSCursor.pointingHand.set()
                            } else {
                                NSCursor.arrow.set()
                            }
                        }
                        .onTapGesture {
                            sortBy = .name
                            isAscending.toggle() // Przełączenie porządku sortowania
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("email")
                        .font(.headline)
                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                        .foregroundColor(.gray)
                        .frame(width: 10, height: 10)
                        .padding(.leading, 3)
                        .onHover { hovering in
                            if hovering {
                                NSCursor.pointingHand.set()
                            } else {
                                NSCursor.arrow.set()
                            }
                        }
                        .onTapGesture {
                            sortBy = .email
                            isAscending.toggle() // Przełączenie porządku sortowania
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("phone")
                        .font(.headline)
                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                        .foregroundColor(.gray)
                        .frame(width: 10, height: 10)
                        .padding(.leading, 3)
                        .onHover { hovering in
                            if hovering {
                                NSCursor.pointingHand.set()
                            } else {
                                NSCursor.arrow.set()
                            }
                        }
                        .onTapGesture {
                            sortBy = .phone
                            isAscending.toggle() // Przełączenie porządku sortowania
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("address")
                        .font(.headline)
                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                        .foregroundColor(.gray)
                        .frame(width: 10, height: 10)
                        .padding(.leading, 3)
                        .onHover { hovering in
                            if hovering {
                                NSCursor.pointingHand.set()
                            } else {
                                NSCursor.arrow.set()
                            }
                        }
                        .onTapGesture {
                            sortBy = .address
                            isAscending.toggle() // Przełączenie porządku sortowania
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.leading, 70)
            .padding(.trailing, 0)

            // Lista klientów
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(sortedClients, id: \.name) { client in
                        Clients(
                            clientName: client.name,
                            clientEmail: client.email,
                            clientPhone: client.phone,
                            clientAddress: client.address,
                            highlighted: $highlighted
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
