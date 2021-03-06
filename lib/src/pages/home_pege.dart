

import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';



import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvides=new PeliculasProvides();
  @override
  Widget build(BuildContext context) {

    peliculasProvides.getPopular();

    return Scaffold(
      appBar: AppBar(
        //centerTitle: false,
        title: Text('Peliculas en Cine'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

              showSearch(
                context: context,
                delegate: DataSearch(),
                
                );


            },
          )
        ],

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
          ],
        ),
      )

     /*  body: SafeArea(
        
        child: Text('Peliculas en cine'),

      ) */
      
      
    );
  }

  Widget _swiperTarjetas(){



    return FutureBuilder(
      future:peliculasProvides.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData){
          return CardSwiper( peliculas: snapshot.data ) ;
        }else{
          return Container(
            height: 400.0,
            child: Center(
              child:CircularProgressIndicator(),


            ),
          ) ;
           

        }
        
      },
    );

   // return Container();

  }

  Widget _footer( BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead)
            ),
          SizedBox(height: 5.0,),
          
           StreamBuilder(
            stream: peliculasProvides.popularesStream,


            
 
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //snapshot.data?.forEach((p)=>print(p.title));
              if(snapshot.hasData){
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvides.getPopular,
                  );
              }else{
             
                 return Center(child: CircularProgressIndicator());


              }
            },
          ), 
         // return Container();

        ],
      ),
    );
  }
}