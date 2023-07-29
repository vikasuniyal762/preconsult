import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';


final PCLocationController locationController = Get.find<PCLocationController>();

class PCLocationController extends GetxController {
  double? latitude = 0.00, longitude = 0.00;

  String address = '';
  String pincode = '';
  String district = '';
  String state = '';

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 0,
  );

  getLocationPermission() async {
    var permission = await Permission.locationWhenInUse.request();
    if (permission.isGranted) {
      getCurrentCoordinates();
    } else {
      address = '';
      update();
    }
    update();
  }

  Future<void> getCurrentCoordinates() async {
    Geolocator.getCurrentPosition().then((Position? position) {
      latitude = position?.latitude;
      longitude = position?.longitude;
    }).catchError((err) {
      address = 'The Location is disabled';
    });
    update();
  }

}
