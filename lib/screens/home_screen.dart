import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_rest_api/movie_provider.dart';

import 'fav_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList= context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [

            ElevatedButton.icon(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavMovies(),));
            }, icon: Icon(Icons.favorite_sharp), label: Text("Go to my List (${myList.length})"),
            
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 24,horizontal: 10)
            ),),

            Expanded(
                child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final currentMovie = movies[index];
                return Card(
                  key: ValueKey(currentMovie.title),
                  color: Colors.blue,
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      currentMovie.title,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle:  Text( 
                      currentMovie.duration,
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: (){

                        if(!myList.contains(currentMovie)){

context.read<MovieProvider>().addToList(currentMovie);
                        }else{
context.read<MovieProvider>().removeFromList(currentMovie);
                        }
                      },
                      icon: Icon(Icons.favorite,color: myList.contains(currentMovie)?Colors.red:Colors.white,)),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
