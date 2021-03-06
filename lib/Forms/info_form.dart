import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import '../Wizards/forms.dart';
import 'package:enum_to_string/enum_to_string.dart';
import '../Pages/bottom_nav.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class InfoForm extends StatefulWidget {
  final String category;
  final String auth;
  static const String id = 'info_form';

  const InfoForm({this.category, this.auth});

  @override
  _InfoFormState createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  bool isLoading = false;
  String infoGender;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Stack(children: [
          isLoading
              ? CircularProgressIndicator()
              : SizedBox(
                  height: 0,
                ),
          Scaffold(
              body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green,
                Colors.teal,
              ],
            )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackIcon(),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      _buildText()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(child: _buildFormContainer()),

                  SizedBox(
                    height: 30,
                  ),
                  //_buildButton(),
                ],
              ),
            ),
          )),
        ]),
      ),
    );
  }

  _buildText() {
    return Text(
      'Info',
      style: TextStyle(
        fontSize: 50,
        color: Colors.white,
        fontFamily: 'Bebas',
      ),
    );
  }

  _buildBackIcon() {
    return IconButton(
      icon: Icon(FeatherIcons.arrowLeft),
      color: Colors.white,
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

  _buildFormContainer() {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5.5,
              blurRadius: 5.5,
            )
          ],
        ),
        child: Column(
          children: [
            _buildDOB(),
            SizedBox(
              height: 10,
            ),
            _buildUserAddress(),
            SizedBox(
              height: 10,
            ),
            _buildUserEmail(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(child: _buildUserHeight()),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: _buildUserWeight())
              ],
            ),
            SizedBox(
              height: 20,
            ),
            textGender(),
            _genderWidget(true, true),
            SizedBox(
              height: 30,
            ),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  _genderWidget(bool _showOther, bool _alignment) {
    return Container(
        child: new Column(
      children: [
        new Container(
          alignment: Alignment.center,
          child: GenderPickerWithImage(
            showOtherGender: _showOther,
            verticalAlignedText: _alignment,
            onChanged: (Gender _gender) {
              infoGender = EnumToString.convertToString(_gender);
              print(infoGender);
            },
            selectedGender: null,
            selectedGenderTextStyle: TextStyle(fontWeight: FontWeight.bold),
            unSelectedGenderTextStyle: TextStyle(fontWeight: FontWeight.normal),
            maleImage: AssetImage('images/male.png'),
            femaleImage: AssetImage('images/female.png'),
            otherGenderImage: AssetImage('images/others.png'),
            size: 70,
            opacityOfGradient: 0.2,
          ),
        )
      ],
    ));
  }

  textGender() {
    return Container(
      child: new Text(
        "Gender",
        style: TextStyle(
          fontFamily: 'Coda',
        ),
      ),
    );
  }

  _buildUserEmail() {
    return TextFieldForm(
      onChanged: (value) {
        setState(() {
          isFormValid();
        });
      },
      validator: (value) {
        if (!value.contains("@")) {
          return 'Email not valid';
        }
        if (value.isEmpty) {
          return 'Please enter your Email';
        }
        return null;
      },
      cntrl: emailController,
      ico: Icon(FeatherIcons.mail),
      labelTxt: 'Email',
      txt: 'Enter Your Email',
      types: TextInputType.emailAddress,
    );
  }

  _buildUserAddress() {
    return TextFieldForm(
      onChanged: (value) {
        setState(() {
          isFormValid();
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your Address';
        }
        return null;
      },
      cntrl: addressController,
      ico: Icon(FeatherIcons.map),
      labelTxt: 'Address',
      txt: 'Enter Your Address',
      types: TextInputType.streetAddress,
    );
  }

  _buildUserHeight() {
    return TextFieldForm(
      onChanged: (value) {
        setState(() {
          isFormValid();
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return '*Required';
        }
        return null;
      },
      cntrl: heightController,
      ico: Icon(FeatherIcons.chevronsDown),
      labelTxt: 'Height',
      txt: 'Height',
      types: TextInputType.number,
    );
  }

  _buildUserWeight() {
    return TextFieldForm(
      onChanged: (value) {
        setState(() {
          isFormValid();
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return '*Required';
        }
        return null;
      },
      cntrl: weightController,
      ico: Icon(FeatherIcons.chevronsLeft),
      labelTxt: 'Weight',
      txt: 'Weight',
      types: TextInputType.number,
    );
  }

  _buildButton() {
    return ElevatedButton(
      onPressed: () {
        if (isFormValid()) {
          _setInformationToDatabase();
          Navigator.pushNamed(context, BotNavBar.id);
        }
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Continue',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.teal,
              fontSize: 30,
              fontFamily: 'Bebas',
              letterSpacing: 0.7),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
    );
  }

  Future<void> _setInformationToDatabase() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance
        .collection(widget.category)
        .doc(widget.auth)
        .update({
      "DOB": dobController.text,
      "address": addressController.text,
      "email": emailController.text,
      "gender": infoGender,
      "height": heightController.text,
      "weight": weightController.text,
      "desc": '',
      'rating' : '0',
      'ImgUrl' : 'https://firebasestorage.googleapis.com/v0/b/medico-7af3f.appspot.com/o/150-1503945_transparent-user-png-default-user-image-png-png.png?alt=media&token=41f12d96-3b95-4427-8b0d-d576f6665b7d'
    });
    setState(() {
      isLoading = false;
    });
  }

  _buildDOB() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          isFormValid();
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your DOB';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        DateInputFormatter(),
      ],
      controller: dobController,
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.calendar_view_day_rounded),
        ),
        labelText: 'Date Of Birth',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(
          fontFamily: 'Muli',
        ),
        contentPadding: EdgeInsets.all(15),
        hintText: 'DD/MM/YYYY',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.width * 0.04,
          fontFamily: 'Muli',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            )),
      ),
    );
  }

  bool isFormValid() {
    if (_formKey.currentState.validate()) {
      return true;
    }
    return false;
  }
}
