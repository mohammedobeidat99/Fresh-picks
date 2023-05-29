import '../../consts/consts.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('About' ,style: TextStyle(color: mainColor ,fontFamily: semibold),),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Fresh Picks App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We are an Fresh Picksapp specializing in providing high-quality fruits and vegetables to our customers.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Our Mission:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'To deliver fresh and healthy produce directly from farms to your doorstep, ensuring the best quality and customer satisfaction.',
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
