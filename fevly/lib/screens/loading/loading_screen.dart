import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/loading/components/body.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    /// Define a reload timer every 5 seconds to check if network is available
    /// when stuck in this screen because of network issue
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
      FirebaseAuth.instance.currentUser
          ?.reload()
          .catchError((error) => print(' catch error : $error'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
