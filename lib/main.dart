import 'package:flutter/material.dart';
import 'package:medico/Pages/bottom_nav.dart';
import 'package:medico/Forms/info_form.dart';
import 'package:medico/Pages/shop/cart/cart_screen.dart';
import 'package:medico/details/details_screen.dart';
import 'Pages/home_page.dart';
import 'Forms/log_in.dart';
import 'Forms/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final firebaseUser = _auth.currentUser;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getType();
  _getDocData();
  _getProductData();
  runApp(MedicoApp());
}

_getDocData() async {
  QuerySnapshot querySnapshot = await _firestore.collection("doctors").get();
  for (var i = 0; i < querySnapshot.size; i++) {
    docData.add(querySnapshot.docs[i]['First name']);
    //print(querySnapshot.docs[i]['First name']);
  }
}

_getProductData () async{
  QuerySnapshot querySnapshot = await _firestore.collection("products").get();
  for (var i = 0; i < querySnapshot.size; i++) {
    productData.add(querySnapshot.docs[i]['Name']);
  }
}

Future getType() async {
  if (firebaseUser != null)
    await _firestore
        .collection('AllUsers')
        .doc(firebaseUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      userType = documentSnapshot.get('User');
    }).catchError((e) {
      print(e);
    });
}

class MedicoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          HomePage.id: (context) => HomePage(),
          LogIn.id: (context) => LogIn(),
          SignUp.id: (context) => SignUp(),
          BotNavBar.id: (context) => BotNavBar(),
          InfoForm.id: (context) => InfoForm(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      );
    });
  }
}

// riwimi007@gmail.com
// riwimi123
