import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedTab: String = "Clients" // State to track
    @State private var isSelected: Bool = false

    var body: some View {
        NavigationSplitView {
            List {
                // Home Tab
                CustomCard(
                    title: "Home",
                    imageName: "house.fill",
                    isSelected: selectedTab == "Home"
                )
                .onTapGesture {
                    selectedTab = "Home"
                }

                // Clients Tab
                CustomCard(
                    title: "Clients",
                    imageName: "person.fill",
                    isSelected: selectedTab == "Clients"
                )
                .onTapGesture {
                    selectedTab = "Clients"
                }

                // Actions Tab
                CustomCard(
                    title: "Actions",
                    imageName: "book.fill",
                    isSelected: selectedTab == "Actions"
                )
                .onTapGesture {
                    selectedTab = "Actions"
                }

                // Raports Tab
                CustomCard(
                    title: "Raports",
                    imageName: "chart.pie.fill",
                    isSelected: selectedTab == "Raports"
                )
                .onTapGesture {
                    selectedTab = "Raports"
                }

                // Data Tab
                CustomCard(
                    title: "Data",
                    imageName: "chart.bar.fill",
                    isSelected: selectedTab == "Data"
                )
                .onTapGesture {
                    selectedTab = "Data"
                }
            }
            .padding(.top, 10)
            .navigationSplitViewColumnWidth(min: 100, ideal: 160, max: 200)
        } detail: {
            // Display different content based on the selectedTab value
            switch selectedTab {
            case "Home":
                Text("Tu będzie główna strona")
                    .padding()
            case "Clients":
                ClientListView() // Dodanie widoku ClientFieldsView
                    .padding()
            case "Actions":
                Text("Tu będą rzeczy związane z klientami")
                    .padding()
            case "Data":
                Text("Tu będą dane")
                    .padding()
            case "Raports":
                Text("Tu będą raporty")
                    .padding()
            default:
                Text("Select a Tab")
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
