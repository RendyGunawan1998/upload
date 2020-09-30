import 'package:baru_nih/utils/all_translate.dart';

class ErrorModel {
  int code;
  String message;

  ErrorModel.fromJson(Map<String, dynamic> jsonMap)
      : code = jsonMap["status"] == null ? 404 : jsonMap["status"],
        message = jsonMap["message"] == null
            ? allTranslations.text("something_went_wrong")
            : jsonMap["message"];
}
