import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';
import '../../controller/location_Control.dart';

class LocationScreen extends StatelessWidget {
  final LocationController _locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('Location Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  _locationController.currentLocation.value,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: Text('Get Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openMaps();
              },
              child: Text('Open Maps'),
            ),
          ],
        ),
      ),
    );
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _locationController.getLocationName(position);
    } catch (e) {
      print(e.toString());
    }
  }

  void _openMaps() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _locationController.openMapsApp(position);
    } catch (e) {
      print(e.toString());
    }
  }
}
