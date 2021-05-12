import 'package:crypto_app/helpers/ColorConstants.dart';
import 'package:crypto_app/ui/MainScreen.dart';
import 'package:crypto_app/ui/MyWalletScreen.dart';
import 'package:crypto_app/ui/NewsScreen.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  static var route = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController;
  var selectedTab = 0;

  @override
  Widget build(BuildContext context) {

    _pageController = PageController();

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            Expanded(child: PageView(
              children: [
                MainScreen(),
                NewsScreen(),
                MyWalletScreen()
              ],controller: _pageController,onPageChanged: selectTab,
            )),

            Row(
              children: [
                Expanded(child: Container(
                  color: colorBottomNavBg,
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [

                          Expanded(child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))
                                , color: (selectedTab == 0) ? colorBottomNavSelected : colorBottomNavUnselected,
                            ),
                            child: InkWell(
                              onTap: (){
                                selectTab(0);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/ic_bottom_nav_1.png", width: 20,color: (selectedTab == 0) ? Colors.white : Colors.white38,),
                                ],
                              ),
                            ),
                          )),

                          Expanded(child: Container(
                            padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: (selectedTab == 1) ? colorBottomNavSelected : colorBottomNavUnselected
                              ),
                            child: InkWell(
                              onTap: (){
                                selectTab(1);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/ic_list.png", width: 20,color: (selectedTab == 1) ? Colors.white : Colors.white38,),
                                ],
                              ),
                            ),
                          )),

                          Expanded(child: Container(
                            padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                                color: (selectedTab == 2) ? colorBottomNavSelected : colorBottomNavUnselected
                              ),
                            child: InkWell(
                              onTap: (){
                                selectTab(2);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/ic_grid.png",width: 20,color: (selectedTab == 2) ? Colors.white : Colors.white38,),
                                ],
                              ),
                            ),
                          ))

                        ],
                      ),
                    ),
                  ),
                ))
              ],
            )

          ],
        ),
      ),
    );

  }

  void selectTab(int i) {
    setState(() {
      selectedTab = i;
    });
    _pageController.jumpToPage(i);
  }

}
