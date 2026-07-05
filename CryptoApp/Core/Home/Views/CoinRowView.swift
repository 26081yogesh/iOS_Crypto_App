import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel

    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
                .frame(width: 30)

            CoinImageView(imageUrl: coin.image, width: 30, height: 30)

            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accentColor)

            Spacer()

            VStack(alignment: .trailing) {
                Text("\(coin.currentPrice.asCurrencyWithDecimal6())")
                    .fontWeight(.bold)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "0%")
                    .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.greenColor : Color.theme.redColor)
            }
            .frame(width: 100, alignment: .trailing)
            .monospacedDigit()
        }
        .font(.subheadline)
    }
}

#Preview {
    CoinRowView(coin: DeveloperPreview.shared.devCoinModel())
}
