import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/page/home_decide.dart';
import 'package:aura_app/page/login/login.dart';
import 'package:aura_app/page/login/register.dart';
import 'package:aura_app/page/home.dart';
import 'package:aura_app/page/form/form.dart';
import 'package:aura_app/page/login/LoginHome.dart';
import 'package:aura_app/page/pronunciation_guide/guidep2.dart';
import 'package:aura_app/page/auragyan/story1.dart';
import 'package:aura_app/page/story_telling/storytellling.dart';
import 'package:aura_app/page/story_telling/storytelling2.dart';
import 'package:aura_app/page/ui/comingsoon.dart';
import 'package:aura_app/page/ui/welcome.dart';
import 'package:aura_app/page/TalkWithAura/talkAura1.dart';
import 'package:aura_app/page/TalkWithAura/talkAura2.dart';
import 'package:aura_app/page/TalkWithAura/talkAura3.dart';
import 'package:aura_app/page/pronunciation_guide/guidep1.dart';
import 'package:aura_app/page/auragyan/tech/DSA.dart';
import 'package:aura_app/page/auragyan/tech/ch1.dart';
import 'package:aura_app/page/auragyan/tech/quizDsa.dart';
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
        projectId: 'aura-a50d5',
        storageBucket: 'aura-a50d5.appspot.com',
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
      'talkAura1': (context) => TalkWithAura1(),
      'talkAura2': (context) => TalkWithAura2(),
      'talkAura3': (context) => TalkWithAura3(),
      'StoryTelling': (context) => StoryTelling(),
      'StoryTelling2': (context) => storytelling2(),
      'ComingSoon': (context) => comingsoon(),
      'auragyan': (context) => auragyan(),
      'Technical': (context) => Technical(),
      'dsa': (context) => DSA(),
      'DsaQuiz': (context) => DsaQuiz(),
    },
  ));
}
