import SwiftUI

struct PortfolioCoinRowView: View {
    let symbol: String
    let name: String
    let image: String
    let currentHoldings: Double
    let currentHoldingValue: Double

    var body: some View {
        HStack(spacing: 10) {
            CoinImageView(imageUrl: image, width: 30, height: 30)

            VStack(alignment: .leading) {
                Text(symbol.uppercased())
                    .font(.headline)
                    .foregroundStyle(Color.theme.accentColor)

                Text(name)
                    .font(.caption)
            }

            Spacer()

            Text("\(currentHoldingValue.asNumberString())")

            VStack{
                Text("\(currentHoldings.asCurrencyWithDecimal6())")
                    .bold()

                Text("Total - \((currentHoldings * currentHoldingValue).asCurrencyWithDecimal6())")
            }
        }
        .font(.subheadline)
    }
}

#Preview {
    PortfolioCoinRowView(symbol: "BTC", name: "Bitcoin", image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentHoldings: 100, currentHoldingValue: 20000)
}
