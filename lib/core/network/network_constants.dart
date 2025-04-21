class NetworkConstants {
  static const String baseUrl = 'https://fakestoreapi.in/api';
  static const String productsEndpoint = '/products';

  static const Duration connectTimeout = Duration(seconds: 100);
  static const Duration receiveTimeout = Duration(seconds: 100);
  static const String contentType = 'application/json';
}
