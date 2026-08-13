import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voco_app/page/home_decide.dart';
import 'package:voco_app/page/login/login.dart';
import 'package:voco_app/page/login/register.dart';
import 'package:voco_app/page/home.dart';
import 'package:voco_app/page/form/form.dart';
import 'package:voco_app/page/login/LoginHome.dart';
import 'package:voco_app/page/pronunciation_guide/guidep2.dart';
import 'package:voco_app/page/vocogyan/story1.dart';
import 'package:voco_app/page/story_telling/storytellling.dart';
import 'package:voco_app/page/story_telling/storytelling2.dart';
import 'package:voco_app/page/ui/comingsoon.dart';
import 'package:voco_app/page/ui/welcome.dart';
import 'package:voco_app/page/TalkWithVoC/talkVoCop1.dart';
import 'package:voco_app/page/TalkWithVoC/talkVoCop2.dart';
import 'package:voco_app/page/TalkWithVoC/talkVoCop3.dart';
import 'package:voco_app/page/pronunciation_guide/guidep1.dart';
import 'package:voco_app/page/vocogyan/tech/DSA.dart';
import 'package:voco_app/page/vocogyan/tech/ch1.dart';
import 'package:voco_app/page/vocogyan/tech/quizDsa.dart';
// import 'package:flutter/services.dart';
// import 'package:alan_voice/alan_voice.dart';

import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAkX06omcOYnfbvmjbu0PEWaeM59Z_OzB0',
        appId: '1:191467372865:web:d259dfa1c0afc5d42ca118',
        messagingSenderId: '191467372865',
        projectId: 'voco-a50d5',
        storageBucket: 'voco-a50d5.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: MyLogin(),
    initialRoute: 'homeDecide',
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'home': (context) => HomePage(),
      'homeDecide': (context) => HomeDecide(),
      'form': (context) => form(),
      'welcome': (context) => welcome(),
      'start': (context) => LoginHome(),
      'Vguide1': (context) => PronucitionGuide(
            quotesList: [],
            pageNo: 0,
          ),
      'Vguide2': (context) => pronunciation2(
            quotesList: [],
            pageNo: 0,
            recordingPath: "",
          ),
      'talkVoCo1': (context) => Talkwithvoco1(),
      'talkVoCo2': (context) => Talkwithvoco2(),
      'talkVoCo3': (context) => Talkwithvoco3(),
      'StoryTelling': (context) => StoryTelling(),
      'StoryTelling2': (context) => storytelling2(),
      'ComingSoon': (context) => comingsoon(),
      'vocogyan': (context) => vocogyan(),
      'Technical': (context) => Technical(),
      'dsa': (context) => DSA(),
      'DsaQuiz': (context) => DsaQuiz(),
    },
  ));
}
