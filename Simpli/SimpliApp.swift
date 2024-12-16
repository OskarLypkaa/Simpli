import SwiftUI

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .frame(minWidth: 1200, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
        }
    }
}

