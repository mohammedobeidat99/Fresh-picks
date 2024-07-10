import 'package:flutter/material.dart';
import 'package:fresh_picks/consts/consts.dart';

Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  bool ispass = false,
  Icon  ? shapicon,
   
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(darkFontGrey).fontFamily(semibold).size(16).make(),
      SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Circular edges
          color: lightGrey,
        ),
        child: TextFormField(
          
          
          obscureText: ispass,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: hint,
            isDense: true,
            suffixIcon:shapicon ,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: secondaryColor),
            
              borderRadius: BorderRadius.circular(12), 
            ),
          ),
        ),
      ),
      SizedBox(height: 5),
    ],
  );
}
