import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:async/async.dart';
import 'package:baru_nih/models/application/errors.dart';
import 'package:baru_nih/models/application/files.dart';
import 'package:baru_nih/models/application/user_location.dart';
import 'package:baru_nih/providers/auth.dart';
import 'package:baru_nih/utils/all_translate.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:http/http.dart' as http;
//import 'package:location/location.dart';
import 'package:path/path.dart';

Auth auth = new Auth();

class API {
  // LocationData _startLocation;
  // LocationData _currentLocation;

  // StreamSubscription<LocationData> _locationSubscription;

  // static final Random random = Random();

//  Location _locationService = new Location();
//  PermissionStatus _permission;


//  Future<UserLocation> getLocation() async {
//    await _locationService.changeSettings(
//        accuracy: LocationAccuracy.HIGH, interval: 1000);
//
//    LocationData location;
//    UserLocation userLocation = new UserLocation();
//
//    try {
//      bool serviceStatus = await _locationService.serviceEnabled();
//      print("Service status: $serviceStatus");
//      if (serviceStatus) {
//        _permission = await _locationService.requestPermission();
//        print("Permission: $_permission");
//        if (_permission == PermissionStatus.GRANTED) {
//          location = await _locationService.getLocation();
//
//          userLocation = new UserLocation(
//            latitude: location.latitude,
//            longitude: location.longitude,
//            speed: location.speed,
//          );
//
//          // _locationSubscription = _locationService
//          //     .onLocationChanged()
//          //     .listen((LocationData result) async {
//          //   userLocation = new UserLocation(
//          //     latitude: result.latitude,
//          //     longitude: result.longitude,
//          //     speed: result.speed,
//          //   );
//          // });
//        }
//      } else {
//        bool serviceStatusResult = await _locationService.requestService();
//        print("Service status activated after request: $serviceStatusResult");
//        if (serviceStatusResult) {
//          getLocation();
//        }
//      }
//    } on PlatformException catch (e) {
//      print(e);
//      if (e.code == 'PERMISSION_DENIED') {
//        error = e.message;
//      } else if (e.code == 'SERVICE_STATUS_ERROR') {
//        error = e.message;
//      }
//      location = null;
//    }
//
//    return userLocation;
//  }

//  Future<UserLocation> getLocationOLD() async {
//    // Location _location = new Location();
//    Map<String, dynamic> location;
//    UserLocation userLocation;
//
//    try {
//      if (_permission == PermissionStatus.GRANTED) {
//        // location = await _location.getLocation();
//        // print(location);
//
//        userLocation = new UserLocation(
//          latitude: location["latitude"],
//          longitude: location["longitude"],
//          speed: location["speed"],
//        );
//      }
//    } on PlatformException catch (e) {
//      print(e);
//      if (e.code == 'PERMISSION_DENIED') {
//        error = e.message;
//      } else if (e.code == 'SERVICE_STATUS_ERROR') {
//        error = e.message;
//      }
//      userLocation = null;
//    }
//
//    return userLocation;
//  }
  String error;

  static var client = new http.Client();

  Future<bool> giveDelay(int millisecond) async {
    // Simulate a future for response after x millisecond.
    return await new Future<bool>.delayed(
        new Duration(milliseconds: millisecond), () => new Random().nextBool());
  }

  Future<String> postUpdateLocation(UserLocation userLocation) async {
    var _url = BASE_URL + DRIVER_API_ENDPOINT + "locations";
    print("API { funtion: UpdateLocation , url POST: $_url }");
    return await http.post(
      _url,
      body: json.encode(userLocation.toJson()),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer " + await auth.getToken()
      },
    ).then((response) {
      // print(response.statusCode);
      if (response.statusCode < 200 || response.statusCode > 204) {
        // If that call was not successful, throw an error.
        throw response.body;
      } else {
        return response.body;
      }
    });
  }

  Future<String> uploadPhoto({int orderID, String image, String key}) async {
    var _url = BASE_URL + DRIVER_API_ENDPOINT + 'orders/$orderID/upload/photo';
    print(_url);
    // return _url;
    File file = File(image);

    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    // get file length
    var length = await file.length();

    // string to uri
    var uri = Uri.parse(_url);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(file.path));

    // add file to multipart
    request.files.add(multipartFile);

    // add headers to multipart
    request.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + await auth.getToken(),
    });

    // send
    var response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      return allTranslations.text("success_upload_photo");
    } else {
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
      throw allTranslations.text("error_upload_photo");
    }
  }

  Future<String> uploadSign({int orderID, String image, String key}) async {
    var _url = BASE_URL + DRIVER_API_ENDPOINT + 'orders/$orderID/upload/sign';
    print(_url);

    File file = File(image);

    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    // get file length
    var length = await file.length();

    // string to uri
    var uri = Uri.parse(_url);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(file.path));

    // add file to multipart
    request.files.add(multipartFile);

    // add headers to multipart
    request.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + await auth.getToken(),
    });

    // send
    var response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      return allTranslations.text("success_upload_sign");
    } else {
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
      throw allTranslations.text("error_upload_sign");
    }
  }

  Future<List<Files>> uploadAttachment(
      {int orderID, String image, String description}) async {
    var _url = BASE_URL + CUSTOMER_API_ENDPOINT + 'orders/$orderID/upload';
    print(_url);

    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + await auth.getToken()
      };

      var uri = Uri.parse(_url);
      var request = new http.MultipartRequest("POST", uri);
      request.headers.addAll(headers);

      request.fields['description'] = description;
      var multipartFile = await http.MultipartFile.fromPath("file", image);
      request.files.add(multipartFile);

      http.Response response =
      await http.Response.fromStream(await request.send());

      print("Result: ${response.body}");

      if (response.statusCode == 200) {
        // return Files.fromJson(json.decode(response.body));
        var res = json.decode(response.body);
        final data = res as List;
        // print(data);
        return data.map((rawPost) {
          return Files.fromJson(rawPost);
        }).toList();

        // return json.decode(response.body);
      } else {
        throw json.decode(response.body);
      }
    } catch (e) {
      print(e);
      throw e;
    } finally {}
  }

  Future<String> deleteAttachment({int orderID, int fileID}) async {
    var _url =
        BASE_URL + CUSTOMER_API_ENDPOINT + 'orders/$orderID/media/$fileID';
    print(_url);

    var client = new http.Client();

    try {
      final response = await client.delete(
        _url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + await auth.getToken()
        },
      );

      if (response.statusCode == 204) {
        print("File Deleted");
        return "File Deleted";
      } else {
        print(response.body);
        // throw Exception('error fetching data');
        throw ErrorModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      throw e;
    } finally {
      client.close();
    }
  }

  Future<Map> getAppVersion(String provider) async {
    var _url;

    _url = BASE_URL + "/api/versions/$provider";

    print("API { funtion: getAppVersion , url GET: $_url }");
    var client = new http.Client();
    try {
      final response = await client.get(
        _url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer " + await auth.getToken()
        },
      );

      return json.decode(response.body);
    } catch (e) {
      print(e);
      throw e;
    } finally {
      client.close();
    }
  }

  Future<String> getDownloadFileURL(int orderID, Files dataFile) async {
    var _url = BASE_URL +
        CUSTOMER_API_ENDPOINT +
        'orders/' +
        orderID.toString() +
        '/media/' +
        dataFile.id.toString() +
        '/download';

    // print(_url);
    var client = new http.Client();
    try {
      final fileURL = await client.get(
        _url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer " + await auth.getToken()
        },
      );

      if (fileURL.statusCode == 200) {
        return json.decode(fileURL.body)['url'];
      } else {
        throw json.decode(fileURL.body);
      }
    } catch (e) {
      // print(e);
      throw e;
    } finally {
      client.close();
    }
  }

  Future<String> changePassword(Map body) async {
    var _url = BASE_URL + "/api/password/reset";
    print("API { funtion: chagePassword , url POST: $_url }");

    var client = new http.Client();

    try {
      final response = await client.post(
        _url,
        body: json.encode(body),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + await auth.getToken()
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        print(response.body);
        throw json.decode(response.body);
      }
    } catch (e) {
      print(e);
      throw e;
    } finally {
      client.close();
    }
  }
}

final api = API();
