abstract class BaseService {
  // final String BaseUrl = "http://13.235.205.112:4000/";
  final String BaseUrl = "http://192.168.1.7:4000/";

  Future<dynamic> loginUser(Map<String, dynamic> userData);

  Future<dynamic> registerUser(Map<String,dynamic> userRegisterData);


  Future<dynamic> getEventLocations();


  Future<dynamic> createEvent(Map<String,dynamic> createEventData);


  Future<dynamic> getUserEvents(Map<String,dynamic> getUserEvents);


  //EVENT-TYPE APIS ARE LISTED HERE.

  Future<dynamic> createEventTypeDecoration(Map<String,dynamic> createEventTypeDecoration);

  Future<dynamic> createEventTypeDJBand(Map<String,dynamic> createEventTypeDJBand);

  Future<dynamic> createEventTypeVenue(Map<String,dynamic> createEventTypeVenue);

  Future<dynamic> createEventTypeMakeup(Map<String,dynamic> createEventTypeMakeup);

  Future<dynamic> createEventTypeTravel(Map<String,dynamic> createEventTypeTravel);


  Future<dynamic> createEventTypePhotoVideo(Map<String,dynamic> createEventTypePhotoVideo);
  Future<dynamic> createEventTypeTentHouse(Map<String,dynamic> createEventTypeTentHouse);
  Future<dynamic> createEventTypeVarmala(Map<String,dynamic> createEventTypeVarmala);
  Future<dynamic> createEventTypePandit(Map<String,dynamic> creatEventTypePandit);
  Future<dynamic> createEventTypeCatering(Map<String,dynamic> createEventTypeCatering);
  Future<dynamic> createEventTypeWeddingDress(Map<String,dynamic> createEventTypeWeddingDress);


  Future<dynamic> createEventTypeDholWale(Map<String,dynamic> createEventTypeDholWale);
  Future<dynamic> createEventTypeBandWale(Map<String,dynamic> createEventTypeDholWale);
  Future<dynamic> createEventTypeEntertainment(Map<String,dynamic> createEventTypeDholWale);




  // CATERING, WEDDING-DRESS.

  Future<dynamic> getAllEventCategories();
  Future<dynamic> getUserEventsByCategory(Map<String,dynamic> getUserEventData);
  Future<dynamic> getUserEventsByName(Map<String,dynamic> getUserEventsByName);


  //Multipart-Related Api's
  Future<dynamic> uploadVenueImage(Map<String,dynamic> uploadVenueImageData);

  Future<dynamic> uploadDecorationImage(Map<String,dynamic> uploadDecorationImageData);

  Future<dynamic> uploadTenthouseImage(Map<String,dynamic> uploadTentHouseImage);


  Future<dynamic> uploadTravelImage(Map<String,dynamic> uploadTravelImage);


  Future<dynamic> uploadMakeupImage(Map<String,dynamic> uploadMakeupImage);


  Future<dynamic> uploadVarmalaImage(Map<String,dynamic> uploadVarmalaImage );

  Future<dynamic> uploadPhotoVideoImage(Map<String,dynamic> uploadPhotoVideoImage);

  Future<dynamic> uploadPanditImage(Map<String,dynamic> uploadPanditImage);
  Future<dynamic> uploadWeddingDressImage(Map<String,dynamic> uploadPanditImage);
  Future<dynamic> uploadCateringImage(Map<String,dynamic> uploadPanditImage);

  Future<dynamic> uploadBandImage(Map<String,dynamic> uploadPanditImage);
  Future<dynamic> uploadDholImage(Map<String,dynamic> uploadPanditImage);
  Future<dynamic> uploadEntertainmentImage(Map<String,dynamic> uploadPanditImage);

}