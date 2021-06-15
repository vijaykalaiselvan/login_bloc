import 'dart:async';
import 'validators.dart';

// with can't be used without extend a class since with adding the functionality to the base class.
// 1. so here extends root class of dart that is Object and then add Validators
// 2. instead of that we can extends Validators class to Bloc class instead of with
class Bloc extends Object with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  //Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}
