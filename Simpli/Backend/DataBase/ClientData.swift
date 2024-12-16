import Foundation

// Model danych klienta
struct Client: Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let phone: String
    let address: String
}

// Dane klientów
let clients = [
    Client(name: "John Doe", email: "john.doe@example.com", phone: "+1 234 567 890", address: "123 Elm Street, Springfield"),
    Client(name: "Jane Smith", email: "jane.smith@example.com", phone: "+1 987 654 321", address: "456 Oak Avenue, Rivertown"),
    Client(name: "Michael Brown", email: "michael.brown@example.com", phone: "+44 123 456 789", address: "789 Pine Road, Londontown"),
    Client(name: "Emily Davis", email: "emily.davis@example.com", phone: "+61 987 654 321", address: "101 Maple Lane, Sydney"),
    Client(name: "Chris Johnson", email: "chris.johnson@example.com", phone: "+49 234 567 890", address: "202 Birch Street, Berlin"),
    Client(name: "Patricia Wilson", email: "patricia.wilson@example.com", phone: "+33 123 456 789", address: "303 Cedar Boulevard, Paris"),
    Client(name: "David Miller", email: "david.miller@example.com", phone: "+81 987 654 321", address: "404 Redwood Avenue, Tokyo"),
    Client(name: "Sarah Taylor", email: "sarah.taylor@example.com", phone: "+86 123 456 789", address: "505 Willow Drive, Beijing"),
    Client(name: "Robert Anderson", email: "robert.anderson@example.com", phone: "+34 234 567 890", address: "606 Palm Road, Madrid"),
    Client(name: "Laura Martinez", email: "laura.martinez@example.com", phone: "+39 987 654 321", address: "707 Fir Street, Rome")
]
