import 'package:fresh_picks/consts/consts.dart';

Widget customTextField( {String ?title ,String? hint, controller ,  ispass} ){
  return Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    title!.text.color(mainColor).fontFamily(semibold).size(16).make(),
   5.heightBox,
   TextFormField(
    obscureText: ispass,
    controller: controller,
    decoration: InputDecoration(
      hintStyle: const TextStyle(
        fontFamily: semibold,
        color: textfieldGrey,
      ),
      hintText: hint,
      isDense: true,
      fillColor: lightGrey,
      filled: true,border: InputBorder.none,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: mainColor)
      )
    ),
   ),
   5.heightBox,
    


  ],);
}