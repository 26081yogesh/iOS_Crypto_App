import Foundation

/*

 API INFO

 URL - https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=247&price_change_percentage=24h&sparkline=true

 JSON Response -
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 58593,
     "market_cap": 1175020246108,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1175020246108,
     "total_volume": 35016004027,
     "high_24h": 59439,
     "low_24h": 57945,
     "price_change_24h": -806.330978317579,
     "price_change_percentage_24h": -1.35749,
     "market_cap_change_24h": -16404520192.4341,
     "market_cap_change_percentage_24h": -1.37688,
     "circulating_supply": 20050528,
     "total_supply": 20050528,
     "max_supply": 21000000,
     "ath": 126080,
     "ath_change_percentage": -53.52745,
     "ath_date": "2025-10-06T18:57:42.558Z",
     "atl": 67.81,
     "atl_change_percentage": 86308.21177,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2026-07-01T07:18:56.667Z",
     "sparkline_in_7d": {
       "price": [62802.2316634799, 62699.0194527551, 62568.950787264, 62716.0403248101, 62621.2938979239, 62379.4013095854, 62815.968864273, 62538.578605144, 61236.5553427252, 60985.8644938241, 60204.2203275093, 59783.0504227666, 59297.7364392939, 59507.187984197, 59822.2482558819, 60882.54873575, 61005.3789531345, 60783.2008783964, 60990.5386351801, 60664.9069243601, 60812.4264041749, 60629.7147111658, 60788.3857597989, 61257.6127893253, 61534.4346277776, 61646.0068776654, 61816.4425090364, 61606.9052697185, 61652.904318124, 61211.7815590899, 61185.5499248584, 61114.6574606285, 58188.6688867156, 59419.4515577568, 59513.7274796723, 59234.5777533372, 59534.0998608153, 59430.9182596471, 59237.365253537, 59312.8054347439, 60111.6911361615, 59787.0823359413, 59712.6180615821, 59589.3635667225, 59299.0721115131, 58482.9647698046, 59836.2977175038, 59813.8453091657, 59869.4251208006, 60237.0568540939, 60481.3572292475, 60152.3527171313, 59633.3244941453, 59215.1934089553, 59316.0197822094, 59181.1537157154, 60047.7917162543, 59544.5579879049, 60234.4121747813, 59989.840091965, 59956.8650670713, 59548.2199522556, 59783.3928318194, 59649.9301233111, 59858.0725658535, 59981.1771019498, 60019.9578669778, 59964.4502638615, 59876.1275454851, 60223.8246516832, 60209.8078726128, 60147.07742003, 60171.4785331445, 60274.1357688102, 60455.2697312494, 60375.7904654633, 60335.1997134423, 60318.7946891435, 60272.8968346442, 60318.7956240515, 60473.7480986017, 60514.094952996, 60726.0944020887, 60700.4694755931, 60481.7772698944, 60456.3751481772, 60076.9768757978, 60183.7618724845, 60109.8378797153, 60142.2118333599, 59943.1107741247, 60094.3233900009, 60127.4254375115, 60089.0126725934, 60118.5418004962, 60038.8760734366, 59891.7826084665, 59920.6678257378, 60116.6018829797, 60298.3502279578, 60185.5972585219, 60082.0097043649, 60250.0969068287, 60209.8262832473, 59993.6221913496, 59958.8788459952, 59795.7760129628, 59603.9947035907, 59513.5015672383, 59524.9379942006, 59396.8938225722, 59569.6640318567, 59314.8970224667, 58971.2351968281, 59516.4494858153, 59536.7630458533, 59380.6590896249, 59661.5539816082, 59923.9322658, 59726.3308812017, 59971.313088809, 59998.2753054843, 59962.778021959, 59766.5761794952, 59964.325563894, 60001.1711566377, 59848.3108731912, 59879.185745245, 59403.2104674994, 59322.4033780639, 59737.1887467754, 59799.4454735812, 60352.933054073, 60185.8609092226, 60365.9909277863, 60208.6022593861, 60402.6398148205, 60277.6496586344, 60143.5696897674, 59763.7680723646, 59855.1776339817, 59877.6908898085, 59538.3739322221, 59400.6364225872, 59545.2858197485, 59488.1316073308, 59434.5616356187, 59224.0954855656, 59278.7067072009, 59290.6641554837, 59080.6665089933, 58361.6221238705, 58603.0301215242, 58424.3972945703, 58331.3311178704, 58375.4169248572, 58331.8344377722, 58579.5286644329, 58711.4247160163, 58668.2424959825, 58553.2370809012, 58519.1095613455, 58557.6991617398, 58474.5678005282, 58695.8841556078, 59007.4801560951, 59087.8864963589, 59240.8147918301]
     },
     "price_change_percentage_24h_in_currency": -1.35748515724674
   }

 */

import Foundation

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    var currentHoldings: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }

    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }

    var currentHoldingValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }

    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
