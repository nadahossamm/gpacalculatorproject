import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double faild=0;
  int numoflist=7;
  List<TextEditingController> _controller = [
    for (int i = 1; i < 8 ; i++)
      TextEditingController()
  ];
  final form1=TextEditingController();
  final form2=TextEditingController();
  final form3=TextEditingController();
  String msg1='';
  String msg2='';

  List<String> _grads = [
    'Choose Grade',
    'A+',
    'A',
    'B+',
    'B',
    'C+',
    'C',
    'D+',
    'D',
    'F'
  ];
  double oldgpa=0;
  double oldhours=0;
  List<double> hours = [0.0,0.0,0.0,0.0,0.0,0.0,0.0];
  List<String> grades = [];
  List<String> selectedd = [
    'Choose Grade',
    'Choose Grade',
    'Choose Grade',
    'Choose Grade',
    'Choose Grade',
    'Choose Grade',
    'Choose Grade'
  ];
  //final _formkey = GlobalKey<FormState>();
  double gp = 0;
  double gpa=0;
  getgrade(String x) {
    if (x == 'A+')
      return 4.0;
    else if (x == 'A')
      return 3.7;
    else if (x == 'B+')
      return 3.3;
    else if (x == 'B')
      return 3.0;
    else if (x == 'C+')
      return 2.7;
    else if (x == 'C')
      return 2.4;
    else if (x == 'D+')
      return 2.2;
    else if (x == 'D')
      return 2.0;
    else if (x == 'F')
      return 0.0;
    else if (x=='Choose Grade')
      return 0.0;
  }

  CalcGrade(List<double> H, List<String> G,double oldh,double oldg) {
    double sum = 0;
    double gpa = 0;
    bool flag=false;
    setState(() {
      if(oldg > 4)
      {
        flag=true;
      }

      for (int i = 0; i < numoflist; i++) {
        if(H[i]!=0 && G[i]!='Choose Grade')
          sum = sum + H[i];
        double x = getgrade(G[i]);
        gpa = gpa + (H[i] * x);
      }
    });

    double Tgpa =0;
    Tgpa=(gpa+(oldh*oldg)) / (sum+(oldh- faild));
    print (Tgpa);
    print (faild);
    if(flag==false)
      return Tgpa;
    else
      return 0.0;

  }

  @override

  advance(double x)
  {
    if(x >=3.5)
      return 'Excellent Work!';
    else if(x>=3 )
      return 'very Good!';
    else if(x>=2.5)
      return 'Good job!';
    else
      return 'You need to work hard!';
  }

  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("GPA CALCULATOR"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0),
            child: Column(

              children: [

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller:form1,
                        cursorWidth: 2,
                        decoration: new InputDecoration(
                          hintText: 'Old Credit hour',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            oldhours = double.parse(val);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller:form2,
                        cursorWidth: 2,
                        decoration: new InputDecoration(
                          hintText: 'Old GPA',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            oldgpa = double.parse(val);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  //width: 5,
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 70,
                        // width: 40,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  //padding: EdgeInsets.only(left: 20, top: 20),
                                  child: TextFormField(
                                    controller:_controller[index] ,
                                    cursorWidth: 2,
                                    decoration: new InputDecoration(
                                      hintText: 'Credit hour',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.lightBlue)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red)),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (val) {
                                      setState(() {
                                        //hour1 = (int.parse(val));
                                        hours[index]=double.parse(val);
                                        //   hours.add(double.parse(val));
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: DropdownButton(
                                      items: _grads.map((String DropDownList) {
                                        return DropdownMenuItem(
                                            child: Text(DropDownList),
                                            value: DropDownList);
                                      }).toList(),
                                      onChanged: (String selected) {
                                        setState(() {
                                          this.selectedd[index] = selected;
                                          //grades[index]=selected;
                                          //grades[index]=selected;
                                          grades.add(selected);
                                        });

                                      },
                                      value: selectedd[index],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
          height: 50,
          child: TextFormField(
                    controller:form3,
                    cursorWidth: 2,
                    decoration: new InputDecoration(
                      hintText: 'Faild course credit hours ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      setState(() {
                        faild = double.parse(val);
                      });
                    },
                  ),
        ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 50, left: 80),
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                          ),
                          onPressed: () {
                            setState(() {
                              hours = [0.0,0.0,0.0,0.0,0.0,0.0,0.0];
                              _controller = [
                                for (int i = 1; i < numoflist+1; i++)
                                  TextEditingController()
                              ];
                              form1.clear();
                              form2.clear();
                              form3.clear();
                              selectedd = [
                                'Choose Grade',
                                'Choose Grade',
                                'Choose Grade',
                                'Choose Grade',
                                'Choose Grade',
                                'Choose Grade',
                                'Choose Grade',
                              ];
                              oldgpa = 0;
                              oldhours = 0;
                              faild=0;
                            });
                          },
                          child: Text("Reset")),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          // background
                        ),

                        onPressed: (){
                          setState(() {
                            gpa= CalcGrade(hours, selectedd, oldhours, oldgpa);
                            print(gpa);
                            if(gpa==0)
                            {
                              msg2="YOUR OLD GPA CAN'T BE BIGGER THAN 4";
                              msg1='ERROR';
                            }

                            else
                            {
                              msg2= advance(gpa);
                              msg1='Your GPA is : '+gpa.toStringAsFixed(3);

                            }

                          });
                          showDialog<String>(

                            context: context,
                            builder: (BuildContext context) => AlertDialog(

                              title:  Text( msg1),
                              content:  Text(msg2,style: TextStyle( color: Colors.red),),
                              actions: <Widget>[


                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text("Calculate"),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }

}
