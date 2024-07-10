import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_picks/consts/firebase_const.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationController extends GetxController {
  RxString currentLocation = ''.obs;

  void getLocationName(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String name = placemark.name ?? '';
        String locality = placemark.locality ?? '';
        String adminArea = placemark.administrativeArea ?? '';
        String country = placemark.country ?? '';
        currentLocation.value = '$name, $locality, $adminArea, $country';
      } else {
        currentLocation.value = 'Location name not found';
      }
    } catch (e) {
      currentLocation.value = 'Error retrieving location name';
      print(e.toString());
    }
  }

  void openMapsApp(Position position) async {
    String mapsUrl = 'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';
    if (await canLaunch(mapsUrl)) {
      await launch(mapsUrl);
    } else {
      print('Could not launch maps');
    }
  }

  void uploadToFirestore(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String name = placemark.name ?? '';
        String locality = placemark.locality ?? '';
        String adminArea = placemark.administrativeArea ?? '';
        String country = placemark.country ?? '';

       // Create a Firestore document reference for users collection
        DocumentReference userRef =
            FirebaseFirestore.instance.collection('location').doc();

        

        // Set the data for the user document
        await userRef.set({
          'name user': currntUser!.uid,
          'locality': locality,
          'adminArea': adminArea,
          'country': country,
          'latitude': position.latitude,
          'longitude': position.longitude,
          
        });
//
        print('User location uploaded to Firestore');

      //  // Create a new collection for the user's location
      //   CollectionReference locationCollection =
      //       userRef.collection('location');

      //   // Set the data for the location collection document
      //   await locationCollection.add({
      //     'timestamp': DateTime.now(),
      //     'additionalField': 'Some additional data',
      //   });

        print('Location collection created and data uploaded');
      } else {
        print('Location name not found');
      }
    } catch (e) {
      print('Error uploading user location to Firestore');
      print(e.toString());
    }
  }
}


