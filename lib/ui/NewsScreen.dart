import 'package:crypto_app/helpers/ColorConstants.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: bgColor,
      body: getNewsBody(),
    );
  }

  getNewsBody() {
    return Container(
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
                      child: Text(
                        "News",
                        style: Theme.of(context).textTheme.headline4.merge(
                            TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
          Expanded(child: getNewsList())
        ],
      ),
    );
  }

  getNewsList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return getNewsItem();
      },
      padding: EdgeInsets.all(8.0),
      itemCount: 10,
    );
  }

  getNewsItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Lorem ipsum dolor sit amet.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6.merge(TextStyle(
                  color: Colors.white,
                )),
              ))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: AspectRatio(child: Image.asset("assets/ic_news_image.jpeg"),aspectRatio: 2/1,))
            ],
          ),
          SizedBox(height: 8,),
          Text(
              "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?",
              style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(
                color: Colors.white60
              ),),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )

        ],
      ),
    );
  }
}
