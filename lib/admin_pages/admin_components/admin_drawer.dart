import 'package:flutter/material.dart';
import 'package:minmalecommerce/admin_pages/products.dart';
import 'package:minmalecommerce/components/my_list_tile.dart';
import 'package:minmalecommerce/pages/about_page.dart';
import 'package:minmalecommerce/pages/cart_page.dart';
import 'package:minmalecommerce/pages/settings_page.dart';
import 'package:minmalecommerce/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AdminDrawer extends StatelessWidget {
  AdminDrawer({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  void signUserOut() {
    googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    print("size drwer");
    print(Utils.getScreenWidth(context) * 0.2);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header  : logo
              DrawerHeader(
                child: Image.asset(
                  'lib/images/logo.png',
                  height: 200,
                ),
              ),
              SizedBox(
                height: Utils.getScreenHeight(context) * 0.02,
              ),
              // shop tile
              MyListTile(
                text: "Home",
                icon: Icons.home,
                onTap: () {
                  print("object");
                  Navigator.pop(context);
                },
              ),
              MyListTile(
                text: "Products",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, ProductPage.id);
                },
              ),
              MyListTile(
                text: "Settings",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, SettingsPage.id);
                },
              ),
              MyListTile(
                text: "About",
                icon: Icons.info,
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, AboutPage.id);
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Utils.getScreenHeight(context) * 0.02),
            child: MyListTile(
              text: "Log Out",
              icon: Icons.logout,
              onTap: () {
                signUserOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
