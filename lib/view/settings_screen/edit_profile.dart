import 'dart:io';

import 'package:fresh_picks/controller/profile_control.dart';
import 'package:fresh_picks/widgets/bg_widget.dart';
import 'package:fresh_picks/widgets/custom_textfield.dart';
import 'package:fresh_picks/widgets/our_button.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {

  final dynamic data;
  final dynamic email;
  final dynamic number;
  final dynamic addres;
  const EditProfileScreen({super.key ,this.data , this.email ,this.number,this.addres});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
     
    

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: "Edit Prpfile".text.color(mainColor).fontFamily(semibold).make(),),
        body: Obx(()=>
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgnot,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(File(controller.profileImgPath.value) ,
                  width: 100,
                  fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourBoutton(
                  color: mainColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  title: "Change",
                  textcolor: whiteColor),
              const Divider(),
              20.heightBox,
              customTextField(hint: "Name", title: "Name", ispass: false ,controller: controller.nameController),
              customTextField(hint: passwordHint, title: password, ispass: true ,controller: controller.passController),
              20.heightBox,
              controller.isloading.value? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(mainColor),
              ): SizedBox(
                  width: double.infinity - 60,
                  child: ourBoutton(
                      color: mainColor,
                      onPress: () async {
                        controller.isloading(true);
                       await controller.uploadProfileImage();
                       await controller.updateProfile(
                        imgUrl: controller.profileImageLink,
                        name:controller. nameController.text,
                        password: controller.passController.text,
                        email: email,
                        addres: addres,
                        number: number,

                       );
                       //VxToast.show(context, msg: "Update");
                       Get.showSnackbar(
                           const   GetSnackBar(
                                
                                message:  'Change successfully.',
                                icon:   Icon(Icons.done),
                                backgroundColor: mainColor,
                                duration:  Duration(seconds: 4),
                              ),
                            );

                      },
                      textcolor: whiteColor,
                      title: "Save")),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 120, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    );
  }
}
