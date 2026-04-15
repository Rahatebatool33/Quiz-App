// import 'package:flutter/material.dart';
// import 'package:quizapp/data/questions.dart';
// import 'package:quizapp/start_screen.dart';
// import 'package:quizapp/question_screen.dart';
// import 'package:quizapp/result_screen.dart';
// import 'package:flutter/material.dart';




// class Quiz extends StatefulWidget {
//   const Quiz({super.key});

//   @override
//   State<Quiz> createState() => _QuizState();
// }

// class _QuizState extends State<Quiz> {
//   final List<String> selectedAnswers = [];
//   var activeScreen = 'start-screen';

//   //SOL:1
//   //   Widget? activeScreen ;
//   //  @override
//   //   void initState() {
//   //     activeScreen =StartScreen(switchScreen);
//   //     super.initState();
//   //   }
//   //SOL :2
//   // var activeScreen = 'start-screen';
//   // void switchScreen() {
//   //   setState(() {
//   //     activeScreen = 'question-screen';
//   //   });

//   // void switchScreen() {
//   //   setState(() {
//   //     activeScreen = QuestionsScreen();
//   //   });
//   void switchScreen() {
//     setState(() {
//       activeScreen = 'questions-screen';
//     });
//   }

//   void chooseAnswer(String answer) {
//     selectedAnswers.add(answer);
//     if (selectedAnswers.length == questions.length) {
//       setState(() {
//         selectedAnswers = [];

//         activeScreen = 'results-screen';
//       });
//     }
//   }

//   @override
//   Widget build(context) {
//     Widget screenWidget = StartScreen(switchScreen);
//     if (activeScreen == 'questions-screen') {
//       screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
//     }
//     if (activeScreen == 'ResultsScreen') {
//       screenWidget = ResultsScreen(chosenAnswers: selectedAnswers,);
//     }
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.deepPurple, Colors.deepPurpleAccent],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           //SOL 1
//           // child: activeScreen,
//           // SOL :2
//           // child: activeScreen=='start-screen'
//           // ?StartScreen(switchScreen)
//           // : const QuestionsScreen(),
//           child: screenWidget,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:quizapp/start_screen.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}