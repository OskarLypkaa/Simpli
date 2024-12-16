import SwiftUI

class Settings: ObservableObject {
    // Singleton dla globalnego dostępu
    static let shared = Settings()

    // Ścieżka do bazy danych i plików
    @Published var sharedPath: String

    // Tryb jasny/ciemny
    @Published var themeMode: ThemeMode

    // Wybrany język
    @Published var language: Language

    // Prywatny inicjalizator, aby wymusić użycie singletona
    private init(
        sharedPath: String = "",
        themeMode: ThemeMode = .system,
        language: Language = .english
    ) {
        self.sharedPath = sharedPath
        self.themeMode = themeMode
        self.language = language
    }
    
    // Zapisz ustawienia (do implementacji w przyszłości)
    func saveSettings() {
        // Możesz zaimplementować zapis do pliku tutaj
        print("Settings saved!")
    }
}

// Enum dla trybu jasny/ciemny
enum ThemeMode: String, CaseIterable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
}

// Enum dla języków
enum Language: String, CaseIterable {
    case english = "English"
    case german = "Deutsch"
    case polish = "Polski"
}

struct SettingsView: View {
    // Odwołanie do singletona
    @ObservedObject private var settings = Settings.shared

    var body: some View {
        Form {
            Spacer()
            Section(header: Text("Paths").font(.title)) {
                HStack {
                    Text("Storage Path:")
                    TextField("", text: $settings.sharedPath)
                        
                }
            }
            Spacer()
            Section(header: Text("Appearance").font(.title)) {
                Picker("Theme Mode:", selection: $settings.themeMode) {
                    ForEach(ThemeMode.allCases, id: \.self) { mode in
                        Text(mode.rawValue).tag(mode)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Spacer()
            Section(header: Text("Language").font(.title)) {
                Picker("Chosen language:", selection: $settings.language) {
                    ForEach(Language.allCases, id: \.self) { lang in
                        Text(lang.rawValue).tag(lang)
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: 500, maxHeight: 400)
    }
}

#Preview {
    SettingsView()
}
