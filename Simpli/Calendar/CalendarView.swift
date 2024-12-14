import SwiftUI

struct SimpleCalendar: View {
    @State private var displayedDate: Date = Date()
    @State private var selectedDay: SelectableDay? = nil // Zmieniona na SelectableDay
    let calendar = Calendar.current

    var body: some View {
        VStack {
            HStack {
                Button(action: previousMonth) {
                    Text("<")
                        .font(.title2)
                        .padding()
                }
                Spacer()
                Text(monthAndYear(for: displayedDate))
                    .font(.title)
                    .padding()
                Spacer()
                Button(action: nextMonth) {
                    Text(">")
                        .font(.title2)
                        .padding()
                }
            }
            .padding(.horizontal)

            let days = generateDays(for: displayedDate)
            let weekDays = calendar.shortWeekdaySymbols

            // Tabela dni tygodnia
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(weekDays, id: \.self) { day in
                    Text(day)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }

                // Tabela dni miesiąca
                ForEach(days, id: \.self) { day in
                    Text("\(day)")
                        .font(.body)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .background(self.isCurrentDay(day) ? Color.yellow.opacity(0.2) : Color.clear)

                        .cornerRadius(5)
                        .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 0, y: 2)
                        .onTapGesture {
                            selectDay(day)
                        }
                }
            }
            .padding()
            .background(Color(NSColor.windowBackgroundColor))
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding()
        .sheet(item: $selectedDay) { selectedDay in
            // Otwórz nowy widok po kliknięciu w dzień
            DayDetailView(day: selectedDay.day, date: self.selectedDate(for: selectedDay.day))
        }
    }

    func monthAndYear(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }

    func generateDays(for date: Date) -> [Int] {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return Array(range)
    }

    func previousMonth() {
        if let newDate = calendar.date(byAdding: .month, value: -1, to: displayedDate) {
            displayedDate = newDate
        }
    }

    func nextMonth() {
        if let newDate = calendar.date(byAdding: .month, value: 1, to: displayedDate) {
            displayedDate = newDate
        }
    }

    // Funkcja do sprawdzania, czy dany dzień to dzisiaj
    func isCurrentDay(_ day: Int) -> Bool {
        let today = calendar.dateComponents([.year, .month, .day], from: Date())
        let dayComponents = calendar.dateComponents([.year, .month, .day], from: displayedDate)
        return today.year == dayComponents.year && today.month == dayComponents.month && today.day == day
    }

    // Funkcja do zaznaczenia dnia
    func selectDay(_ day: Int) {
        self.selectedDay = SelectableDay(id: day, day: day)
    }

    // Funkcja do uzyskania daty z wybranego dnia
    func selectedDate(for day: Int) -> Date {
        var components = calendar.dateComponents([.year, .month], from: displayedDate)
        components.day = day
        return calendar.date(from: components)!
    }
}

// Struktura SelectableDay, która konformuje do Identifiable
struct SelectableDay: Identifiable {
    var id: Int // Unikalny identyfikator
    var day: Int // Numer dnia
}

struct DayDetailView: View {
    var day: Int
    var date: Date

    var body: some View {
        VStack {
            Text("Szczegóły dnia \(day)")
                .font(.title)
                .padding()
            Text("Data: \(formattedDate(date))")
            Spacer()
        }
        .padding()
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    SimpleCalendar()
}
