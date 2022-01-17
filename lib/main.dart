import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:robin_jobs/login/login_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'm_a_i_n_home/m_a_i_n_home_widget.dart';
import 'm_a_i_n_saved_jobs/m_a_i_n_saved_jobs_widget.dart';
import 'm_a_i_n_chat/m_a_i_n_chat_widget.dart';
import 'm_a_i_n_candidates/m_a_i_n_candidates_widget.dart';
import 'm_a_i_n_my_profile/m_a_i_n_my_profile_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<RobinJobsFirebaseUser> userStream;
  RobinJobsFirebaseUser initialUser;
  bool displaySplashImage = true;
  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = robinJobsFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
        Duration(seconds: 1), () => setState(() => displaySplashImage = false));
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RobinJobs',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/splash@2x.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'MAINHome';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'MAINHome': MAINHomeWidget(),
      'MAINSavedJobs': MAINSavedJobsWidget(),
      'MAIN_Chat': MAINChatWidget(),
      'MAIN_Candidates': MAINCandidatesWidget(),
      'MAIN_MyProfile': MAINMyProfileWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.darkText,
        selectedItemColor: FlutterFlowTheme.secondaryColor,
        unselectedItemColor: Color(0xFFABB3BA),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.work_outline,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.work_outlined,
              size: 24,
            ),
            label: ' ',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.favorite_sharp,
              size: 24,
            ),
            label: ' ',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.chat_bubble_rounded,
              size: 24,
            ),
            label: 'Chats',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.group,
              size: 24,
            ),
            label: ' ',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.person_rounded,
              size: 24,
            ),
            label: '',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
