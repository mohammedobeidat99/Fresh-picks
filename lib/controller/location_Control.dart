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
}
