import 'package:app_training/pages/login.dart';

import 'package:flutter/material.dart';

class detallesEjerciciosAdmin extends StatefulWidget {
  final iddoc;
  final pos;
  final List perfil;
  detallesEjerciciosAdmin({required this.perfil, this.pos, this.iddoc});

  /*final idperfil;
  final List<dynamic> perfil;
  RetirarVehiculo({required this.perfil, this.idperfil});*/

  @override
  _detallesEjerciciosAdminState createState() =>
      _detallesEjerciciosAdminState();
}

class _detallesEjerciciosAdminState extends State<detallesEjerciciosAdmin> {
  TextEditingController controltipo = TextEditingController();
  TextEditingController controlNivel = TextEditingController();
  TextEditingController controlnombre_Ejercicio = TextEditingController();
  TextEditingController controlfoto = TextEditingController();
  TextEditingController controlcantidad_Series = TextEditingController();
  TextEditingController controlcantidad_repeteciones = TextEditingController();
  TextEditingController controlestado = TextEditingController();

  @override
  void initState() {
    controlnombre_Ejercicio = TextEditingController(
        text: widget.perfil[widget.pos]['nombre_Ejercicio']);
    controltipo =
        TextEditingController(text: widget.perfil[widget.pos]['tipo']);
    controlNivel =
        TextEditingController(text: widget.perfil[widget.pos]['nivel']);
    controlcantidad_Series = TextEditingController(
        text: widget.perfil[widget.pos]['cantidad_Series']);
    controlcantidad_repeteciones = TextEditingController(
        text: widget.perfil[widget.pos]['cantidad_repeteciones']);
    controlestado =
        TextEditingController(text: widget.perfil[widget.pos]['estado']);
    controlfoto =
        TextEditingController(text: widget.perfil[widget.pos]['foto']);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'APPTraining',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Prompt',
            ),
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                child: IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.real_estate_agent_sharp),
                  color: Colors.white,
                  tooltip: 'Salir',
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              SizedBox(
                width: 26,
              )
            ],
          ),
          centerTitle: true,
          toolbarHeight: 60,
          backgroundColor: Colors.red.shade400,
          //elevation: 14,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0))),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    color: Colors.white,
                    tooltip: 'Salir',
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Login()));
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 26,
                )
              ],
            ),
          ]),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              36,
              10,
              36,
              0,
            ),
          ),
          /////////////////////////////////////////////////////////7
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.all(15),
              elevation: 10,

              // Dentro de esta propiedad usamos ClipRRect
              child: ClipRRect(
                // Los bordes del contenido del card se cortan usando BorderRadius
                borderRadius: BorderRadius.circular(30),

                // EL widget hijo que será recortado segun la propiedad anterior
                child: Column(
                  children: <Widget>[
                    // Usamos el widget Image para mostrar una imagen
                    Image(image: NetworkImage(controlfoto.text)),

                    // Usamos Container para el contenedor de la descripción
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 5,
                            left: (MediaQuery.of(context).size.width / 2) - 135,
                            child: Container(
                              //
                              height: 60,
                              width: 200,
                              child: Card(
                                elevation: 2,
                                color: Colors.red[200],
                                child: Center(
                                  child: Text(
                                    controlnombre_Ejercicio.text,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Prompt',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 90),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Nivel de Ejercicio:\n' +
                                            controlNivel.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(
                                        '\nTipo de Ejercicio:\n' +
                                            controltipo.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(
                                        '\nEstado:\n' + controlestado.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(
                                        '\nCantidad de series:\n' +
                                            controlcantidad_Series.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(
                                        '\Cantidad de repeticiones:\n' +
                                            controlcantidad_repeteciones.text,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Prompt',
                                        ),
                                      ),
                                      Text(''),
                                      Text(''),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          //////////////////////////////////////////////////////////////////////////////7
        ],
      ),
    );
  }
}
