import 'package:flutter/material.dart';
import 'package:riseup_sports_game/Screens/Home/cricketwidget.dart';
import 'package:riseup_sports_game/Screens/Home/footballwidget.dart';
import 'package:riseup_sports_game/components/theme.dart';

class Homebody extends StatelessWidget {
  TabBar get _tabBar => TabBar(
        indicatorColor: lightYellow,
        unselectedLabelColor: Colors.white,
        labelColor: lightYellow,
        tabs: [
          Tab(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage("assets/cricket.png"),
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cricket',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage("assets/football.png"),
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Football',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Game Play'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [darkYellow, lightYellow],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.8],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Color(0xff39353b),
              child: Align(
                alignment: Alignment.centerLeft,
                child: _tabBar,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            CricketWidget(),
            FootballWidget(),
          ],
        ),
      ),
    );
  }
}
