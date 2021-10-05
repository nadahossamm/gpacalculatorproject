double faild=0;
int numoflist=7;

String msg1='';
String msg2='';

List<String> grads = [
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
 // setState(() {
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
  //});

  double Tgpa =0;
  Tgpa=(gpa+(oldh*oldg)) / (sum+(oldh- faild));
  oldg=0;
  print (Tgpa);
  print (faild);
  if(flag==false)
    return Tgpa;
  else
    return 0.0;

}

//@override

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