import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const BMI_Cal(),
    );
  }
}

class BMI_Cal extends StatefulWidget {
  const BMI_Cal({Key? key}) : super(key: key);

  @override
  State<BMI_Cal> createState() => _BMI_CalState();
}

class _BMI_CalState extends State<BMI_Cal> {
  double heightmeter=0,bmi=0;
  final hightControllar=TextEditingController();
  final weightControllar=TextEditingController();
  _bmicalculation(double height,double weight)
  {

    heightmeter= height*0.01;// convert CM to Meter
    bmi=(weight/(heightmeter*heightmeter));
    print("BMI is: ${bmi.toStringAsFixed(2)}");
    return bmi;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.blue,Colors.purple,Colors.orange]
            ),
          ),
        ),


      ),
      body: Column(

        children: [
          Card(
            elevation: 10,
            child: Column(

              children: [
                Container(margin: const EdgeInsets.only(top: 10,),),
                TextFormField(
                  controller: hightControllar,
                  decoration:const InputDecoration(
                    labelText: "Height",
                    hintText:" Height(cm)",
                    border: OutlineInputBorder(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                ),
                TextFormField(
                  controller: weightControllar,
                  decoration:const InputDecoration(
                    labelText: "Weight",
                    border: OutlineInputBorder(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),

                ),
                ElevatedButton(onPressed: (){

                  // bmi=w.(h)2;
                  setState(() {
                    bmi=_bmicalculation(double.parse(hightControllar.text),double.parse(weightControllar.text));

                    print(bmi);
                  });

                }, child: const Text("Calculate")),
                Container(
                  padding: const EdgeInsets.all(5),
                ),
              ],
            ),
          ),

          Column(
            children: [
              if(bmi<18.5 && bmi>0)...[
                Image.asset('images/underweight.png',height: 400.0,width: 100.0),
                Container(
                  decoration:const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.all(15),
                  
                 // color: Colors.blue[800],
                  child: const Text("Underweight",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),),
                )
              ]
              else if(bmi>18.5 && bmi<24.9)...[
                Image.asset('images/normal.png',height: 400.0,width: 100.0),
                Container(
                  decoration:const BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.all(15),

                  // color: Colors.blue[800],
                  child: const Text("Normal",style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),),
                )
              ]
              else if(bmi>24.9 && bmi<34.9)...[
                  Image.asset('images/overweight.png',height: 400.0,width: 100.0),
                  Container(
                    decoration:const BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.all(15),

                    // color: Colors.blue[800],
                    child: const Text("Overweight",style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),),
                  )
                ]
                else if(bmi>34.9)...[
                    Image.asset('images/obese.png',height: 400.0,width: 100.0),
                    Container(
                      decoration:const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.all(15),

                      // color: Colors.blue[800],
                      child: const Text("Obese",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),),
                    )
                  ]
                else...[
                  Container(
                    margin: EdgeInsets.only(
                      top: 50
                    ),
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                           begin: Alignment.centerLeft,
                           end: Alignment.centerRight,
                           colors: <Color>[Colors.blue,Colors.purple,Colors.red,Colors.orange]
                       ),
                     borderRadius: BorderRadius.all(Radius.circular(10))

                   ),
                   child: Text("Output Will Show Here..",style: TextStyle(
                       fontSize: 20,
                       color: Colors.white
                   ),),
                  )
                    ]








                      ],


          ),

        ],
        )
      );

  }
}


