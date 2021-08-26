import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gstsuvidha/constant.dart';
import 'package:gstsuvidha/screen/details.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  int index;
  TextEditingController _gstControlller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    index=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final scH = MediaQuery.of(context).size.height;
    final scW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            Container(
              height: 185,
              decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20,right: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.more_vert,color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,top: 30),
                    child: Text('Select the type for',
                      style: TextStyle(color: Colors.white,fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,top: 3),
                    child: Text('GST Number Search Tool',
                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15,left: 25,right: 25),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(26, 136, 75, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        index==0?
                        Container(
                          width: scW*0.42,
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Text('Search GST Number',
                              style: TextStyle(color: greenColor,fontSize: 10,fontWeight: FontWeight.w500),
                            ),
                          ),
                        ):
                        InkWell(
                          onTap: (){
                            setState(() {
                              _gstControlller = TextEditingController();
                              index = 0;
                            });
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: scW*0.08),
                              child: Text('Search GST Number',
                                style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        index==1?
                        Container(
                          width: scW*0.42,
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white
                          ),
                          child: Center(
                            child: Text('GST Return Status',
                              style: TextStyle(color: greenColor,fontSize: 10,fontWeight: FontWeight.w500),
                            ),
                          ),
                        ):
                        InkWell(
                          onTap: (){
                            setState(() {
                              index = 1;
                            });
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(right: scW*0.08),
                              child: Text('GST Return Status',
                                style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            index==0?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40,left: 20),
                      child: Text('Enter GST Number',
                        style: TextStyle(color: greyColor,fontSize: 11),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: TextFormField(
                        maxLength: 15,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          if (val.length <15)
                            return "GST number must contain 15 digit";
                          else
                            return null;
                        },
                        controller: _gstControlller,
                        style: TextStyle(fontSize: 14),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          counterStyle: TextStyle(fontSize: 0),
                          hintText: 'EX 07AA689098PST8P',
                          contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 16),
                          hintStyle: TextStyle(color: Color.fromRGBO(180, 180, 180, 0.5),fontSize: 12),
                          fillColor: Color.fromRGBO(230, 230, 230, 1),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: scW,
                      height: 45,
                      margin: EdgeInsets.all(20),
                      child: RaisedButton(
                        onPressed: (){
                          if (_formKey.currentState.validate()) {
                            print(_gstControlller.text);
                            Get.to(Details(_gstControlller.text));
                          }
                        },
                        color: greenColor,
                        elevation: 0,
                        child: Text('Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ):
                Container(),
          ],
        ),
      ),
    );
  }
}
