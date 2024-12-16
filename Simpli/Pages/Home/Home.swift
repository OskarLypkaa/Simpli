import SwiftUI

struct WelcomeView: View {
    
    @State private var highlighted: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                // Tytuł powitalny
                Text("Welcome to CRM App")
                Image(systemName: "face.smiling")
            }
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.primary)

            Text("Manage your clients efficiently and keep track of all important details in one place.")
                .font(.title3)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            Text("Tasks you have for today")
                .font(.title2)
                .multilineTextAlignment(.center)
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(clients, id: \.name) { client in
                        Actions(
                            image: generateRandomNumber(),
                            text: generateRandomNumber(),
                            other: generateRandomNumber(),
                            highlighted: $highlighted,
                            actionStatus: .todo
                        )
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .cornerRadius(8)
        }
        .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
