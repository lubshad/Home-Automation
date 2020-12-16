import 'package:firebase_database/firebase_database.dart';
import 'package:learn_mcu/models/swithcModel.dart';

class DatabaseService {
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  Stream<SwitchModel> switchStream() {
    return firebaseDatabase.reference().child("Switches/Switch_1").onValue.map(
      (event) {
        // print(event.snapshot.value);
        return SwitchModel.fromJson(event.snapshot.value);
      },
    );
  }

  void changeLEDstatus(bool value) {
    if (value) {
      firebaseDatabase.reference().child("Switches/Switch_1/Value").set("ON");
    } else {
      firebaseDatabase.reference().child("Switches/Switch_1/Value").set("OFF");
    }
  }
}
