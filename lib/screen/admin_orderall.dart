import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:project_bekery/drawer/UI/ComplexDrawerPage.dart';
import 'package:project_bekery/login/login.dart';
import 'package:project_bekery/model/export_product.dart';
import 'package:project_bekery/model/export_product_detail.dart';
import 'package:project_bekery/mysql/service.dart';
import 'package:project_bekery/widgets/adminAppbar.dart';

class admin_orderall extends StatefulWidget {
  const admin_orderall({Key? key}) : super(key: key);

  @override
  State<admin_orderall> createState() => _admin_orderallState();
}

class _admin_orderallState extends State<admin_orderall> {
  List<Export_product>? _Export_product;
  List<Export_product_detail>? _orderdetail;
  late int datalength;
  List<String> datadetail_lengthlist = [];

  void initState() {
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    super.initState();
    _Export_product = [];
    _getImport_product('ยังไม่มีใครรับ');
    print(datadetail_lengthlist);
  }

  _getImport_product(where) async {
    print("function working");
    Art_Services().gatallExport_product(where).then((value) {
      setState(() {
        _Export_product = value;
        datalength = value.length;
      });
    });
  }

  _getquantity(order_id) {
    int? datadetail_length;
    print('--------------------------funtion--------------------------------');
    print('รับข้อมูล : ${order_id}');
    Art_Services().getorder_detail(order_id.toString()).then((value) {
      setState(() {
        datadetail_length = value.length;
      });
    });
    return datadetail_length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliderDrawer(
      appBar: SliderAppBar(
        drawerIconColor: Colors.white,
        trailing: PopupMenuButton(
          icon: Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
          ),
          onSelected: (value) {
            print('สถานะ : ${value.toString()}');
            _getImport_product(value);
          },
          itemBuilder: (BuildContext bc) {
            return const [
              PopupMenuItem(
                child: Text("ยังไม่มีใครรับ"),
                value: 'ยังไม่มีใครรับ',
              ),
              PopupMenuItem(
                child: Text("ส่งเรียบร้อย"),
                value: 'ส่งเรียบร้อย',
              ),
              PopupMenuItem(
                child: Text("รายการที่ยกเลิก"),
                value: 'รายการที่ยกเลิก',
              ),
              PopupMenuItem(
                child: Text("ของกำลังส่ง"),
                value: 'ของกำลังส่ง',
              )
            ];
          },
        ),
        appBarHeight: 85,
        appBarColor: Color(0xFFbe95c4),
        title: Container(
          child: Center(
              child: const Text(
            'รายงานการขาย',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      slider: ComplexDrawer(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:
                  _Export_product != null ? (_Export_product?.length ?? 0) : 0,
              itemBuilder: (_, index) => Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0, bottom: 8.0),
                        child: Container(
                            child: Card(
                          elevation: 20,
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: _Export_product![index].order_status ==
                                        'ยังไม่มีใครรับ'
                                    ? Icon(
                                        Icons.timelapse,
                                        color: Color.fromARGB(255, 255, 166, 0),
                                      )
                                    : _Export_product![index].order_status ==
                                            'ส่งเรียบร้อย'
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.lightGreen,
                                          )
                                        : _Export_product![index]
                                                    .order_status ==
                                                'รายการที่ยกเลิก'
                                            ? Icon(
                                                Icons.cancel,
                                                color: Color.fromARGB(
                                                    255, 255, 0, 0),
                                              )
                                            : _Export_product![index]
                                                        .order_status ==
                                                    'ของกำลังส่ง'
                                                ? Icon(
                                                    Icons.motorcycle,
                                                    color: Colors.lightGreen,
                                                  )
                                                : Container(),
                                title: Text(
                                    'สั่งซื้อโดย : ${_Export_product![index].user_name} ${_Export_product![index].user_surname}'),
                                subtitle: Text(
                                    'จำนวนรายการ : ${_Export_product![index].product_amount}'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'วันที่สั่ง ${_Export_product![index].date}',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.discount_rounded,
                                        color: Colors.lightGreen,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          '${_Export_product![index].total_price} .-  '),
                                    ],
                                  )
                                ],
                              ),
                              ButtonBar(
                                  alignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    admin_oderall_detail(
                                                      _Export_product![index]
                                                          .order_id
                                                          .toString(),
                                                      _Export_product![index]
                                                          .total_price
                                                          .toString(),
                                                      _Export_product![index]
                                                          .order_responsible_person
                                                          .toString(),
                                                      _Export_product![index]
                                                          .date
                                                          .toString(),
                                                      _Export_product![index]
                                                          .user_name
                                                          .toString(),
                                                      _Export_product![index]
                                                          .user_surname
                                                          .toString(),
                                                    )));
                                      },
                                      child: const Text('รายละเอียด >'),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          primary: Colors.red),
                                    ),
                                  ]),
                            ],
                          ),
                        )),
                      ),
                    ),
                  )),
        ),
      ),
    ));
  }
}

class admin_oderall_detail extends StatefulWidget {
  final String order_id,
      total_price,
      order_responsible_person,
      date,
      user_name,
      user_surname;
  const admin_oderall_detail(
      this.order_id,
      this.total_price,
      this.order_responsible_person,
      this.date,
      this.user_name,
      this.user_surname,
      {Key? key})
      : super(key: key);

  @override
  State<admin_oderall_detail> createState() => _admin_oderall_detailState();
}

class _admin_oderall_detailState extends State<admin_oderall_detail> {
  List<Export_product_detail>? _orderdetail;
  @override
  void initState() {
    super.initState();
    _orderdetail = [];
    _getImport_product();
  }

  _getImport_product() {
    print("function working");
    Art_Services().getuserorder_detail(widget.order_id).then((value) {
      setState(() {
        _orderdetail = value;
      });

      print('จำนวข้อมูล : ${value.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('รายละเอียดการขาย'),
        backgroundColor: Color(0xFFbe95c4),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                            'สั่งในวันที่ : ${DateFormat('วันที่ d เดือน MMMM ปี y', 'th').format(DateTime.parse('${widget.date}'))}'),
                        SizedBox(height: 20),
                        Text(
                            'สั่งซื้อโดย : ${widget.user_name}  ${widget.user_surname}'),
                        SizedBox(height: 20),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _orderdetail != null
                              ? (_orderdetail?.length ?? 0)
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
                                        'ชื่อสินค้า : ${_orderdetail![index].product_name}'),
                                    Text(
                                        'จำนวน : ${_orderdetail![index].product_amount}'),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        'ราคาต่อชิ้น : ${_orderdetail![index].product_price}'),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${_orderdetail![index].product_promotion_name}'),
                                    Text(
                                        'ราคารวม : ${_orderdetail![index].totalprice}'),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Divider(color: Colors.black)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('ราคารวม : ${widget.total_price}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),

      /*SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Container(
                  height: 600,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('${widget.order_id}'),
                        SizedBox(height: 20),
                        Text(
                            'คนรับผิดชอบงาน :  ${widget.order_responsible_person}'),
                        SizedBox(height: 20),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _orderdetail != null
                              ? (_orderdetail?.length ?? 0)
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
                                        'ชื่อสินค้า : ${_orderdetail![index].product_name}'),
                                    Text(
                                        'จำนวน : ${_orderdetail![index].product_amount}'),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        'ราคาต่อชิ้น : ${_orderdetail![index].product_price}'),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('ราคารวม : ${widget.total_price}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        )*/
    );
  }
}
