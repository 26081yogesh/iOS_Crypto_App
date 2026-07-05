import SwiftUI

struct CoinImageView: View {
    let imageUrl: String
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: width, height: height)
        .clipShape(Circle())
    }
}

#Preview {
    CoinImageView(imageUrl: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", width: 30, height: 30)
}
