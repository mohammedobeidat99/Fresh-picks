import '../consts/consts.dart';

Widget applogoWidget(){
return  Container(
          width: 120, // Set the desired width
          height: 120, // Set the desired height
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Make the container circular
            color: Colors.grey[200], // Set the background color of the container
          ),
          child: ClipOval(
            child: Image.asset(
              Logoapp, // Replace with your image path
              fit: BoxFit.cover, // Adjust the image fit
            ),
          ),
        
      
    );


  // return Container(

    
  //   child: Image.asset(
    
    
  //   icAppLogo,width: 100,)).box
  //                 .white
  //                 .roundedSM

  //                 .shadow3xl.make();

}