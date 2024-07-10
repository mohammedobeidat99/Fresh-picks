import 'package:fresh_picks/consts/consts.dart';

Widget ourButton({color, textcolor, String? title, onPress}) {
  return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12)
      ),
      width: double.infinity,
      child: TextButton(
        onPressed: onPress,
        child: Text(title! , style: TextStyle(color: textcolor ,fontWeight: FontWeight.bold ,fontSize: 16,fontFamily: 'dms_reguler'),),
      ));

  //.white.fontFamily(bold).make());
}
