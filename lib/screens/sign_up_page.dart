import 'package:flutter/material.dart';

import 'package:provider_rest_api/model/signUp_model.dart';
import 'package:provider/provider.dart';
import 'package:provider_rest_api/services/data_class.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var nameController=TextEditingController();
    var passwordController=TextEditingController();
    var phoneController=TextEditingController();

    Future<void> registration()async{
      String name=nameController.text.trim();
      String email=emailController.text.trim();
      String phone=phoneController.text.trim();
      String password=passwordController.text.trim();
      SignUpBody signUpBody=SignUpBody(name: name,
      email: email,
      password: password,
      phone: phone
      );
     var provides= Provider.of<DataClass>(context,listen: false);
     await provides.postData(signUpBody);
     if(provides.isBack!){
print("Successfully registered");
     }

      


    }
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: ()async{
     String name=nameController.text.trim();
      String email=emailController.text.trim();
      String phone=phoneController.text.trim();
      String password=passwordController.text.trim();
      SignUpBody signUpBody=SignUpBody(name: name,
      email: email,
      password: password,
      phone: phone
      );
      print(signUpBody.email);
     var provides= Provider.of<DataClass>(context,listen: false);
     await provides.postData(signUpBody);
     if(provides.isBack!){
print("Successfully registered");
     }
      },
      child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title:const Text("Sign Up") ,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Name"
            ),
          
          ),
          TextFormField(controller: passwordController,    decoration:const  InputDecoration(
              labelText: "Password"
            )),
          TextFormField(controller: phoneController,    decoration:const InputDecoration(
              labelText: "Phone Number"
            )),
          TextFormField(controller: emailController,    decoration:const InputDecoration(
              labelText: "Email Address"
            ))
        ],
      ),
    );
  }
}