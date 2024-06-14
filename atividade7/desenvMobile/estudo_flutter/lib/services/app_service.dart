import 'package:estudo_flutter/app/models/form_model.dart';

class AppService{
  static final AppService _instance = AppService._internal();
  FormModel formModel = FormModel();
  List<FormModel> listFormModel = [];

  factory AppService() {
    return _instance;
  }

  AppService._internal();
}