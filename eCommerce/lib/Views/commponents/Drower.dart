import 'package:flutter/material.dart';

class customDrawer extends StatelessWidget {
  const customDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:[
          UserAccountsDrawerHeader(
            accountName:const Text(
              'User',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            accountEmail: const Text(
              'samarthmovaliya1@gmail.com',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset("images/beforeLogin/1.png",height: 60,),
            ),
            decoration:const BoxDecoration(
              color: Color(0xFFee9b9a),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title:const Text('Favourite'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading:const Icon(Icons.shopping_cart),
            title: const Text('Orders'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
