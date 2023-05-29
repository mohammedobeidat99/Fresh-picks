// import 'package:fresh_picks/widgets/home_button.dart';

// import '../../consts/consts.dart';
// import '../../consts/list.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//     Container(
      
//       padding: const EdgeInsets.all(5),
//       color: lightGrey,
//       width: context.screenWidth,
//       height: context.screenHeight,
//       child: Scaffold(      resizeToAvoidBottomInset: false,

//         body: ListView(children: [
//            SafeArea(
            
            
//               child: Column(
                
//             children: [
//               // Container(
//               //   height: 60,
//               //   alignment: Alignment.center,
//               //   color: lightGrey,
//               //   child: TextFormField(
//               //     decoration: const InputDecoration(
//               //       suffixIcon: Icon(
//               //         Icons.search,
//               //         color: Colors.grey,
//               //       ),
//               //       fillColor: whiteColor,
//               //       filled: true,
//               //       hintText: "Search",
//               //       hintStyle: TextStyle(
//               //         color: Colors.grey,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               VxSwiper.builder(
//                   aspectRatio: 16 / 9,
//                   height: 150,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   itemCount: SlidersList.length,
//                   itemBuilder: (context, index) {
//                     return Image.asset(
//                       SlidersList[index],
//                       fit: BoxFit.fill,
//                     )
//                         .box
//                         .rounded
//                         .clip(Clip.antiAlias)
//                         .margin(const EdgeInsets.symmetric(horizontal: 8))
//                         .make();
//                   }),
//               10.heightBox,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(
//                     2,
//                     (index) => homeButtons(
//                         height: context.screenHeight * 0.15,
//                         width: context.screenWidth / 2.5,
//                         icon: index == 0 ? icTodaysDeal : icFlashDeal,
//                         title: index == 0 ? "Today Deal" : "Flash Deal")),
//               ),
//               10.heightBox,
//               VxSwiper.builder(
//                   aspectRatio: 16 / 9,
//                   height: 150,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   itemCount: secondSlidersList.length,
//                   itemBuilder: (context, index) {
//                     return Image.asset(
//                       secondSlidersList[index],
//                       fit: BoxFit.fill,
//                     )
//                         .box
//                         .rounded
//                         .clip(Clip.antiAlias)
//                         .margin(const EdgeInsets.symmetric(horizontal: 8))
//                         .make();
//                   }),
//               20.heightBox,
//               Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(
//                     3,
//                     (index) => homeButtons(
//                           width: context.screenWidth / 3.5,
//                           height: context.screenHeight * 0.15,
//                           icon: index == 0
//                               ? icTopCategories
//                               : index == 1
//                                   ? icBrands
//                                   : icTopSeller,
//                           title: index == 0
//                               ? "Top Categories"
//                               : index == 1
//                                   ? "Brands"
//                                   : "Top Sellers",
//                         )),
//               ),
              
              
//             ],
//           )),
//         ]),
//       ),
//     );
//   }
// }
