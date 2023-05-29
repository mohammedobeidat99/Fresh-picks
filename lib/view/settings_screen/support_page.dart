import 'package:url_launcher/url_launcher.dart';

import '../../consts/consts.dart';




class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text(
          'Support',
          style: TextStyle(fontFamily: semibold, color: mainColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.support, size: 100, color: mainColor),
            const SizedBox(height: 16),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'If you have any questions or need assistance, please feel free to reach out to our customer support team.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: mainColor),
              label: 'Contact Support'.text.make(),
              icon: const Icon(Icons.phone),
              onPressed: () async {
                final Uri url=Uri(
                  scheme: 'tel',
                  path: "0772319071",


                );
                if (await canLaunchUrl(url)){
                await launchUrl(url);}
                else {
                  print('Error');
                }

              }

              



              
            ),

            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: mainColor),
              label: 'Contact Support'.text.make(),
              icon: const Icon(Icons.email),
              onPressed: ()async{
                      String email = Uri.encodeComponent("obeidatmohammed80@gmail.com");
                      String subject = Uri.encodeComponent("user frish picks");
                      String body = Uri.encodeComponent("Hey! I have a problem ..");
                      print(subject); //output: Hello%20Flutter
                      Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                          //email app opened
                          
                      }else{
                        print('Error');
                      }}
             

            ),
          ],
        ),
      ),
    );
  }

 
  
  
}

  



