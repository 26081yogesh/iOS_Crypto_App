
import CoreData
import SwiftUI

struct HomeView: View {
    @State private var showPortfolio: Bool = false
    @Environment(HomeViewModel.self) private var homeViewModel: HomeViewModel
    @State private var showPortfolioView: Bool = false

    @FetchRequest(
        entity: PortfolioEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \PortfolioEntity.name, ascending: true)]
    ) var portfolioItems: FetchedResults<PortfolioEntity>

    var body: some View {
        @Bindable var homeViewModel = homeViewModel
        ZStack {
            Color.theme.backgroundColor.ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView(vm: homeViewModel)
                }

            VStack {
                headerView
                Spacer()
                StatView()
                Spacer()
                columnTitles

                ScrollView {
                    if !showPortfolio {
                        allCoinsListView
                    } else {
                        portfolioCoinsListView
                    }
                }
                Spacer()
            }
        }
        .searchable(text: $homeViewModel.searchText, prompt: "Search here...")
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: Extensions

extension HomeView {
    private var columnTitles: some View {
        HStack(spacing: 0) {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
                    .frame(width: 100, alignment: .trailing)
            }
            Text("Price")
                .frame(width: 100, alignment: .trailing)
            Text("Total Value")
                .frame(width: 100, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryTextColor)
        .padding(.horizontal)
    }

    private var allCoinsListView: some View {
        LazyVStack {
            ForEach(homeViewModel.filteredCoins) { coin in
                CoinRowView(coin: coin)
                    .padding(.horizontal)
            }
        }
        .transition(.move(edge: .trailing))
    }

    private var portfolioCoinsListView: some View {
        LazyVStack {
            if !showPortfolio {
                AnyView(
                    ForEach(homeViewModel.portfolioCoins) { coin in
                        CoinRowView(coin: coin)
                            .padding(.horizontal)
                    }
                )
            } else {
                AnyView(
                    ForEach(portfolioItems) { coin in
                        PortfolioCoinRowView(
                            symbol: coin.symbol ?? "",
                            name: coin.name ?? "",
                            image: coin.image ?? "",
                            currentHoldings: coin.currentHoldings,
                            currentHoldingValue: coin.currentHoldingValue
                        )
                        .padding(.horizontal)
                    }
                )
            }
        }
        .transition(.move(edge: .trailing))
    }

    private var headerView: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline).fontWeight(.heavy).foregroundStyle(Color.theme.accentColor)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture { showPortfolio.toggle() }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
    .environment(DeveloperPreview.shared.homeVm)
    .environment(
        \.managedObjectContext,
        PersistenceController.shared.container.viewContext
    )
}
