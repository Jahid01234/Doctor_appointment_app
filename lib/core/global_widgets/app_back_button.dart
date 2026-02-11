import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget{
  const AppBackButton ({super.key});


  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Icon(Icons.arrow_back),
    );
  }
}