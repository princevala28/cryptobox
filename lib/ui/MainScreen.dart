import 'package:crypto_app/bloc/MyCoinBloc/MyCoinBloc.dart';
import 'package:crypto_app/bloc/MyCoinBloc/MyCoinEvents.dart';
import 'package:crypto_app/bloc/MyCoinBloc/MyCoinState.dart';
import 'package:crypto_app/helpers/ColorConstants.dart';
import 'package:crypto_app/models/my_coin_list_item_model.dart';
import 'package:crypto_app/ui/CoinDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  static var route = "MainScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: MainScreenBody(),
    );
  }
}



class MainScreenBody extends StatefulWidget {
  @override
  _MainScreenBodyState createState() => _MainScreenBodyState();
}



class _MainScreenBodyState extends State<MainScreenBody> {

  MyCoinBloc mCoinBloc;

  List<String> filterList = [
    "market_cap_desc",
    "gecko_desc",
    "gecko_asc",
    "market_cap_asc",
    "volume_asc",
    "volume_desc",
    "id_asc",
    "id_desc"
  ];


  String currentFilter = "market_cap_desc";


  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: bgTopColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: statusBarHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Info",
                          style: TextStyle(color: colorTextGray, fontSize: 18),
                        ),
                        Text(
                          "Add",
                          style: TextStyle(color: colorTextGray, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                    child: Text(
                      "Crypto Box",
                      style: Theme.of(context).textTheme.headline5.merge(
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColorWhite,
                              fontSize: 28)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: colorPrimaryTransparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 22,
                              ),
                              Expanded(
                                  child: TextField(
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .merge(TextStyle(
                                        fontSize: 18, color: Colors.white)),
                                onChanged: (str)=>mCoinBloc.add(MyCoinSearchFilter(filterText: str)),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ))
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.only(
                              left: 12, top: 10, bottom: 10, right: 0),
                          decoration: BoxDecoration(
                              color: colorPrimaryTransparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Expanded(
                              child: Theme(
                                  child: getDropDown(),
                                  data: Theme.of(context).copyWith(
                                    canvasColor: colorBottomNavUnselected,
                                  ))),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: getCoinList())
        ],
      ),
    );
  }


  getDropDown() {

    print("NewDrop state: $currentFilter");

    return DropdownButton<String>(
      underline: SizedBox(),
      isDense: true,
      icon: null,
      elevation: 8,
      isExpanded: true,
      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
          backgroundColor: Colors.white, color: Colors.white, fontSize: 16)),
      onChanged: (String newValue) {
        setState(() {
          print("NewDrop : $newValue");
          currentFilter = newValue;
        });
      },
      items: filterList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          child: Expanded(
              child: Text(
                value,
                style: TextStyle(color: Colors.white,backgroundColor: colorBottomNavUnselected),
              )),
          value: value,
        );
      }).toList(),
      value: currentFilter,
    );
  }


  @override
  void initState() {
    mCoinBloc = MyCoinBloc();
  }


  @override
  void dispose() {
    mCoinBloc.close();
    super.dispose();
  }


  getCoinList() {
    String ids = "01coin,0-5x-long-algorand-token,";

    if (ids.isEmpty) {
      return Center(
          child: Text(
        "Add coins in list",
        style: TextStyle(color: textColorWhite),
      ));
    } else {
      mCoinBloc.add(MyCoinEventList(ids: ids, filterList: currentFilter));

      return BlocBuilder(
        bloc: mCoinBloc,
        builder: (context, CoinState state) {
          if (state is CoinLoadingState || state is MyCoinStateInitialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MyCoinListState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return getCryptoListItem(state.myCoinList.elementAt(index));
              },
              itemCount: state.myCoinList.length,
              padding: EdgeInsets.zero,
            );
          } else {
            return Center(
                child: Text(
              "${(state as CoinErrorState).error.toString()}",
              style: TextStyle(color: textColorWhite),
            ));
          }
        },
      );
    }
  }


  getCryptoListItem(MyCoinListItemModel coinList) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, CoinDetailsScreen.route,
                arguments: coinList);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: (coinList?.image == null || coinList.image.isEmpty)
                      ? Image.asset(
                          "assets/ic_bitcoin.jpeg",
                          width: 36,
                        )
                      : Image.network(
                          coinList.image,
                          width: 36,
                          height: 36,
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
                      "${coinList?.name ?? "AAA"}",
                      style: TextStyle(color: textColorWhite, fontSize: 16),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${coinList?.symbol?.toUpperCase() ?? "AAA"}",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${coinList?.currentPrice ?? ""}",
                      style: TextStyle(color: textColorWhite, fontSize: 16),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${(coinList?.priceChangePercentage24h ?? 0.0)} % ${((coinList?.priceChangePercentage24h ?? 0.0) < 0) ? "\u25bc" : "\u25b2"}",
                      style: TextStyle(
                          color: ((coinList?.priceChangePercentage24h ?? 0.0) < 0)
                              ? Colors.red
                              : Colors.green,
                          fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  color: colorListDivider,
                  height: 2,
                ),
              ),
            )
          ],
        )
      ],
    );
  }


}
