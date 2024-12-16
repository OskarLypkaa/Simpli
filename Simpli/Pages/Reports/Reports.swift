import SwiftUI

struct ReportView: View {
    @State private var showDataView = false // Stan kontrolujący widoczność arkusza

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Nagłówek
                Text("Reports & Data Export")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)

                Text("Generate reports, visualize data, and export/import information to various formats.")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

                // Sekcja raportów
                VStack(alignment: .leading, spacing: 20) {
                    Text("Generate Reports")
                        .font(.headline)
                        .fontWeight(.semibold)

                    VStack(spacing: 15) {
                        // Przykładowe ActionButton bez funkcjonalności
                        ActionButton(title: "Generate Sales Report", subtitle: "Detailed report of all sales transactions.", image: "chart.bar.fill")
                        ActionButton(title: "Customer Analytics", subtitle: "Insights into customer behavior and trends.", image: "person.2.fill")
                        ActionButton(title: "Monthly Revenue Report", subtitle: "Track monthly revenue across departments.", image: "calendar")
                        ActionButton(title: "Task Completion Overview", subtitle: "Overview of tasks and project progress.", image: "checkmark.circle.fill")

                        // ActionButton wywołujący DataView
                        ActionButton(title: "Statistic Overview", subtitle: "Show the raw statistic data.", image: "chart.line.uptrend.xyaxis.circle.fill")
                            .onTapGesture {
                                showDataView = true // Pokazuje arkusz po kliknięciu
                            }
                            .sheet(isPresented: $showDataView) {
                                DataView() // Wywołanie istniejącego DataView
                            }
                    }
                }
                .padding(.horizontal)

                // Sekcja eksportu danych
                VStack(alignment: .leading, spacing: 20) {
                    Text("Export Data")
                        .font(.headline)
                        .fontWeight(.semibold)

                    VStack(spacing: 15) {
                        ActionButton(title: "Export to Excel", subtitle: "Save data in Excel format.", image: "doc.fill")
                        ActionButton(title: "Export to PDF", subtitle: "Save data in PDF format.", image: "doc.richtext.fill")
                        ActionButton(title: "Export to CSV", subtitle: "Save data in CSV format.", image: "tablecells.fill")
                        ActionButton(title: "Export to JSON", subtitle: "Save data in JSON format.", image: "curlybraces.square.fill")
                    }
                }
                .padding(.horizontal)

                // Sekcja importu danych
                VStack(alignment: .leading, spacing: 20) {
                    Text("Import Data")
                        .font(.headline)
                        .fontWeight(.semibold)

                    VStack(spacing: 15) {
                        ActionButton(title: "Import from Excel", subtitle: "Load data from an Excel file.", image: "square.and.arrow.down.fill")
                        ActionButton(title: "Import from CSV", subtitle: "Load data from a CSV file.", image: "arrow.down.circle.fill")
                        ActionButton(title: "Import from JSON", subtitle: "Load data from a JSON file.", image: "arrow.down.circle.fill")
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.bottom, 20)
        }
    }
}


// Podgląd dla widoku
struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
