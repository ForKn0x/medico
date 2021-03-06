import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DocCard extends StatelessWidget {
  DocCard(
      {this.text,
      this.press,
      this.speciality,
      @required this.docUid,
      this.imageUrl,
      this.docx});

  final String text;
  final Function press;
  final String speciality;
  final String imageUrl;
  final String docUid;
  final QueryDocumentSnapshot docx;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Card(
            margin: EdgeInsets.only(bottom: 20, left: 10, top: 10),
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Column(
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Bebas',
                            fontSize:
                                MediaQuery.of(context).size.width * 0.063),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        speciality,
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Muli',
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: double.parse(docx['rating']),
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 15,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            docx['rating'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Muli',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Text(
                        '120 Reviews',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Muli',
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
