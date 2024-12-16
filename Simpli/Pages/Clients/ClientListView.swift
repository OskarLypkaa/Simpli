import SwiftUI

struct ClientListView: View {
    @State private var searchText: String = ""
    @State private var highlighted: Bool = false
    @State private var sortBy: SortCriteria = .name
    @State private var isAscending: Bool = true
    @State private var showSheet = false
    
    var filteredClients: [Client] {
        filterClients(clients: clients, searchText: searchText)
    }
    
    var sortedClients: [Client] {
        sortClients(clients: filteredClients, sortBy: sortBy, isAscending: isAscending)
    }
    
    var body: some View {
        VStack {
            HStack {
                // Użycie paska wyszukiwania
                SearchBar(searchText: $searchText, showSheet: $showSheet)
                    .onChange(of: searchText) {
                        highlighted = true
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            highlighted = false
                        }
                    }
                HStack {
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
                .padding(.trailing, 37)
            }
            
            // Użycie nagłówków tabeli
            TableHeaders(sortBy: $sortBy, isAscending: $isAscending)
            
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
