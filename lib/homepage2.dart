import 'package:flutter/material.dart';
import 'package:practice3/models/data_model.dart';
import 'package:practice3/network_call.dart/base_response.dart';
import 'package:practice3/network_call.dart/managers.dart';
import 'package:practice3/network_call.dart/managers2.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  bool fetching = true;
  DataModel2? datamodel2;
  Item? items;

  void getData() async {
    setState(() {
      fetching = true;
    });
    try {
      final response = await manager.fetchUsers();
      if (response.status == ResponseStatus.SUCCESS) {
        setState(() {
          datamodel2 = response.data;

          fetching = false;
        });
        fetching = false;
        print(response);
      }
    } catch (e) {
      setState(() {
        fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Data2",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: datamodel2 == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  //itemCount: 50,
                  itemCount: datamodel2!.items!.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => UsersProfile(
                          //               login: userData!.items![index].login,
                          //               avatar:userData!.items![index].avatarUrl
                          //             )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Title :",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      datamodel2!.items![index].title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description :",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: 
                                    // datamodel2!.items![index].description?
                                    // Text("Null",
                                    //  style: TextStyle(
                                    //     fontSize: 20,
                                    //     fontWeight: FontWeight.w400,
                                    //     color: Colors.black,
                                    //   ),
                                    // ):
                                    Text(
                                      datamodel2!.items![index].description,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
    );
  }
}
