import SwiftUI

enum ActionStatus: String, CaseIterable, Identifiable {
    case todo = "To Do"
    case inProgress = "In Progress"
    case onHold = "On Hold"
    case done = "Done"

    var id: String { rawValue }
}

struct ActionListView: View {
    
    @State private var searchText: String = ""
    @State private var highlighted: Bool = false

    @State private var isAscending: Bool = true
    @State private var showSheet = false


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    // Search bar
                    SearchBar(searchText: $searchText, showSheet: $showSheet)
                        .onChange(of: searchText) {
                            highlighted = true
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                highlighted = false
                            }
                        }
                    
                    // Icon button
                    HStack {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                            .font(.system(size: 30))
                            .padding(.bottom, 10)
                            .onHover { hovering in
                                if hovering {
                                    NSCursor.pointingHand.set()
                                } else {
                                    NSCursor.arrow.set()
                                }
                            }
                    }
                    .padding(.trailing, 32)
                }

                HStack(alignment: .top, spacing: 16) {
                    ForEach(ActionStatus.allCases, id: \.id) { status in
                        VStack {
                            Text(status.rawValue)
                                .font(.headline)
                                .padding(.bottom, 8)

                            VStack(spacing: 8) {
                                ForEach(clients, id: \.name) { client in
                                    Actions(
                                        image: generateRandomNumber(),
                                        text: generateRandomNumber(),
                                        other: generateRandomNumber(),
                                        highlighted: $highlighted,
                                        actionStatus: status
                                    )
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .cornerRadius(8)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


struct ActionListView_Previews: PreviewProvider {
    static var previews: some View {
        ActionListView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
