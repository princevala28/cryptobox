import 'dart:ui';

import 'package:crypto_app/helpers/ColorConstants.dart';
import 'package:crypto_app/models/CoinListItemModel.dart';
import 'package:crypto_app/models/my_coin_list_item_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinDetailsScreen extends StatefulWidget {
  static var route = "CoinDetailsScreen";

  @override
  _CoinDetailsScreenState createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {

  List<Color> gradientColors = [
    colorGradientStart,
    colorGradientEnd,
  ];

  double statusBarHeight;
  var selectedDetail = 1;
  MyCoinListItemModel coinDetails = null;

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    coinDetails = ModalRoute.of(context).settings.arguments as MyCoinListItemModel;
    return Scaffold(
      backgroundColor: bgColor,
      body: getCoinDetailsBody(),
    );
  }

  getCoinDetailsBody() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeader(),
            getValueChart(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text(
                "Fork",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .merge(TextStyle(color: Colors.white)),
              ),
            ),
            getCoinList()
          ],
        ),
      ),
    );
  }

  getHeader() {
    return Container(
      height: 400,
      color: bgTopColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            LineChart(
              getBarChat(),
              swapAnimationDuration: Duration(milliseconds: 1000),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: statusBarHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: (coinDetails?.image == null) ? Image.asset(
                        "assets/ic_bitcoin.jpeg",
                        width: 62,
                      ) :  Image.network(
                        coinDetails.image,
                        width: 58,
                        height: 58,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: colorButtonGray),
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 8,
                ),
                Text(
                  coinDetails?.symbol?.toUpperCase() ?? "Coin",
                  style: Theme.of(context).textTheme.headline4.merge(TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 10.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      )),
                ),
                Text(
                  "\$${coinDetails?.currentPrice ?? 00.00}",
                  style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                      color: colorGreen, fontWeight: FontWeight.w600)),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: colorGreen,
                          borderRadius: BorderRadius.circular(16)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "Buy",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .merge(TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ((coinDetails?.priceChangePercentage24h ?? 0.0) > 0) ? colorGreen : Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "${coinDetails?.priceChangePercentage24h ?? 00.00}% \u25bc",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .merge(TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  getBarChat() {
    return LineChartData(
      clipData: FlClipData(top: true, left: true, right: true, bottom: true),
      lineTouchData: LineTouchData(enabled: false),
      titlesData: FlTitlesData(show: false),
      gridData: FlGridData(
        show: false,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      axisTitleData: FlAxisTitleData(show: false),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1),
            FlSpot(2.6, 4),
            FlSpot(4.9, 3),
            FlSpot(6.8, 5),
            FlSpot(8, 2),
            FlSpot(9.5, 4),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: Colors.white, end: Colors.white).lerp(0.2),
            ColorTween(begin: Colors.white, end: Colors.white).lerp(0.2),
          ],
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }

  getValueChart() {
    return Row(
      children: [
        Expanded(child: Column(
          children: [
            // Titles
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (selectedDetail == 1)
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              color: colorGraySelector,
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(colors: [
                                colorGradientStart,
                                colorGradientCenter,
                                colorGradientEnd
                              ])),
                          child: Text(
                            "Today",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              selectedDetail = 1;
                            });
                          },
                          child: Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 16, color: colorGraySelector),
                          ),
                        ),
                  (selectedDetail == 2)
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                colorGradientStart,
                                colorGradientCenter,
                                colorGradientEnd
                              ]),
                              color: colorGraySelector,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            "1W",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              selectedDetail = 2;
                            });
                          },
                          child: Text(
                            "1W",
                            style: TextStyle(
                                fontSize: 16, color: colorGraySelector),
                          ),
                        ),
                  (selectedDetail == 3)
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                colorGradientStart,
                                colorGradientCenter,
                                colorGradientEnd
                              ]),
                              color: colorGraySelector,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            "1M",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              selectedDetail = 3;
                            });
                          },
                          child: Text(
                            "1M",
                            style: TextStyle(
                                fontSize: 16, color: colorGraySelector),
                          ),
                        ),
                  (selectedDetail == 4)
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                colorGradientStart,
                                colorGradientCenter,
                                colorGradientEnd
                              ]),
                              color: colorGraySelector,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            "3M",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              selectedDetail = 4;
                            });
                          },
                          child: Text(
                            "3M",
                            style: TextStyle(
                                fontSize: 16, color: colorGraySelector),
                          ),
                        ),
                  (selectedDetail == 5)
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                colorGradientStart,
                                colorGradientCenter,
                                colorGradientEnd
                              ]),
                              color: colorGraySelector,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            "6M",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              selectedDetail = 5;
                            });
                          },
                          child: Text(
                            "6M",
                            style: TextStyle(
                                fontSize: 16, color: colorGraySelector),
                          ),
                        ),
                  (selectedDetail == 6)
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                colorGradientStart,
                                colorGradientCenter,
                                colorGradientEnd
                              ]),
                              color: colorGraySelector,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            "1Y",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              selectedDetail = 6;
                            });
                          },
                          child: Text(
                            "1Y",
                            style: TextStyle(
                                fontSize: 16, color: colorGraySelector),
                          ),
                        ),
                  (selectedDetail == 7)
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                colorGradientStart,
                                colorGradientCenter,
                                colorGradientEnd
                              ]),
                              color: colorGraySelector,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            "ALL",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              selectedDetail = 7;
                            });
                          },
                          child: Text(
                            "ALL",
                            style: TextStyle(
                                fontSize: 16, color: colorGraySelector),
                          ),
                        ),
                ],
              ),
            ),

            Container(
              color: colorListDivider,
              height: 2,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Market Cap",
                    style: TextStyle(fontSize: 16, color: colorGraySelector),
                  ),
                  Text(
                    "\$${coinDetails?.marketCap ?? 00.00}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              color: colorListDivider,
              height: 2,
              margin: EdgeInsets.only(left: 16.0),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Volume 24hr",
                    style: TextStyle(fontSize: 16, color: colorGraySelector),
                  ),
                  Text(
                    "\$${coinDetails?.marketCapChange24h ?? 00.00}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              color: colorListDivider,
              height: 2,
              margin: EdgeInsets.only(left: 16.0),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Supply",
                    style: TextStyle(fontSize: 16, color: colorGraySelector),
                  ),
                  Text(
                    "${coinDetails?.circulatingSupply ?? 00.00}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              color: colorListDivider,
              height: 2,
              margin: EdgeInsets.only(left: 16.0),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "% Change 24hr",
                    style: TextStyle(fontSize: 16, color: colorGraySelector),
                  ),
                  Text(
                    "+%${coinDetails?.priceChange24h ?? 00.00}",
                    style: TextStyle(fontSize: 16, color: ((coinDetails?.priceChange24h ?? 0) < 0) ? colorGreen : Colors.red),
                  ),
                ],
              ),
            ),

            Container(
              color: colorListDivider,
              height: 2,
            ),
          ],
        ))
      ],
    );
  }

  getCoinList() {
    var coinList = {
      CoinListItemModel(
          "Bitcoin", "BTC", "assets/ic_bitcoin.jpeg", "5750,75", "7.12", true),
      CoinListItemModel(
          "Ethereum", "ETH", "assets/ic_bitcoin.jpeg", "350,75", "4.05", false),
      CoinListItemModel("Bitcoin Cash", "BCH", "assets/ic_bitcoin.jpeg",
          "1181,54", "21.12", true),
      CoinListItemModel(
          "Ripple", "XRP", "assets/ic_bitcoin.jpeg", "0,20034", "14.92", false),
      CoinListItemModel(
          "Litecoin", "LTC", "assets/ic_bitcoin.jpeg", "61,13", "1.69", true)
    };

    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return getCryptoListItem(coinList.elementAt(index));
      },
      itemCount: coinList.length,
      padding: EdgeInsets.all(16),
    );
  }

  getCryptoListItem(CoinListItemModel coinList) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: colorForkListItem),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, CoinDetailsScreen.route);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  coinList.image,
                  width: 36,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${coinList.name}",
                    style: TextStyle(color: textColorWhite, fontSize: 18),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${coinList.code}",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${coinList.price}",
                    style: TextStyle(color: textColorWhite, fontSize: 18),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${coinList.exchangeRate} % ${coinList.isDown ? "\u25bc" : "\u25b2"}",
                    style: TextStyle(
                        color: coinList.isDown ? Colors.red : Colors.green,
                        fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}
