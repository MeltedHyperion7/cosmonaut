import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wordl extends StatefulWidget {
  final String word;
  final String question;

  const Wordl(this.word, this.question, {super.key});

  @override
  State<Wordl> createState() => _WordlState();
}

enum WordlResult { invalid, correct, incorrect }

class Wordl_Row extends StatefulWidget {
  final String word;
  final Function(WordlResult) onSubmit;

  Wordl_Row(this.word, this.onSubmit);

  @override
  State<StatefulWidget> createState() => _Wordl_Row_State();
}

class _Wordl_Row_State extends State<Wordl_Row> {
  final List<TextField> textFields = [];
  late List<Color> colors = [];
  late bool readOnly = false;
  List<TextEditingController> textControllers = [];

  // Wordl_Row(this.user_response, this.true_response);

  @override
  void initState() {
    super.initState();

    final int length = widget.word.length;
    for (int i = 0; i < length; i++) {
      colors.add(Colors.white);
      textControllers.add(TextEditingController());
    }
  }

  void evaluateResponse() {
    for (var controller in textControllers) {
      if (controller.text.isEmpty) {
        widget.onSubmit(WordlResult.invalid);
        return;
      }
    }

    String user_response = textFields.map((c) => c.controller!.text).join();
    String true_response = widget.word;

    bool won = true;

    setState(() {
      for (int i = 0; i < user_response.length; i++) {
        if (user_response[i] == true_response[i]) {
          colors[i] = Colors.green;
        } else {
          won = false;
          bool found = false;
          for (int j = i + 1; j < user_response.length; j++) {
            found = found || user_response[i] == true_response[j];
          }
          if (found) {
            colors[i] = Colors.yellow;
          } else {
            colors[i] = Colors.red;
          }
        }
      }

      readOnly = true;
    });

    won
        ? widget.onSubmit(WordlResult.correct)
        : widget.onSubmit(WordlResult.incorrect);
  }

  @override
  Widget build(BuildContext context) {
    if (readOnly) {
      return Row(
        children: textControllers.asMap().entries.map((e) => Container(
          width: 20,
          child: TextField(
            readOnly: readOnly,
            textCapitalization: TextCapitalization.characters,
            enableSuggestions: false,
            style: TextStyle(color: colors[e.key]),
            controller: e.value,
            // validator: (value) => value != null && value.isEmpty ? "" : null,
            maxLength: 1,
            enabled: false,
            // inputFormatters: [LengthLimitingTextInputFormatter(1)],
          ))).toList(),
      );
    } else {
      return Column(children: [
        Container(
          height: 200,
          width: 1000,
          child: Row(
          children: textControllers.asMap().entries.map((e) => SizedBox(width: 20, height: 30, child: Material(child: TextField(
          readOnly: readOnly,
          style: TextStyle(color: colors[e.key]),
          controller: e.value,
          // validator: (value) => value != null && value.isEmpty ? "" : null,
          maxLength: 1,
          enabled: false,
        // inputFormatters: [LengthLimitingTextInputFormatter(1)],
        )))).toList())),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: evaluateResponse,
          child: const Text('Submit'),
        )
      ]);
    }
  }
}

class _WordlState extends State<Wordl> {
  List<Wordl_Row> children = [];
  int attempts = 0;
  late final int maxAttempts;

  void gameStep() {
    if (attempts == maxAttempts) {
      // TODO
    } else {
        setState(() {
          children.add(Wordl_Row(widget.word, (result) {
          attempts++;

          switch (result) {
            case WordlResult.correct:
              // TODO win
              break;
            case WordlResult.incorrect:
              gameStep();
              break;

            case WordlResult.invalid:
              // TODO: Handle this case.
              break;
          }
        }));
      });
    }
  }

  @override
  void initState() {
    super.initState();

    maxAttempts = widget.word.length + 1;

    gameStep();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 50,),
      //Question Text
      
      Text("WORDLE", style: const TextStyle(
              fontFamily: 'Minecraft',
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 24,
              letterSpacing: 4),),

      //Row of User Inputs
      ...children, // Submit Button
    ]);
  }
}
