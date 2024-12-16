import SwiftUI
import Foundation

// --------------------------------- SearchBar ------------------------------------------------

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var showSheet: Bool

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            TextField("Search", text: $searchText)
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
    }
}

// --------------------------------- Clients ------------------------------------------------

enum SortCriteria {
    case name, email, phone, address
}

func filterClients(clients: [Client], searchText: String) -> [Client] {
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

func sortClients(clients: [Client], sortBy: SortCriteria, isAscending: Bool) -> [Client] {
    return clients.sorted { (client1, client2) -> Bool in
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
}

extension DateFormatter {
    static var shortDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short      // Ustawienie formatu daty
        formatter.timeStyle = .short      // Ustawienie formatu godziny
        return formatter
    }
}


// --------------------- To remove in future, it's just for the UI
func randomActionStatus() -> ActionStatus {
    return ActionStatus.allCases.randomElement() ?? .todo // Zwraca "To Do" jako domyślną wartość, jeśli coś poszło nie tak
}

func generateRandomNumber() -> Int {
    return Int.random(in: 0...3)  // Losowa liczba od 0 do 3 (włącznie)
}
