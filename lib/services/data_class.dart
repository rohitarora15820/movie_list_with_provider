import 'package:flutter/material.dart';
import 'package:provider_rest_api/model/get_model.dart';
import 'package:provider_rest_api/model/signUp_model.dart';
import 'package:provider_rest_api/services/service.dart';
import 'package:http/http.dart' as http;

class DataClass extends ChangeNotifier{
  GetModel? posts;

  bool? loading=false;
  bool? postLoading=false;
  bool? isBack=false;

  fetchData()async{
    loading=true;
   posts=(await getPostData());
   loading=false;
   notifyListeners();
  }


 Future<void> postData(SignUpBody body)async{
  postLoading=true;
  notifyListeners();
  http.Response response=(await register(body))!;
  if(response.statusCode==200){
    isBack=true;
  }
  postLoading=false;
  notifyListeners();


 }

}