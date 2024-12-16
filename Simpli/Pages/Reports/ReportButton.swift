import SwiftUI

struct ActionButton: View {
    let title: String
    let subtitle: String
    let image: String

    var body: some View {
        ZStack {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 40)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "Example Button", subtitle: "Example subtitle for the button.", image: "person.fill")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
