import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gstsuvidha/constant.dart';
import 'package:gstsuvidha/screen/searchModel.dart';
import 'package:gstsuvidha/screen/searchRepository.dart';

class Details extends StatefulWidget {
  final text;
  Details(this.text);
  @override
  _DetailsState createState() => _DetailsState(text);
}

class _DetailsState extends State<Details> {
  final text;
  _DetailsState(this.text);

  SearchRepository _searchRepository;
  Future<SearchModel> _searchFuture;

  @override
  void initState() {
    _searchRepository = SearchRepository();
    _searchFuture = _searchRepository.searchRepositoryFunction(text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scH = MediaQuery.of(context).size.height;
    final scW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 0.98),
      body: FutureBuilder<SearchModel>(
          future: _searchFuture,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30,left: 20),
                              child: InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30,left: 5),
                              child: Text('GST Profile',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 20),
                          child: Text('GSTIN of the Tax Payer',
                            style: TextStyle(fontSize: 9,color: Color.fromRGBO(101, 183, 134, 1),fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 3),
                          child: Text(text,
                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 15),
                          child: Text(snapshot.data.name,
                            style: TextStyle(color: Colors.white,fontSize: 12),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 60,
                          margin: EdgeInsets.only(left: 20,top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: snapshot.data.status=="Active"?greenColor:Colors.red,
                                radius: 3,
                              ),
                              Text(snapshot.data.status=="Active"?' ACTIVE':' DEACTIVE',
                                style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: snapshot.data.status=="Active"?greenColor:Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 160,
                    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: Card(
                      elevation: 0,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10,top: 10),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Color.fromRGBO(101, 183, 134, 0.2),
                                  child: Center(child: Icon(Icons.location_on,color: greenColor,size: 15)),
                                ),
                                Container(
                                  height: 60,
                                  width: 1,
                                  color: Color.fromRGBO(101, 183, 134, 0.2),
                                ),
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Color.fromRGBO(101, 183, 134, 0.2),
                                  child: Center(child: Icon(Icons.account_balance_sharp,color: greenColor,size: 15)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10,top: 18,right: 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Principal Place of Business',
                                    style: TextStyle(fontSize: 8,color: greyColor,fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(snapshot.data.address,
                                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 35),
                                    child: Text('Principal Place of Business',
                                      style: TextStyle(fontSize: 8,color: greyColor,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text('Floor',
                                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 65,
                          width: scW*0.29,
                          child: Card(
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12,left: 10),
                                  child: Text('State Jurisdiction',
                                    style: TextStyle(color: greyColor,fontSize: 9,fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5,left: 10),
                                  child: Text('Ward 74',
                                    style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 65,
                          width: scW*0.29,
                          child: Card(
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12,left: 10),
                                  child: Text('Centre Jurisdiction',
                                    style: TextStyle(color: greyColor,fontSize: 9,fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5,left: 10),
                                  child: Text('RANGE-139',
                                    style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 65,
                          width: scW*0.29,
                          child: Card(
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12,left: 10),
                                  child: Text('Taxpayer Type',
                                    style: TextStyle(color: greyColor,fontSize: 9,fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5,left: 10),
                                  child: Text(snapshot.data.taxPayerType,
                                    style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 20,right: 20),
                    child: Container(
                      height: 65,
                      child: Card(
                        elevation: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12,left: 10),
                              child: Text('Constitution of Business',
                                style: TextStyle(color: greyColor,fontSize: 9,fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5,left: 10),
                              child: Text(snapshot.data.businessType,
                                style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 20,right: 20),
                    child: Container(
                      height: 65,
                      child: Card(
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12,left: 10),
                                  child: Text('Date of Registration',
                                    style: TextStyle(color: greyColor,fontSize: 9,fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5,left: 10),
                                  child: Text(snapshot.data.dateOfReg,
                                    style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12,right: 10),
                                  child: Text('Date of Certification',
                                    style: TextStyle(color: greyColor,fontSize: 9,fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5,right: 10,left: 70),
                                  child: Text('--',
                                    style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: scW,
                    height: 45,
                    margin: EdgeInsets.only(top: 90),
                    child: RaisedButton(
                      onPressed: (){},
                      color: greenColor,
                      elevation: 0,
                      child: Text('Get Return Filing Status',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text('Please check your GST number and try again.'),
              );;
            }else {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation<Color>(greenColor),
                ),
              );
            }
          }
      ),
    );
  }
}
