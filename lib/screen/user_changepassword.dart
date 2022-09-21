import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:project_bekery/mysql/service.dart';
import 'package:project_bekery/mysql/user.dart';
import 'package:project_bekery/screen/user_profire.dart';
import 'package:project_bekery/widgets/userAppbar.dart';

class user_changepassword extends StatefulWidget {
  const user_changepassword({Key? key}) : super(key: key);

  @override
  State<user_changepassword> createState() => _user_changepasswordState();
}

class _user_changepasswordState extends State<user_changepassword> {
  final fromKey = GlobalKey<FormState>();
  String? user_email, password1, password2;
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
          trailing: IconButton(
            onPressed: () {
              if (fromKey.currentState!.validate()) {
                fromKey.currentState!.save();
                if (password1 == password2) {
                  print('สามารถเปลี่ยนได้}');
                  _changepassword(password1);
                } else {
                  print('ไม่สามารถเปลี่ยนได้}');
                }
              }
            },
            icon: Icon(Icons.save),
          ),
          appBarHeight: 85,
          appBarColor: Color.fromARGB(255, 255, 222, 178),
          title: Container(
            child: Center(
                child: const Text(
              'แก้ไข้หรัสผ่าน',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        slider: UserAppBar(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.orangeAccent.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              height: 20,
                            ),
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
                                        password1 = password;
                                      });
                                    },
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      label: Text('ใส่รหัสผ่านใหม่'),
                                      prefixIcon: const Icon(
                                        Icons.key,
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(
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
                                        password2 = password;
                                      });
                                    },
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      label: Text('ยืนยันรหัสผ่าน'),
                                      prefixIcon: const Icon(
                                        Icons.key,
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ]))
                          ],
                        ),
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