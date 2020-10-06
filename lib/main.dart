import 'package:compileanywhere/router.dart';
import 'package:compileanywhere/ui/theme/app_state.dart';
import 'package:compileanywhere/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(AppStateAdapter());
  final appStateBox = await Hive.openBox('appStateBox');
  if (appStateBox.get("appState") == null) {
    appStateBox.put("appState", AppState());
  }
  ScreenUtil.init(designSize: Size(360, 640), allowFontScaling: false);
  runApp(
    ValueListenableBuilder(
      valueListenable: Hive.box('appStateBox').listenable(),
      builder: (context, box, widget) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Hive.box('appStateBox').get('appState');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compile Anywhere',
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 24),
              ),
            ),
            RaisedButton(
              child: Text(
                'Go to second screen',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _awaitReturnValueFromSecondScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      text = result;
    });
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  // this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: textFieldController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          RaisedButton(
            child: Text(
              'Send text back',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _sendDataBack(context);
            },
          )
        ],
      ),
    );
  }

  // get the text in the TextField and send it back to the FirstScreen
  void _sendDataBack(BuildContext context) {
    String textToSendBack = textFieldController.text;
    Navigator.pop(context, textToSendBack);
  }
}












class First extends StatefulWidget {
  final String value;
  First({Key key, this.value}) : super(key: key);
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  void goToNextPage() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) => new Second()));
  }

  String text = 'aaa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("${widget.value}"),
            RaisedButton(
              onPressed: () {},
              child: Text('run'),
            )
          ],
        ),
      ),
    );
  }
}

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField()
          ],
        ),
      ),
    );
  }
}
