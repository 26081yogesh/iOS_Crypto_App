import SwiftUI

struct PortfolioView: View {
    var vm: HomeViewModel
    @State private var coinName: String = "Select a coin"
    @State private var price: Double = 0.0
    @State private var qty: String = ""

    @State private var selectedCoinModel: CoinModel = DeveloperPreview.shared.devCoinModel()

    @State private var coreDataService = CoreDataService()

    @State private var name: String = ""
    @State private var symbol: String = ""
    @State private var image: String = ""
    @State private var currentHoldings: Double = 0
    @State private var currentHoldingValue: Double = 0

    var totalAmount: Double {
        let quantity = Double(qty) ?? 0.0
        return quantity * price
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(vm.filteredCoins) { coin in
                                VStack(spacing: 12) {
                                    CoinImageView(imageUrl: coin.image, width: 50, height: 50)
                                    Text(coin.symbol.uppercased())
                                        .font(.caption).bold()
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.theme.backgroundColor))
                                .shadow(color: Color.primary.opacity(0.1), radius: 5)
                                .onTapGesture {
                                    coinName = coin.name
                                    price = coin.currentPrice
                                    selectedCoinModel = coin

                                    name = coin.name
                                    image = coin.image
                                    symbol = coin.symbol
                                }
                            }
                        }
                        .padding()
                    }

                    VStack(alignment: .leading, spacing: 15) {
                        Text("Details")
                            .font(.headline).foregroundStyle(Color.theme.secondaryTextColor)

                        HStack {
                            Text("Coin:").foregroundStyle(Color.theme.secondaryTextColor)
                            Spacer()
                            Text(coinName).bold()
                        }

                        HStack {
                            Text("Price:").foregroundStyle(Color.theme.secondaryTextColor)
                            Spacer()
                            Text(price.asCurrencyWithDecimal6()).bold()
                        }

                        Divider()

                        HStack {
                            Text("Quantity:").foregroundStyle(Color.theme.secondaryTextColor)
                            Spacer()
                            TextField("0.0", text: $qty)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .frame(width: 100)
                        }

                        Divider()

                        // 4. Total Amount Result
                        HStack {
                            Text("Total Amount:").bold()
                            Spacer()
                            Text(totalAmount.asCurrencyWithDecimal6())
                                .bold()
                                .foregroundStyle(Color.theme.accentColor)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color(uiColor: .secondarySystemBackground)))
                    .padding(.horizontal)

                    Spacer()
                    Button(action: {
                        selectedCoinModel.currentHoldings = Double(qty)
                        vm.portfolioCoins.append(selectedCoinModel)

                        currentHoldings = price * (Double(qty) ?? 0)
                        currentHoldingValue = Double(qty) ?? 0

                        coreDataService.addCoin(name: name, image: image, currentHoldings: currentHoldings, currentHoldingValue: currentHoldingValue, symbol: symbol)

                    }) {
                        Text("Add to Portfolio")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.accentColor)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .opacity(qty.isEmpty || coinName == "Select a coin" ? 0.5 : 1.0)
                    .disabled(qty.isEmpty || coinName == "Select a coin")
                }
                .navigationTitle("Add Portfolio")
            }
        }
    }
}

#Preview {
    PortfolioView(vm: DeveloperPreview.shared.homeVm)
}
