import 'package:flutter/material.dart';

void showInSnackBar(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey,
    Map value, Color bgColor) {
  String msg;
  if (value != null) {
    // Map err = json.decode(value);
    Map err = value;

    msg = err['message'];

    if (err['errors'] != null) {
      // msg += '\n';
      var errors = err['errors'];
      for (final name in errors.keys) {
        final value = errors[name];
        print('$name: $value');
        msg += "\n";
        msg += '$name: \n$value';
      }
    }

    // if (err['errors'] != null) {
    //   if (err['errors']['nik_ktp'] != null)
    //     msg += "nik_ktp: " + err['errors']['nik_ktp'][0] + "\n";
    //   if (err['errors']['email'] != null)
    //     msg += "email: " + err['errors']['email'][0] + "\n";
    //   if (err['errors']['username'] != null)
    //     msg += "username: " + err['errors']['username'][0] + "\n";
    // }
    showSnackBar(context, _scaffoldKey, msg, bgColor);
  }
}

void showInSnackBarFiles(BuildContext context,
    GlobalKey<ScaffoldState> _scaffoldKey, Map value, Color bgColor) {
  String msg;
  if (value != null) {
    // Map err = json.decode(value);
    Map err = value;

    msg = err['message'];

    if (err['errors'] != null) {
      // msg += '\n';
      var errors = err['errors'];
      for (final name in errors.keys) {
        final value = errors[name];
        print('$name: $value');
        msg += "\n";
        msg += '$name: \n$value';
      }
    }

    // if (err['errors'] != null) {
    //   if (err['errors']['nik_ktp'] != null)
    //     msg += "nik_ktp: " + err['errors']['nik_ktp'][0] + "\n";
    //   if (err['errors']['email'] != null)
    //     msg += "email: " + err['errors']['email'][0] + "\n";
    //   if (err['errors']['username'] != null)
    //     msg += "username: " + err['errors']['username'][0] + "\n";
    // }
    showSnackBar(context, _scaffoldKey, msg, bgColor);
  }
}

void showInSnackBarString(BuildContext context,
    GlobalKey<ScaffoldState> _scaffoldKey, String value, Color bgColor) {
  showSnackBar(context, _scaffoldKey, value, bgColor);
}

void showSnackBar(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey,
    String value, Color bgColor) {
  FocusScope.of(context)?.requestFocus(FocusNode());
  _scaffoldKey.currentState?.removeCurrentSnackBar();
  _scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      value != null ? value : "",
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: bgColor ?? Colors.black,
    duration: Duration(seconds: 5),
    action: value != null
        ? SnackBarAction(
      label: 'OK',
      textColor: Colors.yellow,
      onPressed: () {
        //  Navigator.of(context).pop();
      },
    )
        : null,
  ));
}

String getExtensionFile(String fileName) {
  String ext = "";
  switch (fileName.substring(fileName.lastIndexOf("."))) {
  // switch (mime(fileName)) {
  // case "text/plain":
    case ".txt":
      ext = "TXT";
      break;
  // case "application/msword":
    case ".doc":
      ext = "DOC";
      break;
  // case "application/vnd.openxmlformats-officedocument.wordprocessingml.document":
    case ".docx":
      ext = "DOC";
      break;
  // case "text/csv":
    case ".csv":
      ext = "CSV";
      break;
  // case "image/jpg":
    case ".jpg":
      ext = "JPG";
      break;
  // case "image/jpeg":
    case ".jpeg":
      ext = "JPG";
      break;
  // case "image/png":
    case ".png":
      ext = "PNG";
      break;
  // case "application/vnd.ms-excel":
    case ".xls":
      ext = "XLS";
      break;
  // case "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet":
    case ".xlsx":
      ext = "XLS";
      break;
  // case "application/pdf":
    case ".pdf":
      ext = "PDF";
      break;
    default:
      ext = "TXT";
      break;
  }
  return ext;
}

String getExtensionColor(String namaFile) {
  String ext = "";
  switch (namaFile.substring(namaFile.lastIndexOf("."))) {
    case ".txt":
      ext = "10";
      break;
    case ".doc":
      ext = "3";
      break;
    case ".docx":
      ext = "3";
      break;
    case ".csv":
      ext = "1";
      break;
    case ".jpg":
      ext = "6";
      break;
    case ".jpeg":
      ext = "6";
      break;
    case ".png":
      ext = "7";
      break;
    case ".xls":
      ext = "8";
      break;
    case ".xlsx":
      ext = "8";
      break;
    case ".pdf":
      ext = "9";
      break;
    default:
      ext = "10";
      break;
  }
  return ext;
}
