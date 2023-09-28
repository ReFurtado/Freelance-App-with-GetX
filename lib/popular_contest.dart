// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PopularContest extends StatefulWidget {
  const PopularContest({super.key});

  @override
  State<PopularContest> createState() => _PopularContestState();
}

class _PopularContestState extends State<PopularContest> {

  //Loading JSON data to interface.
  List info = [];

  _realData() async {
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

      //Appbar
      appBar: AppBar(
        backgroundColor: Color(0xFF69c5df),  
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(), 
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white 
          ), 
        ),
        title: Text(
          'Populares',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20
                  ),
                  child: Column(
                    children: [
                      for (int i = 0; i < info.length; i++)
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 20
                        ),
                        child: Container(
                          height: 220,
                          child: GestureDetector(
                                onTap: () => Get.toNamed('/detail/', arguments: {
                                  'title': info[i]['title'].toString(),
                                  'text': info[i]['text'].toString(),
                                  'name': info[i]['name'].toString(),
                                  'prize': info[i]['prize'].toString(),
                                  'time': info[i]['time'].toString(),
                                }),
                                child: Container(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  width: MediaQuery.of(context).size.width,
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
                              
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}