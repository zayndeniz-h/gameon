import 'package:flutter/material.dart';
import 'package:teen_patti/Locale/locales.dart';
import 'package:teen_patti/features/bottom_navigation/lobby/lobby_screen.dart';
import 'package:teen_patti/features/bottom_navigation/more/more_screen.dart';
import 'package:teen_patti/features/bottom_navigation/my_table/my_tables_screen.dart';
import 'package:teen_patti/features/bottom_navigation/wallet/wallet_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const LobbyScreen(),
    const MyTablesScreen(),
    const WalletScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> bottomBarItems = [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/footer_icons/ic_lobby.png',
          scale: 2,
        ),
        activeIcon: Image.asset(
          'assets/footer_icons/ic_lobbyact.png',
          scale: 2,
        ),
        label: locale.lobby.toUpperCase(),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/footer_icons/ic_table.png',
          scale: 2,
        ),
        activeIcon: Image.asset(
          'assets/footer_icons/ic_tableact.png',
          scale: 2,
        ),
        label: locale.myTable.toUpperCase(),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/footer_icons/ic_wallet.png',
          scale: 2,
        ),
        activeIcon: Image.asset(
          'assets/footer_icons/ic_walletact.png',
          scale: 2,
        ),
        label: locale.wallet.toUpperCase(),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/footer_icons/ic_more.png',
          scale: 2,
        ),
        activeIcon: Image.asset(
          'assets/footer_icons/ic_moreact.png',
          scale: 2,
        ),
        label: locale.more.toUpperCase(),
      ),
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 10,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).hintColor,
        currentIndex: _currentIndex,
        iconSize: 20,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // backgroundColor: Theme.of(context).primaryColorDark,
        type: BottomNavigationBarType.fixed,
        items: bottomBarItems,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
