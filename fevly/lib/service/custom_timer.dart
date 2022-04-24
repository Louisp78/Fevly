import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum TimerState { stopped, running }

class CustomTimer extends ChangeNotifier {
  CustomTimer({required this.number_of_seconds, this.reload_user = false})
      : _counter = Duration(seconds: number_of_seconds);

  final int number_of_seconds;
  final bool reload_user;

  TimerState _timerState = TimerState.stopped;
  TimerState get timerState => _timerState;

  /// Counter member
  Duration _counter;
  Duration get counter => _counter;
  set counter(Duration value) {
    _counter = value;
    notifyListeners();
  }

  Timer? curr_timer;

  void resetTimer() {
    _counter = Duration(seconds: number_of_seconds);
  }

  void startTimer() {
    _timerState = TimerState.running;
    _counter = Duration(seconds: number_of_seconds);
    curr_timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter.inSeconds > 0) {
        counter = _counter - Duration(seconds: 1);
      } else {
        timer.cancel();
        _timerState = TimerState.stopped;
        if (reload_user) FirebaseAuth.instance.currentUser!.reload();
      }

      notifyListeners();
    });
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    curr_timer?.cancel();
  }
}
