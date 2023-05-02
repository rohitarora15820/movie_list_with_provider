import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_rest_api/movie_provider.dart';
import 'package:provider_rest_api/screens/home_screen.dart';
import 'package:provider_rest_api/screens/sign_up_page.dart';
import 'package:provider_rest_api/services/data_class.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MovieProvider>(create: (context) => MovieProvider(),)
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Provider App",
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home:const  HomeScreen(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {


@override
  void initState() {
 
    super.initState();
    final postModel=Provider.of<DataClass>(context,listen: false);
    postModel.fetchData();
  }
  @override
  void dispose() {
 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
        final postModel=Provider.of<DataClass>(context);
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:const Text("Provider with api") ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignUpPage(),)
              );
            },
            child: ListTile(
              title: Text(postModel.posts?.title??''),
              subtitle: Text(postModel.posts?.body??''),
            ),
          )
        ],
      ),
    );
  }
}
