abstract class BaseService {
  final String BaseUrl = "http://13.235.205.112:9999/megma-trading/";

  Future<dynamic> loginUser(Map<String, dynamic> userData);

}