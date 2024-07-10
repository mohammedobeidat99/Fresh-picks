
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:fresh_picks/consts/consts.dart';
import 'package:fresh_picks/consts/firebase_const.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;
  var nameController= TextEditingController();
  var passController= TextEditingController();
  var numberControler=TextEditingController();
  
  var profileImageLink='';
  var isloading =false.obs;

  changeImage(context) async {
    final img = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);
    try {
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
  uploadProfileImage() async {
    var filename= (profileImgPath.value);
    var destintion = 'images/${currntUser!.uid}/$filename';
     Reference ref=FirebaseStorage.instance.ref().child(destintion);
     await ref.putFile(File(profileImgPath.value));
     profileImageLink=await ref.getDownloadURL();

  }
  updateProfile({name,password,imgUrl,id ,email ,number,addres}) async {
    var store =firestore.collection(usersCollection).doc(currntUser!.uid);
    await store.update({'name':name,'password':password,'imageUrl':imgUrl,} ,);
    isloading(false);
    
  }

  
    
  




}