import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final firebaseUser = _auth.currentUser;

class AppointmentSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF0F2F8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.28,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Card(
          margin: EdgeInsets.only(
              bottom: 20, left: 10, top: 10, right: 10),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text('You have No regulars yet'),
          ),
        ),
      ),
    );
  }
}


// if (userType == 'doctors') {
// return StreamBuilder(
// stream:  _firestore
//     .collection('doctors')
//     .doc(firebaseUser.uid)
//     .collection('regulars')
//     .snapshots(),
// builder:
// (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// if (!snapshot.hasData || snapshot.data.docs.isEmpty){
// return Container(
// color: Color(0xffF0F2F8),
// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height * 0.28,
// child: SizedBox(
// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height * 0.25,
// child: Card(
// margin: EdgeInsets.only(
// bottom: 20, left: 10, top: 10, right: 10),
// elevation: 20,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(30),
// ),
// child: Center(
// child: Text('You have No regulars yet'),
// ),
// ),
// ),
// );
// } else{
// return Container(
// color: Color(0xffF0F2F8),
// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height * 0.28,
// child: Center(
// child: SizedBox(
// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height * 0.25,
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: snapshot.data.docs.map((document) {
// return StreamBuilder(stream:  _firestore.collection('doctors').snapshots(),
// builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> abc) {
// return Row(
// children: abc.data.docs.map((xyz) {
// if(document['UID'] == xyz.id){
// return DocCard(
// imageUrl: xyz['imageURl'],
// text: xyz['First name'] +
// " " +
// xyz['Last name'],
// speciality: xyz['speciality'],
// press: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder:
// (BuildContext context) =>
// DoctorExp(xyz)),
// );
// },
// );
// }else{return Text('');}
// }).toList(),
// );
// },);
// }).toList(),
// ),
// )),
// ));
//
// }
// });
// } else {return Container();}
//
//
