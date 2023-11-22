import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/services/shared_preference.services.dart';

void main() async {
  await PreferenceServices.init();
  ////note: we can't write PrefernceService.prefs=SharedPrefernce.getInstance()
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            displayLarge: TextStyle(
                color: Colors.red, fontSize: 22, fontWeight: FontWeight.w100),
            displayMedium: TextStyle(
                color: Colors.yellow,
                fontSize: 14,
                fontWeight: FontWeight.bold)), //

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    PreferenceServices.prefs?.setString("userName", "Nancy");
                    setState(() {});
                  },
                  child: Text('add name to prefernce')),
              Text(
                '${PreferenceServices.prefs?.getString("userName") ?? 'no name'}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                '${PreferenceServices.prefs?.getString("userName") ?? 'no name'}',
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ));
  }
}
