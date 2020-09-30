// import 'package:dio/dio.dart';
import 'package:baru_nih/providers/auth.dart';
import 'package:logging/logging.dart';

class OrderApiProvider {
  final Auth auth = new Auth();
  // final String _apiEndpoint = "orders";
  final Logger log = new Logger('OrderApiProvider');
  // final Dio _dio = Dio();

  static final OrderApiProvider _instance = OrderApiProvider._internal();

  OrderApiProvider._internal() {
    // setupInterceptors();
  }

  factory OrderApiProvider() {
    return _instance;
  }

  // Uri buildUri(String endpoint, double latitude, double longitude) {
  //   return Uri(
  //       scheme: "https",
  //       host: _apiBaseUrl,
  //       path: "$_apiPath$endpoint",
  //       queryParameters: {
  //         "lat": latitude.toString(),
  //         "lon": longitude.toString(),
  //         "apiKey": ApplicationConfig.apiKey,
  //         "units": "metric"
  //       });
  // }

  // Future<WeatherForecastListResponse> fetchWeatherForecast(
  //     double latitude, double longitude) async {
  //   try {
  //     Uri uri = buildUri(_apiWeatherForecastEndpoint, latitude, longitude);
  //     Response response = await _dio.get(uri.toString());
  //     if (response.statusCode == 200) {
  //       return WeatherForecastListResponse.fromJson(response.data);
  //     } else {
  //       return WeatherForecastListResponse.withErrorCode(
  //           ApplicationError.apiError);
  //     }
  //   } catch (exc) {
  //     _logger.log(Level.INFO, "Exception occured: " + exc.toString());
  //     return WeatherForecastListResponse.withErrorCode(
  //         ApplicationError.connectionError);
  //   }
  // }

  // void setupInterceptors() {
  //   int maxCharactersPerLine = 200;

  //   _dio.interceptor.request.onSend = (Options options) async {
  //     options.headers["Accept"] = "application/json";
  //     options.headers["Content-Type"] = "application/json";
  //     options.headers["Authorization"] = "Bearer " + await auth.getToken();
  //     // log.fine("--> ${options.method} ${options.path}");
  //     // log.fine("Content type: ${options.contentType}");
  //     // log.fine("<-- END HTTP");
  //     return options;
  //   };

  //   _dio.interceptor.response.onSuccess = (Response response) {
  //     // log.fine(
  //     //     "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
  //     String responseAsString = response.data.toString();
  //     if (responseAsString.length > maxCharactersPerLine) {
  //       int iterations =
  //           (responseAsString.length / maxCharactersPerLine).floor();
  //       for (int i = 0; i <= iterations; i++) {
  //         int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
  //         if (endingIndex > responseAsString.length) {
  //           endingIndex = responseAsString.length;
  //         }
  //         log.fine(responseAsString.substring(
  //             i * maxCharactersPerLine, endingIndex));
  //       }
  //     } else {
  //       log.fine(response.data);
  //     }
  //     // log.fine("<-- END HTTP");
  //   };
  // }
}
