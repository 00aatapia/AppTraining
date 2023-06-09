import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class PeticionesEjercicio {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('Ejercicio');

    return listado.snapshots();
  }

  static Future<void> crearEjercicio(Map<String, dynamic> Ejercicio) async {
    await _db.collection('Ejercicio').doc().set(Ejercicio).catchError((e) {
      print(e);
    });
    //return true;
  }

//'MWPy56bgx9wYBzul88rR'
  static Future<void> actualizarEjercicio(
      String id, Map<String, dynamic> Ejercicio) async {
    await _db.collection('Ejercicio').doc(id).update(Ejercicio).catchError((e) {
      print(e);
    });
    //return true;
  }

  static Future<void> eliminarEjercicio(String id) async {
    await _db.collection('Ejercicio').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }
}
