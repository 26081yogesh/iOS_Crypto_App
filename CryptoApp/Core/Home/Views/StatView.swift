
import SwiftUI

struct StatView: View {
    @State private var vm = StatisticsViewModel()

    var body: some View {
        HStack(spacing: 20) {
            if vm.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
            } else {
                statItem(title: "Market Cap", value: vm.marketCap.formattedWithAbbreviations())

                Divider()
                    .frame(height: 30)

                statItem(title: "24h Volume", value: vm.volumeCap.formattedWithAbbreviations())
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

extension StatView {
    private func statItem(title: String, value: String) -> some View {
        VStack(alignment: .center, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(Color.theme.accentColor)
            Text(value)
                .font(.headline)
                .foregroundStyle(Color.theme.accentColor)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    StatView()
}
