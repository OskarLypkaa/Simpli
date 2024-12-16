import SwiftUI



struct ActionsHeader: View {
    @State private var selectedStatuses: Set<ActionStatus> = Set(ActionStatus.allCases) // Wszystkie statusy są zaznaczone domyślnie

    var body: some View {
        HStack {
            ForEach(ActionStatus.allCases, id: \.self) { status in
                VStack {
                    // Checkbox (Toggle) dla każdego statusu
                    Toggle(isOn: Binding(
                        get: { selectedStatuses.contains(status) },
                        set: { isSelected in
                            if isSelected {
                                selectedStatuses.insert(status)
                            } else {
                                selectedStatuses.remove(status)
                            }
                        }
                    )) {
                        Text(status.rawValue)
                            .font(.headline)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.trailing, 30)
    }
}

#Preview {
    ActionListView()
}
