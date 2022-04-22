import 'package:rive/rive.dart';

class MartiniAnim {
  const MartiniAnim();

  static SMITrigger? _exit_martini;

  static void exitAnim() => _exit_martini?.fire();

  static void onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'basicSM');
    artboard.addController(controller!);
    _exit_martini = controller.findInput<bool>('exit') as SMITrigger;
  }
}
