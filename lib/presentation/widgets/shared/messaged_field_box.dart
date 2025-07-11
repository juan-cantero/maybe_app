import 'package:flutter/material.dart';

class MessagedFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessagedFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    final inputDecoration = InputDecoration(
      hintText: 'Ask something',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );
    final textFormField = TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        onValue(value);

        focusNode.requestFocus();
      },
    );
    return textFormField;
  }
}
