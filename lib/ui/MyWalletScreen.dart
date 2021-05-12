import 'package:crypto_app/helpers/ColorConstants.dart';
import 'package:flutter/material.dart';

class MyWalletScreen extends StatefulWidget {
  static var route = "MyWalletScreen";

  @override
  _MyWalletScreenState createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: bgColor,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: bgTopColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: statusBarHeight,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Edit",
                                  style: TextStyle(
                                      color: colorTextGray, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Wallet",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .merge(TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        color: colorButtonGray,
                                        gradient: LinearGradient(colors: [
                                          colorGradientStart,
                                          colorGradientCenter,
                                          colorGradientEnd
                                        ]),
                                      ),
                                      child: Text(
                                        "Transfer",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .merge(
                                                TextStyle(color: Colors.white)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorOrange,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                              ),
                              child: Row(
                                children: [
                                  Image.asset("assets/ic_bitcoin_icon.png", width: 25,color: Colors.white,),
                                  SizedBox(width: 16,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Bitcoin",style: TextStyle(color: Colors.white, fontSize: 18),),
                                        SizedBox(height: 2,),
                                        Text("BTC",style: TextStyle(color: Colors.white70, fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: bgTopColor,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12))
                              ),
                              child: Row(
                                children: [

                                  Text("Balance", style: TextStyle(fontSize: 14, color: Colors.white24),),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("\$5750,70",style: TextStyle(color: Colors.white, fontSize: 18),),
                                        SizedBox(height: 2,),
                                        Text("1,0048",style: TextStyle(color: Colors.white70, fontSize: 14),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorRipple,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                              ),
                              child: Row(
                                children: [
                                  Image.asset("assets/ic_bitcoin_icon.png", width: 25,color: Colors.white,),
                                  SizedBox(width: 16,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Ripple",style: TextStyle(color: Colors.white, fontSize: 18),),
                                        SizedBox(height: 2,),
                                        Text("BTC",style: TextStyle(color: Colors.white70, fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: bgTopColor,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12))
                              ),
                              child: Row(
                                children: [

                                  Text("Balance", style: TextStyle(fontSize: 14, color: Colors.white24),),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("\$5750,70",style: TextStyle(color: Colors.white, fontSize: 18),),
                                        SizedBox(height: 2,),
                                        Text("1,0048",style: TextStyle(color: Colors.white70, fontSize: 14),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorDash,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                              ),
                              child: Row(
                                children: [
                                  Image.asset("assets/ic_bitcoin_icon.png", width: 25,color: Colors.white,),
                                  SizedBox(width: 16,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Dash",style: TextStyle(color: Colors.white, fontSize: 18),),
                                        SizedBox(height: 2,),
                                        Text("BTC",style: TextStyle(color: Colors.white70, fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: bgTopColor,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12))
                              ),
                              child: Row(
                                children: [

                                  Text("Balance", style: TextStyle(fontSize: 14, color: Colors.white24),),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("\$5750,70",style: TextStyle(color: Colors.white, fontSize: 18),),
                                        SizedBox(height: 2,),
                                        Text("1,0048",style: TextStyle(color: Colors.white70, fontSize: 14),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),


                    ],
                  ),
                )),
              )
            ],
          ),
        ));
  }
}
