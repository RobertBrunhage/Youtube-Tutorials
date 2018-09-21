import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Stepper Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Stepper Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepTapped: (step){
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: (){
          setState(() {
            if(this._currentStep < this._mySteps().length - 1){
              this._currentStep = this._currentStep + 1;
            }else{
              //Logic to check if everything is completed
              print('Completed, check fields.');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if(this._currentStep > 0){
              this._currentStep = this._currentStep - 1;
            }else{
              this._currentStep = 0;
            }
          });
        },
      ),
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
        title: Text('Step 1'),
        content: TextField(),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Step 2'),
        content: TextField(),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Step 3'),
        content: TextField(),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }
}
