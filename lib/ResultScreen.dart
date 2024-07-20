import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {

  bool result;

  ResultScreen({required this.result});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Result Screen"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 250,
                height: 250,
                child: widget.result ? Image.asset("resimler/happySmile.webp") : Image.asset("resimler/sadSmiley.jpg"),
            ),
            Text(widget.result ? "You Win" : "You Lost",style: TextStyle(color: Colors.black54,fontSize: 36),),
            SizedBox(
                width: 250,
                height: 50,
              child: ElevatedButton(
                  child: Text("TRY AGAIN",style: TextStyle(fontSize: 25),),
                  onPressed: (){
                    Navigator.pop(context);
                  }
              ),
            ),
          ],
        ),
      ),

    );
  }
}

