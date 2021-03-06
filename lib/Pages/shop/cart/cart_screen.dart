import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medico/Pages/shop/cart/components/Cart.dart';
import 'package:medico/Pages/shop/cart/components/body.dart';
import 'package:medico/Pages/shop/cart/components/check_out_card.dart';
import 'package:medico/constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final firebaseUser = _auth.currentUser;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;


class CartScreen extends StatelessWidget {
 static String routeName="/cart";



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Color(0xFFF5F6F9),
          appBar: buildAppBar(context),
          body: Body(),
          bottomNavigationBar: CheckoutCard(),
        );
      }
    );

  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      bottomOpacity: 0.0,
      elevation: 0.0,


      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          // Text(
          //   "${demoCarts.length} items",
          //   style: Theme.of(context).textTheme.caption,
          // )
        ],
      ),
    );
  }
}
