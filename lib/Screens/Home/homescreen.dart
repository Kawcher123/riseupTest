import 'package:flutter/material.dart';
import 'package:riseup_sports_game/Screens/Home/homebody.dart';
import 'package:provider/provider.dart';
import 'package:riseup_sports_game/api_controller/cricket_api.dart';
import 'package:riseup_sports_game/api_controller/football_api.dart';
import 'package:riseup_sports_game/components/theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isLoading = false;

  GlobalKey<RefreshIndicatorState> refreshKey;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  static List<Widget> _widgetOptions = <Widget>[
    Homebody(),
    Text(
      'Contests',
      style: optionStyle,
    ),
    Text(
      'User Profile',
      style: optionStyle,
    ),
    Text(
      'More',
      style: optionStyle,
    ),
  ];

  void _onbottomItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
  }

  getData() async {
    await Provider.of<CricketApi>(context, listen: false).fetch();
    await Provider.of<FootballApi>(context, listen: false).fetch();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [lightYellow, darkYellow],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.8],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onbottomItemTapped(index);
        },
        showUnselectedLabels: true,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: cardColor,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/home.png"),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/trophy.png"),
            ),
            label: 'Contest',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/avatar.png"),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
