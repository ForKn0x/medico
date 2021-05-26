import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:medico/Pages/appointments/expain_page/components/body_part.dart';
import 'package:medico/Pages/appointments/expain_page/components/head_part.dart';

class DoctorExp extends StatefulWidget {
  static const String id = 'doctor_explained';

  @override
  _DoctorExpState createState() => _DoctorExpState();
}

class _DoctorExpState extends State<DoctorExp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff7f7fc),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(),
              HeadPart(),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              BodyPart(),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff0118B5),
                  borderRadius: BorderRadius.circular(25)
                ),
                width: MediaQuery.of(context).size.width - 90,
                child: Center(
                  child: TextButton(
                    child: Text('Make appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Muli',
                        fontSize: MediaQuery.of(context).size.width * 0.05
                      ),
                    ),
                  )
                ),
              ),
            ),
          ),
        )
      ),
    );
  }

  _buildBackButton() {
   return IconButton(
     icon: Icon(FeatherIcons.arrowLeft),
     color: Colors.black,
     constraints: BoxConstraints(
       maxHeight: 100,
       maxWidth: 100,
       minHeight: 80,
       minWidth: 80,
     ),
     onPressed: () {
       setState(() {
         Navigator.pop(context);
       });
     },
   );
  }
}
