import 'package:get/get.dart';

import '../../consts/consts.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('About'.tr ,style: TextStyle(color: mainColor ,fontFamily: semibold),),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Snapshop App'.tr,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We, the Snapshop application, offer the lowest prices for products in Jordan, such as Amman, Irbid, and the surrounding areas'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Our Mission:'.tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Delivering high quality products at the lowest prices, ensuring the best quality and customer satisfaction.'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
