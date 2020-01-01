import 'package:geolocator/geolocator.dart';


class Location{

  double latitude;
  double longitude;


  Future<void> getCurrentPosition() async{
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print("The latitude is $latitude, and the longitude is $longitude");
    }
    catch(e){
      print(e);
    }
  }
}