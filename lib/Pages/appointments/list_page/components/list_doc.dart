import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medico/Pages/appointments/expain_page/doctor_explained.dart';
import '../../components/doc_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
final firebaseUser = _auth.currentUser;

class DocList extends StatelessWidget {
  DocList({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('doctors')
          .where('speciality', isEqualTo: title)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Text('');
        } else {
          return SingleChildScrollView(
            child: Column(
              children: snapshot.data.docs.map((document) {
                if (document.id != firebaseUser.uid){
                  return DocCard(
                    docx: document,
                    docUid: document.id,
                    imageUrl: document['ImgUrl'],
                    text: document['First name'] + " " + document['Last name'],
                    speciality: document['speciality'],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DoctorExp(document)),
                      );
                    },
                  );
                } else { return Text('');}
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
