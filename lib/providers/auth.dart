import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:baru_nih/models/application/user_info.dart';
import 'package:baru_nih/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' show Client;

abstract class BaseAuth {
  Future<bool> giveDelay(int second);
  Future<String> cekLogin(String provider, String email, String password);
  Future<String> login(String email, String password);
  Future<String> getAccountInfo();
  Future<void> saveoAuthToken(String accessToken);
  Future<String> getoAuthData();
  Future<String> getToken();
  Future<void> deloAuthToken();
  Future<void> saveUserData(String userData);
  Future<UserInfo> getUserData();
  Future<void> delUserData();
  Future<void> saveUserMode(String userData);
  Future<String> getUserMode();
  Future<void> delUserMode();
  Future<void> signOut();
  Future<void> forceSignOut();
}

class Auth implements BaseAuth {
  Client client = Client();

  getProvider(String provider) {
    return provider == "customer" ? CUSTOMER_API_ENDPOINT : COMMON_API_ENDPOINT;
  }

  getClientID(String provider) {
    return provider == "customer" ? CLIENT_ID_CUSTOMER : CLIENT_ID_CUSTOMER;
  }

  getClientSecret(String provider) {
    return provider == "customer"
        ? CLIENT_SECRET_CUSTOMER
        : CLIENT_SECRET_CUSTOMER;
  }

  getProviderForLogin(String provider) {
    return provider == "customer" ? "customers" : "receivers";
  }

  Future<bool> giveDelay(int milliseconds) async {
    // Simulate a future for response after 2 second.
    return await new Future<bool>.delayed(
        new Duration(milliseconds: milliseconds),
            () => new Random().nextBool());
  }

  Future<String> cekLogin(
      String provider, String email, String password) async {
    //get ceklogin

    var _provider = getProvider(provider);
    var _url =
        BASE_URL + _provider + "status/" + email + "/" + getClientID(provider);
    print("cekLogin API GET: $_url");

    return await client.get(_url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    }).then((response) {
      // print(response.body.toString());
      if (response.statusCode < 200 || response.statusCode > 204) {
        // If that call was not successful, throw an error.
        throw response;
      } else {
        // If the call to the server was successful, parse the JSON
        return response.body;
      }
    });
  }

  Future<String> login(String email, String password) async {
    //post login
    var _body = {
      'email': email.replaceAll(new RegExp(r"\s+\b|\b\s"), ""),
      'password': password.replaceAll(new RegExp(r"\s+\b|\b\s"), ""),
    };

    print(json.encode(_body));

    var _url = LOGIN_ENDPOINT;
    print("login API POST: $_url");

    final response =
    await client.post(_url, body: json.encode(_body), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    client.close();

    if (response.statusCode == 200) {
      // save TOKEN to localstorage
      saveoAuthToken(response.body);
      return response.body;
    } else {
      throw json.decode(response.body);
    }
  }

  Future<String> getAccountInfo() async {
    var _url = BASE_URL + "/api/user";
    print("getAccountInfo API GET: $_url");

    return await client.get(_url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + await getToken()
    }).then((response) {
      // print(response.statusCode);
      if (response.statusCode < 200 || response.statusCode > 204) {
        // If that call was not successful, throw an error.
        throw response;
      } else {
        // save AccountInfo to localstorage
        saveUserData(response.body);
        // save UserMode to localstorage
        saveUserMode(response.body);
        // If the call to the server was successful, parse the JSON
        return response.body;
      }
    });
  }

  Future<void> saveoAuthToken(String accessToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(APP_OAUTHDATA_KEY, accessToken);
  }

  Future<String> getoAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = sharedPreferences.getString(APP_OAUTHDATA_KEY);
    return data;
  }

  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var data = sharedPreferences.getString(APP_OAUTHDATA_KEY);
    var token = json.decode(data).cast<String, dynamic>();
    return token['access_token'];
  }

  Future<void> deloAuthToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(APP_OAUTHDATA_KEY);
  }

  Future<void> saveUserData(String userData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(APP_USERDATA_KEY, userData);
  }

  Future<UserInfo> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences.getString(APP_USERDATA_KEY);
    // return Future.delayed(Duration(seconds: 1), () {
    //   return fromJson(user);
    // });
    return fromJson(user);
  }

  Future<void> delUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(APP_USERDATA_KEY);
  }

  Future<void> saveUserMode(String userData) async {
    var data = json.decode(userData).cast<String, dynamic>();
    var provider = data['provider'] == "customers" ? "customer" : "user";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(APP_USERMODE_KEY, provider);
  }

  Future<String> getUserMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userMode = sharedPreferences.getString(APP_USERMODE_KEY);
    return userMode;
  }

  Future<void> delUserMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(APP_USERMODE_KEY);
  }

  Future<void> signOut() async {
    var _url = BASE_URL + "/api/logout";
    print("signOut API POST: $_url");

    return await client.post(_url, body: {}, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer " + await getToken()
    }).then((response) {
      // print(response.statusCode);
      if (response.statusCode != 200) {
        // If that call was not successful, throw an error.
        throw response;
      } else {
        // If the call to the server was successful, parse the JSON
        // return response.body;
        // deloAuthToken().then((res) {
        //   delUserData().then((res) {
        //     return true;
        //   });
        // });
        forceSignOut();
      }
    });
  }

  Future<void> forceSignOut() async {
    try {
      await deloAuthToken();
      await delUserData();
      await delUserMode();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
