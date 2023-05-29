import 'package:fresh_picks/consts/consts.dart';

Widget detailsCard({width, String? count ,String ?title}){
  return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
                5.heightBox,
                title!.text.color(darkFontGrey).make(),
              ],
            )
                .box
                .white
                .shadow
                .rounded
                .width(width)
                .padding(const EdgeInsets.all(4)).height(80)
                .make();
}