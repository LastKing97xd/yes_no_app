import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    //para que se mantenga el focus cuando no le des al button
    final focusNodeV = FocusNode();
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10));
    final inputDecoration = InputDecoration(
        hintText: 'Escribe un mensaje ...',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('El valor del texto en Button: $textValue');
            onValue(textValue);
            textController.clear();
          },
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNodeV.unfocus();
      },
      keyboardAppearance: Brightness.light,
      focusNode: focusNodeV,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('El valor del texto en Teclado: $value');
        onValue(value);
        textController.clear();
        focusNodeV.requestFocus();
      },
      // onChanged: (value) {
      //   print('Teclear $value');
      // },
    );
  }
}
