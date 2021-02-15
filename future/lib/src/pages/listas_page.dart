import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future getCovid() async {

//https://www.datos.gov.co/resource/jbae-zuaf.json
 final resp= await http.get('https://www.datos.gov.co/resource/x6fr-8sf5.json');
 return resp.body;
 
}


class ListaPrueba extends StatelessWidget {
  static const routeName = 'lista';
  @override
  Widget build(BuildContext context) {

    
final List<Widget> items = List.generate(50, (i)=>null);

    return Scaffold(
      body: FutureBuilder(
        future: getCovid(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
        
        if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
            child:CircularProgressIndicator() ,
          ) ;
          }else{
            return CustomScrollView(
              slivers: <Widget>[
            /* SliverAppBar(
              title: Text('SliverList'),
            ), */

            /* SliverGrid.count(
              crossAxisCount:6,
              children: items,
            ), */

            /* SliverGrid.extent(
              maxCrossAxisExtent: 90,
              children: items,
            ), */

           /*  SliverAppBar(
              title: Text('SliverList okkkkk'),
              pinned: true,
            ), */
            
            
              SliverList(
                delegate: SliverChildBuilderDelegate((context,i){
                  return Rectangulo(i,snapshot.data);
                },
                childCount: items.length
                ),
              )
          ],
        );
           
          }

        
              
            },
      
      )
    );
  }
}


class Rectangulo extends StatelessWidget {

  final int index;
  final datos;

  const Rectangulo(this.index,this.datos);
  @override
  Widget build(BuildContext context) {

    final rnd=new Random();
    final r=rnd.nextInt(255);
    final g=rnd.nextInt(255);
    final b=rnd.nextInt(255);

    List data=json.decode(datos);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
        child: Row(
         
          children: <Widget>[
          Icon(Icons.add_alert,color: Colors.white,),
           Expanded(
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Ciudad: ${data[index]['ciudad_de_ubicaci_n']}',style: TextStyle(color: Colors.white,fontSize: 20.0)),
                    SizedBox(height: 7.0,),
                    Text('Atención: ${data[index]['atenci_n']}',style: TextStyle(color: Colors.white,fontSize: 15.0)),
                    SizedBox(height: 7.0,),
                    Text('Fecha: ${data[index]['fecha_de_notificaci_n']}',style: TextStyle(color: Colors.white,fontSize: 15.0)) ,
                    SizedBox(height: 7.0,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      
                      Text('Edad: ${data[index]['edad']}',style: TextStyle(color: Colors.white,fontSize: 15.0)) ,   
                      Text('Sexo: ${data[index]['sexo']}',style: TextStyle(color: Colors.white,fontSize: 15.0)) ,
                    ],),
                    
                    
                    
                  
                  ],
                  
                ),
           ),
           Text('${data[index]['estado']}',style: TextStyle(color: Colors.white,fontSize: 15.0)) ,
          
            
            

          ],
        ),
      
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromRGBO(r,g , b, 1.5)
        ),
    
    );
  }
}

/* Text('Ciudad: ${data[index]['ciudad_de_ubicaci_n']}',style: TextStyle(color: Colors.white,fontSize: 15.0)),
              Text('Critico',style: TextStyle(color: Colors.red,fontSize: 25.0)) 
              Text('Atención: ${data[index]['atenci_n']}\nFecha: ${data[index]['fecha_de_notificaci_n']}'),*/