abstract class BaseService {
  final String BaseUrl = "http://13.235.205.112:4000/";

  Future<dynamic> loginUser(Map<String, dynamic> userData);

  Future<dynamic> registerUser(Map<String,dynamic> userRegisterData);


  Future<dynamic> getEventLocations();


  Future<dynamic> createEvent(Map<String,dynamic> createEventData);

  Future<dynamic> createEventTypeVenue(Map<String,dynamic> createEventTypeVenue);





}