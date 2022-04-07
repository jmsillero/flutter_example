import 'package:flutter/material.dart';

/// Input with label in a column
/// child represent a text form field, in this case pass the widget as child
/// with all of the text field params
class GenericInput extends StatefulWidget {
  final TextFormField child;
  final String label;

  const GenericInput({Key? key, required this.child, required this.label})
      : super(key: key);

  @override
  _GenericInputState createState() => _GenericInputState();
}

class _GenericInputState extends State<GenericInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(widget.label),
      ), widget.child],
    );
  }
}
