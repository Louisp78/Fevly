import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class MartiniAnim {
  MartiniAnim();

  static const Duration delayDuration = Duration(seconds: 1);

  static SMITrigger? _changeShow;

  static void changeShowStatus() => _changeShow?.fire();

  static void onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'basicSM');
    artboard.addController(controller!);
    _changeShow = controller.findInput<bool>('changeShow') as SMITrigger;
  }
}
