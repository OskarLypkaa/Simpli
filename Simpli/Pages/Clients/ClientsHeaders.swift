import SwiftUI

// Widok nagłówków tabeli z opcją sortowania
struct TableHeaders: View {
    @Binding var sortBy: SortCriteria
    @Binding var isAscending: Bool

    var body: some View {
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
                Text("Email")
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
                Text("Phone")
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
                Text("Address")
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
    }
}
