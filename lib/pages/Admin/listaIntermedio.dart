import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_training/peticiones/peticionesEjercicio.dart';
import 'package:app_training/pages/Admin/detallesEjerciciosAdmin.dart';

class ListaIntermedio extends StatefulWidget {
  ListaIntermedio();

  @override
  _ListaIntermedioState createState() => _ListaIntermedioState();
}

class _ListaIntermedioState extends State<ListaIntermedio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 20, 10, 10),
            child: Text(
              "Ejercicios Intermedios",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Prompt',
              ),
            ),
          ),
          Expanded(child: getInfo(context)),
        ],
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return StreamBuilder(
    stream: PeticionesEjercicio.readItems(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {
        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              //? ListItemWidget(ejercicios: snapshot.data!.docs)
              ? VistaEjercicios(ejercicios: snapshot.data!.docs)
              : Text('Sin Datos');

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaEjercicios extends StatelessWidget {
  final List ejercicios;

  const VistaEjercicios({required this.ejercicios});

  @override
  Widget build(BuildContext context) {
    final intermedios = ejercicios
        .where((ejercicio) => ejercicio['nivel'] == 'Intermedio')
        .toList();

    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: intermedios.length,
            itemBuilder: (context, posicion) {
              final ejercicio = intermedios[posicion];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          detallesEjerciciosAdmin(
                        perfil: intermedios,
                        pos: posicion,
                        iddoc: ejercicio.id,
                      ),
                    ),
                  );
                },
                leading: Container(
                  padding: EdgeInsets.all(5.0),
                  width: 100,
                  height: 100,
                  child: Image(image: NetworkImage(ejercicio['foto'])),
                ),
                title: Text(
                  ejercicio['nombre_Ejercicio'],
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Prompt'),
                ),
                subtitle: Text(
                  "Tipo de Ejercicio: " + ejercicio['tipo'],
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'Prompt'),
                ),
                trailing: Container(
                  width: 20,
                  /*color: Colors.yellow,*/
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: ejercicio['estado'] == 'DISPONIBLE'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final List ejercicios;

  const ListItemWidget({required this.ejercicios});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: ejercicios.length == 0 ? 0 : ejercicios.length,
      itemBuilder: (context, posicion) {
        return Dismissible(
          key: Key(ejercicios[posicion]),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
          direction: DismissDirection.endToStart,
          child: Card(
            elevation: 5,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 140.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(ejercicios[posicion]['foto']))),
                  ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ejercicios[posicion]['nombre_Ejercicio'],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            child: Container(
                              width: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                "3D",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                            child: Container(
                              width: 260,
                              child: Text(
                                "His genius finally recognized by his idol Chester",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
