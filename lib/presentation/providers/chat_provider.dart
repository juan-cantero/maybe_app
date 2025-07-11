import 'package:flutter/material.dart';
import 'package:maybe_app/config/helpers/get_yes_no_answer.dart';
import 'package:maybe_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    if (text.endsWith('?')) {
      await herReply();
    }
    // Esperar al próximo frame para que el UI termine de construir
    WidgetsBinding.instance.addPostFrameCallback((_) {
      moveScrollToBottom();
    });
    notifyListeners();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    moveScrollToBottom();
    notifyListeners();
  }

  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(microseconds: 30),
      curve: Curves.easeOut,
    );
  }
}
