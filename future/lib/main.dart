

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:future/src/pages/covid_page.dart';
import 'package:future/src/pages/listas_page.dart';

import 'package:http/http.dart' as http;
 
import 'package:future/models/reqres_model.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Future',
      home: ListaPrueba(),
      routes: {
      PaginaPrueba.routeName: (context) => PaginaPrueba(),
      CovidPage.routeName:(context)=>CovidPage(),
      ListaPrueba.routeName:(context)=>ListaPrueba()
      },  
    );
  }
}

Future<ReqResRespuesta> getUsuarios() async {

 final resp= await http.get('https://reqres.in/api/users');
 return reqResRespuestaFromJson(resp.body);
 
}

class Mipagina extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.pink,
        title: Text('Future'),
      ),
      body: FutureBuilder(
        future: getUsuarios(),
        builder: (BuildContext context, AsyncSnapshot<ReqResRespuesta> snapshot) {
          /* if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
            child:CircularProgressIndicator() ,
          ) ;
          }else{
            return _ListaUsuarios(snapshot.data.data);
          } */

          print(snapshot.connectionState);

          return Center(child:CircularProgressIndicator() );
          
          
        },
      ),
    );
  }
}

class _ListaUsuarios extends StatelessWidget {

  final List<Usuario> usuarios;

  const _ListaUsuarios(this.usuarios);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, int i) { 

        final usuario=usuarios[i];
        return ListTile(
          title: Text('${usuario.firstName} ${usuario.lastName}'),
          subtitle: Text(usuario.email),
          trailing: Image.network(usuario.avatar),
          onTap: (){
            Navigator.pushNamed(context,PaginaPrueba.routeName, arguments:usuario);
          },
        );


     },);
  }
}

class PaginaPrueba extends StatelessWidget {
  static const routeName = '/extractArguments';
  
  @override
  Widget build(BuildContext context) {
    final Usuario user=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        
              child: CustomScrollView(slivers: <Widget>[
          
          _crearAppbar(user),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10.0),
                 // _posterTitulo(context, pelicula),
                  _DatosPersonales(user)
                  
                  //_crearCasting(pelicula),

                ],
              ),
            ),
        ],),
      )
      
    );
  }

  Widget _crearAppbar(Usuario user){
    return SliverAppBar(
      elevation: 15.0,
      backgroundColor: Color.fromRGBO(95, 65, 8, 10.0),
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
            user.firstName,
            style: TextStyle(color: Colors.white, fontSize: 36.0),
          ),
       
        background: FadeInImage(
          image: NetworkImage(user.avatar),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }




}

class _DatosPersonales extends StatelessWidget {

  final Usuario datosUser;

  _DatosPersonales(this.datosUser);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Icon(Icons.email,size: 40,color: Colors.red,),
            Text(datosUser.email,style: TextStyle(fontSize: 30,color: Colors.blue))

            
          ],
        )
      ],
    );
  }
}

class SwiperPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Swiper'),
      ),
      body:Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        FutureBuilder(
          future: getUsuarios(),
          builder: (BuildContext context, AsyncSnapshot<ReqResRespuesta> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
              child:CircularProgressIndicator() ,
            ) ;
            }else{
              return SwiperCarga(snapshot.data.data); //_ListaUsuarios(snapshot.data.data);
            }
            
            
          },
        ),
        
      ],)
      
      
      
      
    );
  }
}

class SwiperCarga extends StatelessWidget {
  final List<Usuario> usuarios;
  const SwiperCarga(this.usuarios);

  @override
  Widget build(BuildContext context) {
  final _screenSize=MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.only(top:10.0),
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
      final usuario=usuarios[index];
      return new Image.network(usuario.avatar
        /* "http://via.placeholder.com/288x188" */,
        fit: BoxFit.fill,
      );
  },
  itemCount: usuarios.length,
  itemWidth: _screenSize.width * 0.7,
  itemHeight: _screenSize.height * 0.5,
  layout: SwiperLayout.STACK,
),
    );
  }
}