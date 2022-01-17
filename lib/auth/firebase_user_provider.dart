import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RobinJobsFirebaseUser {
  RobinJobsFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RobinJobsFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RobinJobsFirebaseUser> robinJobsFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<RobinJobsFirebaseUser>(
        (user) => currentUser = RobinJobsFirebaseUser(user));
