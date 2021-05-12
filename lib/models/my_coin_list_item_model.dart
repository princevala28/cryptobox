class MyCoinListItemModel {
  String id;
  String symbol;
  String name;
  String image;
  var currentPrice;
  var marketCap;
  var marketCapRank;
  var fullyDilutedValuation;
  var totalVolume;
  var high24h;
  var low24h;
  var priceChange24h;
  var priceChangePercentage24h;
  var marketCapChange24h;
  var marketCapChangePercentage24h;
  var circulatingSupply;
  var totalSupply;
  var maxSupply;
  var ath;
  var athChangePercentage;
  var athDate;
  var atl;
  var atlChangePercentage;
  var atlDate;
  var roi;
  var lastUpdated;

  MyCoinListItemModel(
      {this.id,
        this.symbol,
        this.name,
        this.image,
        this.currentPrice,
        this.marketCap,
        this.marketCapRank,
        this.fullyDilutedValuation,
        this.totalVolume,
        this.high24h,
        this.low24h,
        this.priceChange24h,
        this.priceChangePercentage24h,
        this.marketCapChange24h,
        this.marketCapChangePercentage24h,
        this.circulatingSupply,
        this.totalSupply,
        this.maxSupply,
        this.ath,
        this.athChangePercentage,
        this.athDate,
        this.atl,
        this.atlChangePercentage,
        this.atlDate,
        this.roi,
        this.lastUpdated});

  MyCoinListItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    symbol = json['symbol'] ?? "AAA";
    name = json['name'] ?? "AAA";
    image = json['image'] ?? "";
    currentPrice = json['current_price'];
    marketCap = json['market_cap'];
    marketCapRank = json['market_cap_rank'] ?? 0.0;
    fullyDilutedValuation = json['fully_diluted_valuation'] ?? 0.0;
    totalVolume = json['total_volume'];
    high24h = json['high_24h'] ?? 0.0;
    low24h = json['low_24h'] ?? 0.0;
    priceChange24h = json['price_change_24h'] ?? 0.0;
    priceChangePercentage24h = json['price_change_percentage_24h'] ?? 0.0;
    marketCapChange24h = json['market_cap_change_24h'] ?? 0.0;
    marketCapChangePercentage24h = json['market_cap_change_percentage_24h'] ?? 0.0;
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'] ?? 0.0;
    maxSupply = json['max_supply'] ?? 0.0;
    ath = json['ath'];
    athChangePercentage = json['ath_change_percentage'];
    athDate = json['ath_date'];
    atl = json['atl'];
    atlChangePercentage = json['atl_change_percentage'];
    atlDate = json['atl_date'];
    roi = json['roi'] ?? 0.0;
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    data['market_cap'] = this.marketCap;
    data['market_cap_rank'] = this.marketCapRank;
    data['fully_diluted_valuation'] = this.fullyDilutedValuation;
    data['total_volume'] = this.totalVolume;
    data['high_24h'] = this.high24h;
    data['low_24h'] = this.low24h;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    data['market_cap_change_24h'] = this.marketCapChange24h;
    data['market_cap_change_percentage_24h'] =
        this.marketCapChangePercentage24h;
    data['circulating_supply'] = this.circulatingSupply;
    data['total_supply'] = this.totalSupply;
    data['max_supply'] = this.maxSupply;
    data['ath'] = this.ath;
    data['ath_change_percentage'] = this.athChangePercentage;
    data['ath_date'] = this.athDate;
    data['atl'] = this.atl;
    data['atl_change_percentage'] = this.atlChangePercentage;
    data['atl_date'] = this.atlDate;
    data['roi'] = this.roi;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}
