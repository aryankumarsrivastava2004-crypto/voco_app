import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home.dart';

class AnimalSoundsGame extends StatefulWidget {
  const AnimalSoundsGame({Key? key}) : super(key: key);

  @override
  _AnimalSoundsGameState createState() => _AnimalSoundsGameState();
}

class _AnimalSoundsGameState extends State<AnimalSoundsGame> {
  final FlutterTts flutterTts = FlutterTts();
  int currentQuestion = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'sound': 'Woof! Woof!',
      'description': 'This animal is known as man\'s best friend and loves to bark. Woof! Woof!',
      'correct': 'Dog',
      'options': ['Dog', 'Cat'],
      'hint': 'It barks and wags its tail.'
    },
    {
      'sound': 'Meow! Meow!',
      'description': 'This animal is very independent, loves catching mice, and purrs when happy. Meow! Meow!',
      'correct': 'Cat',
      'options': ['Lion', 'Cat'],
      'hint': 'It likes milk and chasing laser pointers.'
    },
    {
      'sound': 'Roar!',
      'description': 'This animal is the king of the jungle and makes a powerful roar!',
      'correct': 'Lion',
      'options': ['Lion', 'Cow'],
      'hint': 'It has a large mane and is a big cat.'
    },
    {
      'sound': 'Moo! Moo!',
      'description': 'This domestic animal lives on a farm, eats grass, and produces milk. Moo! Moo!',
      'correct': 'Cow',
      'options': ['Cow', 'Elephant'],
      'hint': 'It has spots and produces milk.'
    },
    {
      'sound': 'Trumpet sound!',
      'description': 'This is the largest land mammal with a long trunk and big ears. Trumpet sound!',
      'correct': 'Elephant',
      'options': ['Elephant', 'Dog'],
      'hint': 'It has a long trunk and tusks.'
    },
  ];

  @override
  void initState() {
    super.initState();
    initTts();
  }

  void initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    speakIntro();
  }

  void speakIntro() async {
    await flutterTts.speak(
      "Welcome to the Animal Sounds Game! Listen to the animal sound description and choose the correct animal. Tap on the options below to answer."
    );
    speakQuestion();
  }

  void speakQuestion() async {
    if (currentQuestion < questions.length) {
      String desc = questions[currentQuestion]['description']!;
      await flutterTts.speak(desc);
    }
  }

  void selectOption(String option) async {
    await flutterTts.stop();
    bool isCorrect = option == questions[currentQuestion]['correct'];
    if (isCorrect) {
      score++;
      await flutterTts.speak("Correct! That is a " + option);
    } else {
      await flutterTts.speak("Wrong! The correct answer was " + questions[currentQuestion]['correct']!);
    }

    setState(() {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
        speakQuestion();
      } else {
        showGameOverDialog();
      }
    });
  }

  void showGameOverDialog() {
    flutterTts.speak("Game completed! You scored $score out of ${questions.length}.");
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          "Game Completed!",
          style: GoogleFonts.lora(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              score >= 3 ? Icons.emoji_events : Icons.refresh,
              color: score >= 3 ? Colors.amber : Colors.blueGrey,
              size: 80,
            ),
            const SizedBox(height: 10),
            Text(
              "Your Score: $score / ${questions.length}",
              style: GoogleFonts.lora(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              "Play Again",
              style: GoogleFonts.lora(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              restartGame();
            },
          ),
          TextButton(
            child: Text(
              "Go to Home",
              style: GoogleFonts.lora(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }

  void restartGame() {
    setState(() {
      currentQuestion = 0;
      score = 0;
    });
    speakIntro();
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var current = questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animal Sounds Game",
          style: GoogleFonts.lora(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/register.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 8,
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "Question ${currentQuestion + 1} of ${questions.length}",
                          style: GoogleFonts.lora(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.volume_up,
                          size: 70,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          current['sound']!,
                          style: GoogleFonts.lora(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          current['description']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lora(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: (current['options'] as List<String>).map((option) {
                    return SizedBox(
                      width: mediaQuery.size.width * 0.4,
                      height: 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: option == current['options'][0]
                              ? const Color.fromARGB(248, 156, 208, 52)
                              : const Color.fromARGB(248, 212, 255, 251),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                        ),
                        onPressed: () => selectOption(option),
                        child: Text(
                          option,
                          style: GoogleFonts.lora(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                TextButton.icon(
                  onPressed: () {
                    flutterTts.speak("Here is a hint: " + current['hint']!);
                  },
                  icon: const Icon(Icons.lightbulb, color: Colors.amber),
                  label: Text(
                    "Get Hint",
                    style: GoogleFonts.lora(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
