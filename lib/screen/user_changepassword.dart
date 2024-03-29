import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project_bekery/mysql/service.dart';
import 'package:project_bekery/mysql/user.dart';
import 'package:project_bekery/screen/user_profire.dart';
import 'package:project_bekery/widgets/userAppbar.dart';

import '../drawer/Constants/Constants.dart';

class user_changepassword extends StatefulWidget {
  const user_changepassword({Key? key}) : super(key: key);

  @override
  State<user_changepassword> createState() => _user_changepasswordState();
}

class _user_changepasswordState extends State<user_changepassword> {
  final fromKey = GlobalKey<FormState>();
  String? user_email, password1, password2, originpassword;
  List<User>? user = [];
  void initState() {
    super.initState();
    _getuserdata();
  }

  _getuserdata() async {
    user_email = await SessionManager().get("email");
    Art_Services().getonlyUser(user_email.toString()).then((datauser) => {
          setState(() {
            user = datauser;
          }),
        });
  }

  _changepassword(password) async {
    user_email = await SessionManager().get("email");
    Art_Services()
        .changeuserpassword(user_email.toString(), password.toString())
        .then((value) => {
              Fluttertoast.showToast(
                  msg: "เปลี่ยนรหัสเรียบร้อย",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color.fromARGB(255, 0, 255, 47),
                  textColor: Colors.white,
                  fontSize: 16.0),
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return user_profile();
              })),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        appBar: SliderAppBar(
          drawerIconColor: Colors.blue,
          appBarHeight: 85,
          appBarColor: Colors.white,
          title: Container(
            child: Center(
                child: const Text(
              'แก้ไข้หรัสผ่าน',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        slider: UserAppBar(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(255, 238, 238, 238),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: <Widget>[
                      Form(
                          key: fromKey,
                          child: Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อนข้อมูล"),
                              onSaved: (password) {
                                setState(() {
                                  originpassword = password;
                                });
                              },
                              autofocus: false,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                fillColor: Colors.white,
                                label: Text(
                                  'ใส่รหัสเดิม',
                                  style: TextStyle(color: Colors.black),
                                ),
                                prefixIcon: const Icon(
                                  Icons.key,
                                  color: Colors.blue,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อนข้อมูล"),
                              onSaved: (password) {
                                setState(() {
                                  password1 = password;
                                });
                              },
                              autofocus: false,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                fillColor: Colors.white,
                                label: Text(
                                  'ใส่รหัสผ่านใหม่',
                                  style: TextStyle(color: Colors.black),
                                ),
                                prefixIcon: const Icon(
                                  Icons.key,
                                  color: Colors.blue,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อนข้อมูล"),
                              onSaved: (password) {
                                setState(() {
                                  password2 = password;
                                });
                              },
                              autofocus: false,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                fillColor: Colors.white,
                                label: Text(
                                  'ยืนยันรหัสผ่าน',
                                  style: TextStyle(color: Colors.black),
                                ),
                                prefixIcon: const Icon(
                                  Icons.key,
                                  color: Colors.blue,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () async {
                            user_email = await SessionManager().get("email");
                            if (fromKey.currentState!.validate()) {
                              fromKey.currentState!.save();
                              Art_Services()
                                  .Loginuser(user_email, originpassword)
                                  .then((value) {
                                if (value.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "รหัสเดิมไม่ถูกต้อง",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 0, 0),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  if (password1 != password2) {
                                    Fluttertoast.showToast(
                                        msg: "รหัสที่กรอกไม่เหมือนกัน",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Color.fromARGB(255, 255, 0, 0),
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    _changepassword(password1);
                                  }
                                }
                              });
                            }
                          },
                          child: Text('เปลี่ยนรหัส'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
