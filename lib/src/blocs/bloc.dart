import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

// with can't be used without extend a class since with adding the functionality to the base class.
// 1. so here extends root class of dart that is Object and then add Validators
// 2. instead of that we can extends Validators class to Bloc class instead of with
class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  //Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //Method

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('valid email is $validEmail');
    print('valid password is $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
