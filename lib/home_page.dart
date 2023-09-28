// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/content_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69c5df),
      body: Stack(
        children: [
          //Image background
          Positioned(
            child: Container(
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ) 
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                Text(
                  'Escolha o seu favorito',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white, 
                      fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30),
                //Subtitle
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  //width: double.infinity,
                  child: Text(
                    'Fazemos excelentes trabalhos acontecerem com\n nossos ótimos designers da comunidade',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 40),
                //Button
                Container(
                  width: 200,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFffbc33e),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0, 
                      backgroundColor: Color(0xFFfbc33e),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      )
                    ),
                    onPressed: () => Get.to(() => ContentPage()), 
                    child: Text(
                      'Comece agora',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: 70),
              ],
            )
          )
        ],
      ),
    );
  }
}