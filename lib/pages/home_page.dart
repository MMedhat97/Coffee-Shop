import 'package:coffee/components/bottom_nav_bar.dart';
import 'package:coffee/consts.dart';
import 'package:coffee/pages/cart_page.dart';
import 'package:coffee/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //navigate bottom bar
  int _selectedIndex =0;
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    //shop pages
    ShopPage(),

    //cart pages
    CartPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTapChange: (index)=> navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            )),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                DrawerHeader(
                    child: Image.asset(
                      'lib/images/coffeelogo.png',
                      color: Colors.brown,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),

                //other pages
                const Padding(
                  padding:  EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.brown,
                    ),
                    title: Text('Home',
                      style: TextStyle(color: Colors.brown),),

                  ),
                ),

                const Padding(
                  padding:  EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.brown,
                    ),
                    title: Text('About',
                      style: TextStyle(color: Colors.brown),),

                  ),
                ),
              ],
            ),

            const Padding(
              padding:  EdgeInsets.only(left: 25.0,bottom: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.brown,
                ),
                title: Text('Logout',
                  style: TextStyle(color: Colors.brown),),

              ),
            ),

          ],
        ),
      ),

      body: _pages[_selectedIndex],
    );
  }
}
