import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class QikpodNanostoreOutboundAuthUser {
  QikpodNanostoreOutboundAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<QikpodNanostoreOutboundAuthUser>
    qikpodNanostoreOutboundAuthUserSubject =
    BehaviorSubject.seeded(QikpodNanostoreOutboundAuthUser(loggedIn: false));
Stream<QikpodNanostoreOutboundAuthUser>
    qikpodNanostoreOutboundAuthUserStream() =>
        qikpodNanostoreOutboundAuthUserSubject
            .asBroadcastStream()
            .map((user) => currentUser = user);
