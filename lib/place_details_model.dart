
class PlaceDetails{
  String imageUrl;
  String name;
  String city;
  String phoneNumber;
  double longitude;
  double latitude;
  String description;
  double stars;
  String webUrl;

  static PlaceDetails fillSampleObject(){
    PlaceDetails placeDetails;
    placeDetails = PlaceDetails();
    placeDetails.name = "Lake of Egypt";
    placeDetails.description = "Lake of EgyptLake of EgyptLake of EgyptLake of EgyptLake of Egypt";
    placeDetails.imageUrl = "https://media.istockphoto.com/photos/salda-lake-burdur-turkey-aerial-view-photography-picture-id846841758";
    placeDetails.stars = 54;
    placeDetails.city = "Cairo";
    placeDetails.phoneNumber = "+905488784848";

    return placeDetails;
  }
}