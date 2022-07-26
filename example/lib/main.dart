import 'package:flutter/material.dart';
import 'package:ios_willpop_transition_theme/ios_willpop_transition_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: IOSWillPopTransitionsBuilder(),
            TargetPlatform.android: IOSWillPopTransitionsBuilder(),
            TargetPlatform.macOS: IOSWillPopTransitionsBuilder(),
          },
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(WillPopPageRoute(
                  builder: (_) => const TestPage(),
                ));
              },
              child: const Text('Push will pop dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const TestPage(returnTrue: true),
                ));
              },
              child: const Text('Push will pop return true'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key, this.returnTrue = false}) : super(key: key);

  final bool returnTrue;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.returnTrue) return true;

        final bool? result = await showDialog(
          context: context,
          builder: (_) => Center(
            widthFactor: 1,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <bool>[false, true]
                    .map((value) => TextButton(
                          onPressed: () => Navigator.pop(context, value),
                          child: Text(value.toString()),
                        ))
                    .toList(),
              ),
            ),
          ),
        );

        return result == true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('TestPage')),
        body: const Center(child: Text('TestPage')),
      ),
    );
  }
}
