import 'package:fresh_picks/widgets/bg_widget.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

import '../../models/category.dart';
import '../../models/product .dart';
import 'item_details.dart';

class CategoryDetails extends StatelessWidget {
  
   final Category category;

  const CategoryDetails(this.category);

  
  

  @override
  Widget build(BuildContext context) {
    
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: category.name.text.fontFamily(bold).color(redColor).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              
              20.heightBox,
              Expanded(
                  child: GridView.builder(
                    
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                 itemCount: category.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 250, mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  Product product = category.products[index];
                 
                

                 return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: 200,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          product.image == null ? imgnot : product.image!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    ),
    SizedBox(height: 10),
    Text(
      product.name,
      style: TextStyle(
        color: mainColor,
        fontFamily: bold,
        fontSize: 16,
      ),
    ),
    SizedBox(height: 10),
    Text(
      "${product.price}\$",
      style: TextStyle(
        color: redColor,
        fontFamily: semibold,
      ),
    ),
  ],
)
.box
.white
.margin(const EdgeInsets.symmetric(horizontal: 4))
.roundedSM
.outerShadow
.padding(const EdgeInsets.all(12))
.make()
.onTap(() {
  Get.to(() => ItemDetails(product));
});

                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

/*
SingleChildScrollView(
                
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                  5,
                   
                    (index) => "Baby Clothing "
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .size(150, 60)
                        .rounded
                        .margin(EdgeInsets.symmetric(horizontal: 5))
                        .make(),
                  ),
                ),
              ),
*/