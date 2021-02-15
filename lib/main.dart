import 'package:flutter/material.dart';

import 'package:peliculas/src/pages/home_pege.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(BuildContext contex)=>HomePage(),
        'detalle':(BuildContext contex)=>PeliculaDetalle()
      },
    );
  }
}