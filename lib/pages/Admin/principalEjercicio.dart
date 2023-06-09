import 'package:flutter/material.dart';
import 'package:app_training/peticiones/peticionesEjercicio.dart';

class PrincipalEjercicio extends StatefulWidget {
  PrincipalEjercicio({Key? key}) : super(key: key);

  @override
  State<PrincipalEjercicio> createState() => _PrincipalEjercicioState();
}

class _PrincipalEjercicioState extends State<PrincipalEjercicio> {
  TextEditingController controlTipo = TextEditingController();
  TextEditingController controlNivel = TextEditingController();
  TextEditingController controlNombre_Ejercicio = TextEditingController();
  TextEditingController controlFoto = TextEditingController();
  TextEditingController controlCantidad_Series = TextEditingController();
  TextEditingController controlCantidad_repeteciones = TextEditingController();
  TextEditingController controlEstado = TextEditingController();

  String selectedValue1 = 'Tipo Ejercicio';
  String seleccionado_1 = "";
  String selectedValue2 = 'Nivel Ejercicio';
  String seleccionado_2 = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  validator: (value) =>
                      value == null ? "Select a country" : null,
                  dropdownColor: Colors.white,
                  style: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 15,
                      fontFamily: 'Prompt'),
                  value: selectedValue1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue1 = newValue!;
                      controlTipo.text = newValue;
                    });
                  },
                  items: <String>[
                    'Tipo Ejercicio',
                    'Brazos',
                    'Piernas',
                    'Abdomnen',
                    'Espalda'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  validator: (value) =>
                      value == null ? "Select a country" : null,
                  dropdownColor: Colors.white,
                  style: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 15,
                      fontFamily: 'Prompt'),
                  value: selectedValue2,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue2 = newValue!;
                      controlNivel.text = newValue;
                    });
                  },
                  items: <String>[
                    'Nivel Ejercicio',
                    'Principiante',
                    'Intermedio',
                    'Avanzado'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Prompt',
                  ),
                  controller: controlNombre_Ejercicio,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_decrease_rounded),
                      labelText: 'Nombre del Ejercicio'),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Prompt',
                  ),
                  controller: controlFoto,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_decrease_rounded),
                      labelText: 'Foto del Ejercicio'),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Prompt',
                  ),
                  controller: controlCantidad_Series,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_decrease_rounded),
                      labelText: 'cantidad de series'),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Prompt',
                  ),
                  controller: controlCantidad_repeteciones,
                  decoration: InputDecoration(
                      icon: Icon(Icons.text_decrease_rounded),
                      labelText: 'Cantidad de repeticiones'),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                child: MaterialButton(
                  minWidth: 400.0,
                  height: 60.0,
                  onPressed: () {
                    if ((selectedValue1.toString() != 'Tipo Ejercicio' &&
                            controlTipo.text.isNotEmpty) &&
                        (selectedValue2.toString() != 'Nivel Ejercicio' &&
                            controlNivel.text.isNotEmpty)) {
                      var cliente = <String, dynamic>{
                        'tipo': selectedValue1.toString(),
                        'nivel': selectedValue2.toString(),
                        'nombre_Ejercicio': controlNombre_Ejercicio.text,
                        'foto': controlFoto.text,
                        'cantidad_Series': controlCantidad_Series.text,
                        'cantidad_repeteciones':
                            controlCantidad_repeteciones.text,
                        'estado': controlEstado.text = "DISPONIBLE",
                      };

                      PeticionesEjercicio.crearEjercicio(cliente);

                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                content: Text('Agregado correctamente'),
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                content: Text('No se aceptan campos vacios'),
                              ));
                    }
                  },
                  color: Colors.red,
                  child: Text('Registrar ejercicio',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Prompt')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
