import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
// import 'package:thesis_app/learn_flutter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SpeechToText speechToText = SpeechToText();

  var text = "Hold the button to start speaking";
  var isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 150.0,
        animate: isListening,
        duration: const Duration(milliseconds: 2000),
        glowColor: Colors.blue,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechToText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
          },
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 75,
            child: Icon(
              size: 75,
              isListening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Speech to Text ",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          textAlign: TextAlign.left,
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          margin: const EdgeInsets.only(bottom: 150),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 24,
                color: isListening ? Colors.black54 : Colors.black87,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
