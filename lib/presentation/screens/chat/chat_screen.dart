import 'package:flutter/material.dart';
import 'package:maybe_app/domain/entities/message.dart';
import 'package:maybe_app/presentation/providers/chat_provider.dart';
import 'package:maybe_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:maybe_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:maybe_app/presentation/widgets/shared/messaged_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://www.brit.co/media-library/jennifer-lawrence-dating-history.jpg?id=53158681&width=1200&height=1800',
            ),
          ),
        ),
        title: Text('My love'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(text: message.text);
                },
              ),
            ),
            MessagedFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
