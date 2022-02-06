import 'package:fevly/model/message.dart';

class Chat {
  final List<Message> _messages = List.empty();

  List<Message> messages()
  {
    return List.unmodifiable(_messages);
  }

  bool addMessage({required Message message})
  {
    _messages.add(message);
    return true;
  }

}
