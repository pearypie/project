// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:project_bekery/login/login.dart';
import 'package:project_bekery/model/export_product.dart';
import 'package:project_bekery/model/export_product_detail.dart';
import 'package:project_bekery/mysql/service.dart';
import 'package:project_bekery/screen/rider_orderdetail.dart';
import 'package:project_bekery/widgets/loadingscreen.dart';
import 'package:project_bekery/widgets/riderAppbar.dart';

class rider_allorder extends StatefulWidget {
  const rider_allorder({Key? key}) : super(key: key);

  @override
  _rider_allorderState createState() => _rider_allorderState();
}

class _rider_allorderState extends State<rider_allorder> {
  List<Export_product>? user_order;
  String? user_email;

  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    user_order = [];
    _getImport_product();
  }

  _getImport_product() async {
    //user_email = await SessionManager().get("email");
    Art_Services().rider_getExport_product('ยังไม่มีใครรับ').then((value) {
      setState(() {
        user_order = value;
      });

      print('จำนวข้อมูล : ${value.length}');
    });
  }

  GetAddressFromLatLong(latitude, longitude) async {
    List placemarks = await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    Placemark place = await placemarks[0];
    String Address = await '${place.street}';
    return Address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SliderDrawer(
          appBar: SliderAppBar(
            drawerIconColor: Colors.blue,
            appBarHeight: 85,
            appBarColor: Colors.white,
            title: Container(
              child: Center(
                  child: const Text(
                'รายการสั่งซื้อ',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          slider: RiderAppBar(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 238, 238, 238),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: user_order != null ? (user_order?.length ?? 0) : 0,
                  itemBuilder: (_, index) => Center(
                        child: Container(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, left: 8.0, bottom: 8.0),
                              child: Container(
                                  child: Card(
                                      elevation: 20,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Column(children: [
                                        ListTile(
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return user_order_detail(
                                                  user_order![index]
                                                      .order_id
                                                      .toString(),
                                                  user_order![index]
                                                      .total_price
                                                      .toString(),
                                                  user_order![index]
                                                      .order_by
                                                      .toString(),
                                                  user_order![index]
                                                      .date
                                                      .toString(),
                                                  user_order![index]
                                                      .user_name
                                                      .toString(),
                                                  user_order![index]
                                                      .user_surname
                                                      .toString(),
                                                );
                                              }));
                                            },
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          title: Text(
                                              '${DateFormat('วันที่ d เดือน MMMM ปี y', 'th').format(DateTime.parse('${user_order![index].date}'))}'),
                                          subtitle: Text(
                                              'ที่อยู่ : ${user_order![index].mpas_detail}'),
                                          tileColor: Colors.white,
                                        ),
                                      ])))),
                        ),
                      )),
            ),
          ),
        ));
  }
}

class user_order_detail extends StatefulWidget {
  final String import_order_id,
      Import_product_pricetotal,
      order_by,
      order_date,
      username,
      usersername;
  const user_order_detail(this.import_order_id, this.Import_product_pricetotal,
      this.order_by, this.order_date, this.username, this.usersername,
      {Key? key})
      : super(key: key);

  @override
  State<user_order_detail> createState() => _import_order_detailState();
}

class _import_order_detailState extends State<user_order_detail> {
  List<Export_product_detail>? _Import_product;
  @override
  void initState() {
    super.initState();
    _Import_product = [];
    _getImport_product();
  }

  _getImport_product() {
    print("function working");
    Art_Services()
        .getuserorder_detail(widget.import_order_id)
        .then((Import_detail) {
      setState(() {
        _Import_product = Import_detail;
      });

      print('จำนวข้อมูล : ${Import_detail.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'รายละเอียดการสั่งซื้อ',
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey[100],
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(255, 238, 238, 238),
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                              'สั่งในวันที่ : ${DateFormat('วันที่ d เดือน MMMM ปี y', 'th').format(DateTime.parse('${widget.order_date}'))}'),
                          SizedBox(height: 20),
                          Text(
                              'สั่งซื้อโดย : ${widget.username} ${widget.usersername}'),
                          SizedBox(height: 20),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _Import_product != null
                                ? (_Import_product?.length ?? 0)
                                : 0,
                            itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'ชื่อสินค้า : ${_Import_product![index].product_name}'),
                                      Text(
                                          'จำนวน : ${_Import_product![index].product_amount}'),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${_Import_product![index].product_promotion_name}'),
                                      Text(
                                          'ราคารวม : ${_Import_product![index].totalprice}'),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Divider(color: Colors.black)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  'ราคารวม : ${widget.Import_product_pricetotal}'),
                            ],
                          ),
                          SizedBox(height: 5),
                          Divider(color: Colors.black),
                          SizedBox(height: 5),
                          SizedBox(
                            width: 250,
                            child: FloatingActionButton.extended(
                              icon: Icon(Icons.cancel),
                              backgroundColor: Color.fromARGB(255, 34, 155, 0),
                              heroTag: '1',
                              onPressed: () {
                                showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('รับออเดอร์'),
                                        content: const Text(
                                            'ต้องการรับออเดอร์นี้ใช้ไหม?'),
                                        actions: <Widget>[
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text("ไม่"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              Utils(context).startLoading();
                                              String email =
                                                  await SessionManager()
                                                      .get("email");
                                              print('email rider : ${email}');
                                              print(
                                                  'Order : ${widget.import_order_id}');
                                              Art_Services()
                                                  .rider_update_order(
                                                      email.toString(),
                                                      'ของกำลังส่ง',
                                                      widget.import_order_id
                                                          .toString())
                                                  .then((value) => {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return rider_allorder();
                                                        })),
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "สั่งซื้อเสร็จสิ้น",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .BOTTOM,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    4,
                                                                    255,
                                                                    0),
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 16.0),
                                                      });
                                            },
                                            child: const Text("ใช่"),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              label: Text('รับออเดอร์นี้'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ));
  }
}
