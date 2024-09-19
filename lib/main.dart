import 'package:flutter/material.dart';
import 'package:snuggy/sound.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snuggy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Snuggy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 10.0,
        children: const <Widget>[
          SoundWidget(
            title: "Rain",
            asset: "rain"
          ),
          SoundWidget(
            title: "Storm",
            asset: "storm"
          ),
          SoundWidget(
            title: "Wind",
            asset: "wind"
          ),
          SoundWidget(
            title: "Waves",
            asset: "waves"
          ),
          SoundWidget(
            title: "Stream",
            asset: "stream"
          ),
          SoundWidget(
            title: "Birds",
            asset: "birds"
          ),
          SoundWidget(
            title: "Summer Night",
            asset: "summer-night"
          ),
          SoundWidget(
            title: "Train",
            asset: "train"
          ),
          SoundWidget(
            title: "Boat",
            asset: "boat"
          ),
          SoundWidget(
            title: "City",
            asset: "city"
          ),
          SoundWidget(
            title: "Coffee Shop",
            asset: "coffee-shop"
          ),
          SoundWidget(
            title: "Fireplace",
            asset: "fireplace"
          ),
          SoundWidget(
            title: "Pink Noise",
            asset: "pink-noise"
          ),
          SoundWidget(
            title: "White Noise",
            asset: "white-noise"
          )
        ]
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// I need a stateful widget that will take a file and play it.
// The widget will be an icon, a text and a slider.
// Pressing the icon will change the slider color and disable it.
// Dragging the slider will add the sound to the main mix.
// All wrapped in a center, and three columns.

// Sounds are taken from: https://github.com/rafaelmardojai/blanket/tree/master/data/resources/sounds