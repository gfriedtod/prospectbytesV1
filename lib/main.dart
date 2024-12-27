import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:untitled6/repository/image_repository.dart';
import 'package:untitled6/repository/prospect_repository.dart';
import 'package:untitled6/repository/prospect_types_repository.dart';
import 'package:untitled6/services/prospect/prospect_bloc.dart';

import 'firebase_options.dart';
import 'page/prospect_list_page.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

const String cloudinary_url =
    "cloudinary://284228243264668:YpELTPPxXsd4OCEsLynmEYHkMKE@dbxeapu5q";

class MyApp extends StatelessWidget {
  MyApp({super.key});

  FirebaseFirestore instance = FirebaseFirestore.instance;

  Cloudinary cloudinary = Cloudinary.fromStringUrl(cloudinary_url);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ProspectRepository prospectRepository = ProspectRepository(instance);
    final ProspectTypesRepository prospectTypesRepository =
        ProspectTypesRepository(instance);
    final ImageRepository imageRepository = ImageRepository(cloudinary);

    FlutterNativeSplash.remove();
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => prospectRepository),
          RepositoryProvider(create: (_) => prospectTypesRepository),
          RepositoryProvider(create: (_) => imageRepository),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => ProspectBloc(prospectRepository,
                      prospectTypesRepository, imageRepository)
                    ..add(const ProspectEvent.started())),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                useMaterial3: true,
              ),
              home: const ProspectListPageView(),
            )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    void initState() {
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
