import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmini/ResultScreen.dart';

class GuessScreen extends StatefulWidget {
  const GuessScreen({super.key});

  @override
  State<GuessScreen> createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {

  var tfTahmin = TextEditingController();
  int randomNumber = 0;
  int kalanHak = 5;
  String yonlendir = "";

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(101);//0-100
    print("Random Number: ${randomNumber}");
  }
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
            Text("Remaining Lives : $kalanHak",style: TextStyle(color: Colors.pink,fontSize: 30),),
            Text("Hint : $yonlendir",style: TextStyle(color: Colors.black54,fontSize: 24),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Guess",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )
                ),
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                  child: Text("GUESS",style: TextStyle(fontSize: 25),),
                  onPressed: (){

                    setState(() {
                      kalanHak-=1;
                    });
                    int tahmin = int.parse(tfTahmin.text);

                    if(tahmin == randomNumber){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(result: true,)));
                      return;
                    }
                    if(tahmin > randomNumber){
                      setState(() {
                        yonlendir = "Reduce Estimate";
                      });
                    }
                    if(tahmin < randomNumber){
                      setState(() {
                        yonlendir = "Increase Estimate";
                      });
                    }
                    if(kalanHak == 0){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(result: false,)));
                    }
                    tfTahmin.text = "";

                  }
              ),
            ),

          ],
        ),
      ),

    );
  }
}
