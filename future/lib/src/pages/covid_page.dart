

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:future/models/educacion_model.dart';
//import 'package:future/models/resCovid_model.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

Future getCovid() async {

//https://www.datos.gov.co/resource/jbae-zuaf.json
 final resp= await http.get('https://www.datos.gov.co/resource/x6fr-8sf5.json');
 return resp.body;
 
}

class CovidPage extends StatelessWidget {
  static const routeName = 'covid';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Chocó'),
      ),
      body: FutureBuilder(
        future: getCovid(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
            child:CircularProgressIndicator() ,
          ) ;
          }else{
            return _ListaCiudades(snapshot.data);
           
          }
          /* print(snapshot.connectionState);

          return Center(child:CircularProgressIndicator() ); */
        },
      ),
    );
  }
}

class _ListaCiudades extends StatelessWidget {

  final ciudades;

  

  const _ListaCiudades(this.ciudades);


  @override
  Widget build(BuildContext context) {

    final rnd=new Random();
    final r=rnd.nextInt(255);
    final g=rnd.nextInt(255);
    final b=rnd.nextInt(255);

    return ListView.builder(
      
      itemCount: ciudades.length,
      itemBuilder: (BuildContext context, int i) { 

      List data=json.decode(ciudades);
      return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(r, g, b, 1)
        ),
    
        child: ListTile(         
        leading:Icon(Icons.add_alert,color: Colors.green,),
        title: Text('Ciudad: ${data[i]['ciudad_de_ubicaci_n']}'),
        subtitle: Text('Atención: ${data[i]['atenci_n']}\nFecha: ${data[i]['fecha_de_notificaci_n']}'),
        trailing: Text('Estado: ${data[i]['estado']}'),
        isThreeLine: true,
        dense: true,
            //: Image.network(usuario.avatar),
        onTap: (){
          //Navigator.pushNamed(context,PaginaPrueba.routeName, arguments:usuario);
        },
        ),
      );


     },);
  }
}