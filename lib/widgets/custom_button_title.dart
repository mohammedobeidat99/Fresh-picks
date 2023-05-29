import 'package:fresh_picks/consts/consts.dart';

Widget customTitle({String? title, i, onPress}) {
  return ListTile(
    title: title!.text.fontFamily(bold).color(mainColor).make(),
    trailing: IconButton(
      icon: i,
      onPressed: onPress,
    ),
    
  );
 
}
