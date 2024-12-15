import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
      
            
            // Logo lub ikona aplikacji
            Image(systemName: "face.smiling") // Ikona aplikacji
                .font(.system(size: 100))
                .padding(.bottom, 40)
            
            // Tytuł powitalny
            Text("Welcome to CRM App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.bottom, 20)
            
            // Opis
            Text("Manage your clients efficiently and keep track of all important details in one place.")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            
            
        }
        .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
