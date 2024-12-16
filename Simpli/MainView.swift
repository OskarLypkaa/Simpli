import SwiftUI

struct MainView: View {
    @State private var selectedTab: String = "Home"

    var body: some View {
        NavigationSplitView {
            NavigationSidebar(selectedTab: $selectedTab)
        } detail: {
            // Display different content based on the selectedTab value
            switch selectedTab {
            case "Home":
                WelcomeView()
                    .padding()
            case "Clients":
                ClientListView()
                    .padding()
            case "Actions":
                ActionListView()
                    .padding()
            case "Calendar":
                SimpleCalendar()
                    .padding()
            case "Reports":
                ReportView()
                    .padding()
            case "Settings":
                SettingsView()
                    .padding()
            default:
                Text("Select a Tab")
                    .padding()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
