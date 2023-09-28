// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, sized_box_for_whitespace, use_build_context_synchronously, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/popular_contest.dart';
import 'package:get/get.dart';

class ContentPage extends StatefulWidget {
  ContentPage({super.key});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {

  //Loading JSON data to interface.
  List list = [];
  List info = [];

  _realData() async {
    await DefaultAssetBundle.of(context).loadString('assets/json/list.json').then((s) {
      setState(() {
        list=json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context).loadString('assets/json/info.json').then((s) {
      setState(() {
        info=json.decode(s);
      });
    });
  } 

  @override
  void initState() {
    super.initState();
    _realData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20
          ),
          color: Color(0xFFc5e5f3),
          child: Column(
            children: [

              //Name
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color(0xFFebf8fd)
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              'assets/user_5.jpg'
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Matheus',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3b3f42),                    
                                )
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Level 8',
                                style: TextStyle(                         
                                  fontSize: 16,
                                  color: Color(0xFF3b3f42),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      //SizedBox(width: 100),
                      //Icon
                      Icon(
                        Icons.notifications,
                        size: 30,
                        color: Color(0xFF69c5df), 
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              //Popular title
              Row(
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                      fontSize: 20,
                      color:Color(0xFF1f2326),                       
                    ),
                  ),
                  Expanded(child: Container()),
                  ElevatedButton(
                    onPressed: () => Get.to(() => PopularContest()),
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(Colors.amber),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                    child: Text(
                      "Mostrar +",
                      style: TextStyle(
                        fontSize: 14,
                        color:Colors.white,
                      ),
                    ),
                  ),
                  // Text(
                  //   "Mais +",
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color:Color(0xFF1f2326),  
                  //   ),
                  // ),
                  // SizedBox(width: 5),
                  // Container(
                  //   width: 30,
                  //   height: 30,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //       color: Color(0xFFfdc33c)
                  //   ),
              
                  //)
                ],
              ),

              SizedBox(height: 20),

              //Horizontal List
              Container(
                height: 220,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.90),
                  itemCount: info.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () => Get.toNamed('/detail/', arguments: {
                        'title': info[i]['title'].toString(),
                        'text': info[i]['text'].toString(),
                        'name': info[i]['name'].toString(),
                        'prize': info[i]['prize'].toString(),
                        'time': info[i]['time'].toString(),
                      }),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width-20,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: i.isEven 
                            ? Color(0xFF69c5df)
                            : Color(0xFF9294cc)
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                //Title
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    info[i]['title'],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(child: Container())
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              info[i]['text'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFb8eefc)
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(thickness: 2),
                            //Images
                            Row(
                              children: [for(int i = 0; i < 4; i++)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2,
                                    vertical: 8,
                                  ),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            info[i]['img'],                              
                                          ),
                                          fit: BoxFit.cover
                                        ),                                  
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),

              SizedBox(height: 30),

              //Recent title
              Row(
                children: [
                  Text(
                    "Recente",
                    style: TextStyle(
                      fontSize: 20,
                      color:Color(0xFF1f2326),                       
                    ),
                  ),
                  Expanded(child: Container()),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(Colors.amber),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                    child: Text(
                      "Mostrar +",
                      style: TextStyle(
                        fontSize: 14,
                        color:Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  // Container(
                  //   width: 30,
                  //   height: 30,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //       color: Color(0xFFfdc33c)
                  //   ),
                  //   child: GestureDetector(
                  //   ),
                  // )
                ],
              ),

              SizedBox(height: 10),

              //Vertical List
              Expanded(
                child: ListView.builder(
                    //shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 6
                        ),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:Color(0xFFebf8fd),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius:30,
                                  backgroundImage: AssetImage(
                                      list[i]['img']
                                  ),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[i]['status'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:Color(0xFF3b3f42),                           
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: 170,
                                      child: Text(
                                        list[i]['text'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:Color(0xFF3b3f42),                             
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ]
                            ),
                          )
                        ),
                      );
                    }
                  )
                ),            

            ],
          ),
        ),
      ),
    );
  }
}