import 'package:flutter/material.dart';
import 'package:sayi_tahmini/tahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Home Page"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Guessing Game",style: TextStyle(color: Colors.black54,fontSize: 36),),
            SizedBox(
              width: 250,
                height: 250,
                child: Image.asset("resimler/dice.png")
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("START GAME",style: TextStyle(fontSize: 25),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GuessScreen()));
                }
              ),
            ),

          ],
        ),
      ),

    );
  }
}
