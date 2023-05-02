import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../movie_provider.dart';

class FavMovies extends StatefulWidget {
  const FavMovies({super.key});

  @override
  State<FavMovies> createState() => _FavMoviesState();
}

class _FavMoviesState extends State<FavMovies> {
  @override
  Widget build(BuildContext context) {
        var myList= context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("My List(${myList.length})"),
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
        final currentMovie=myList[index];
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
                    trailing: GestureDetector(
                      onTap: (){
                        context.read<MovieProvider>().removeFromList(currentMovie);
                      },
                      child: Text("Remove",style: TextStyle(color:Colors.red),)),
//                
                  ),
                );
      },),
    );
  }
}