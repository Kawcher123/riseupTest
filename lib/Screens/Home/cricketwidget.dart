import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:riseup_sports_game/api_controller/cricket_api.dart';
import 'package:riseup_sports_game/components/shimmer.dart';
import 'package:riseup_sports_game/components/theme.dart';
import 'package:riseup_sports_game/helper/helper.dart';
import 'package:riseup_sports_game/models/cricketMatchModel.dart';
import 'package:provider/provider.dart';

class CricketWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () async {
        return await Provider.of<CricketApi>(context, listen: false).fetch();
      },
      backgroundColor: cardColor,
      color: lightYellow,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: width * .5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/cric.jpeg'),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Consumer<CricketApi>(builder: (context, cricketmathes, child) {
            if (cricketmathes.isComplete != true) {
              return Center(
                child: LoadingListPage(),
              );
            } else {
              return Container(
                child: Column(
                  children: List.generate(
                      cricketmathes.cricketMatches.matches.length, (index) {
                    Matches match = cricketmathes.cricketMatches.matches[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, bottom: 15),
                      child: Container(
                        height: width * .3,
                        decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  match.seasonName != null
                                      ? match.seasonName
                                      : '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: lightYellow,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ImageIcon(
                                          match.teamA.jersey == ''
                                              ? AssetImage("assets/cricket.png")
                                              : NetworkImage(
                                                  match.teamA.jersey),
                                          color: lightYellow,
                                          size: 40,
                                        ),
                                        Text(
                                          match.teamA.shortName.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: lightYellow,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '${Helper.leftDays(match.startDate)} Days left',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        ImageIcon(
                                          match.teamB.jersey == ''
                                              ? AssetImage("assets/cricket.png")
                                              : NetworkImage(
                                                  match.teamB.jersey),
                                          color: lightYellow,
                                          size: 40,
                                        ),
                                        Text(
                                          match.teamB.shortName.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: lightYellow,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
