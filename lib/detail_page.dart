// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void, library_private_types_in_public_api, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/content_page.dart';
import 'package:get/get.dart';

import 'detail_controller.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  //Loading JSON data to interface.
  List imgs = [];

  _realData() async {
    await DefaultAssetBundle.of(context).loadString('assets/json/img.json').then((s) {
      setState(() {
        imgs=json.decode(s);
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
    int _currentIndex  = 0;

    //Message
    final DetailController favorite = Get.put(DetailController());

    return Scaffold(

      //Back button
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.to(() => ContentPage()),
          icon: Icon(
            Icons.home_filled,
            color: Color(0xFF69c5df),   
          ), 
        ),
        backgroundColor: Color(0xFFc5e5f3),
      ),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10
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

              //Info
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFfcfffe),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //Title
                          Text(
                            Get.arguments['title'],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      //Subtitle
                      Text(
                         Get.arguments['text'],
                        style: TextStyle(
                          fontSize: 20,
                          color:Color(0xFFb8b8b8)
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(thickness: 1.0,),
                      SizedBox(height: 10,),
                      //Categories
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.watch_later,
                                color:Color(0xFF69c5df),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Get.arguments['name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color:Color(0xFF303030),              
                                    ),
                                  ),
                                  Text("Prazo",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:Color(0xFFacacac)
                                    ),
                                  )
                                ],
                              )
                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.monetization_on,
                                  color:Color(0xFFfb8483)),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Get.arguments['prize'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:Color(0xFF303030),
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text("Preço",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:Color(0xFFacacac)
                                    ),
                                  )
                                ],
                              )
                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star,
                                  color:Color(0xFFfbc33e)),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Top Level",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:Color(0xFF303030),
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text("2",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:Color(0xFFacacac)
                                    ),
                                  )
                                ],
                              )
                            ],)
                        ],
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              //Popular title
              Row(
                children: [
                  Text(
                    "Total de participantes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color:Color(0xFF1f2326),                       
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "(12)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color:Color(0xFFfb8483)                      
                    ),
                  ), 
                ],
              ),

              SizedBox(height: 20),

              //Users
              Row(
                children: [
                  for(int i = 0; i < imgs.length; i++)
                  Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(
                          imgs[i]['img'],
                        ),
                      ),
                  ),
                ],
              ),          
    
              SizedBox(height: 40),

              //favourite
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Color(0xFFfbc33e)
                    ),
                    child: IconButton(
                      onPressed: () => favorite.favCounter(),
                      icon: Icon(
                        Icons.favorite_border,
                        color:Colors.white
                      ),
                    )
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Adicione aos favoritos",
                    style: TextStyle(   
                      fontSize: 16,
                      color:Color(0xFF1f2326), 
                    ),
                  )
                ],
              ),
                 //))
            ],
          ),
        ),
      ),
    );
  }
}