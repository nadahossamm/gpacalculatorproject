import 'package:flutter/material.dart';
import 'Constants.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TextEditingController> _controller = [
    for (int i = 1; i < 8 ; i++)
      TextEditingController()
  ];
  final form1=TextEditingController();
  final form2=TextEditingController();
  final form3=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(

    appBar: AppBar(
    backgroundColor: Colors.black38,
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
    borderSide: BorderSide(color: Colors.orangeAccent)),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black38)),
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
    borderSide: BorderSide(color: Colors.orangeAccent)),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black38)),
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
    color: Colors.orangeAccent)),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Colors.black38)),
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
    items: grads.map((String DropDownList) {
    return DropdownMenuItem(
    child: Text(DropDownList),
    value: DropDownList);
    }).toList(),
    onChanged: (String selected) {
    setState(() {
    selectedd[index] = selected;
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
    hintText: 'Failed course credit hours ',
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orangeAccent)),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black38)),
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
    primary: Colors.black38,
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
    primary: Colors.orange,
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
    content:  Text(msg2,style: TextStyle( color: Colors.black38),),
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
    );

  }
}
