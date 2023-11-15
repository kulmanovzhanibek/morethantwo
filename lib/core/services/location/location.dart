import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@injectable
class LocationService {
  static Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  void requestService() async {
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

  void requestPermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void getLocation() async {
    _locationData = await location.getLocation();
  }

  bool get serviceEnabled => _serviceEnabled;
  PermissionStatus get permissionGranted  => _permissionGranted;
  LocationData get locationData => _locationData;

}