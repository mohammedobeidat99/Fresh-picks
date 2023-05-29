import 'package:fresh_picks/consts/consts.dart';

Widget ourBoutton( {color, textcolor,String? title ,onPress} ){
  
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(12),
      ),
      onPressed: onPress,
      
       
      
      child: title!.text.fontFamily(bold).color(textcolor).make() ,
      
      );
      
      //.white.fontFamily(bold).make());
}
