import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class cartpage extends StatefulWidget {
  @override
  _cartpageState createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {


  double Total=0;

  String firstFieldname="Sunglass";
  String firstFieldimage='images/ss.jpg';
  double firstFieldprice=700;
  int firstFieldquentity=1;
  double firstFieldTotal=0;

  String secondFieldname="Bag";
  String secondFieldimage='images/bag.jpg';
  double secondFieldprice=1500;
  int secondFieldquentity=1;
  double secondFieldTotal=0;

  String thirdFieldname="Head Phone";
  String thirdFieldimage='images/HeadPhone.jpg';
  double thirdFieldprice=1700;
  int thirdFieldquentity=1;
  double thirdFieldTotal=0;

  String fourthFieldname="Mobile";
  String fourthFieldimage='images/mobile.jpg';
  double fourthFieldprice=20000;
  int fourthFieldquentity=1;
  double fourthFieldTotal=0;

  String fifthFieldname="T-Shirt";
  String fifthFieldimage='images/T Shirt.jpg';
  double fifthFieldprice=200;
  int fifthFieldquentity=1;
  double fifthFieldTotal=0;



  

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    String value;

    firstFieldTotal=firstFieldprice * firstFieldquentity;
    secondFieldTotal=secondFieldprice * secondFieldquentity;
    thirdFieldTotal=thirdFieldprice * thirdFieldquentity;
    fourthFieldTotal=fourthFieldprice * fourthFieldquentity;
    fifthFieldTotal=fifthFieldprice * fifthFieldquentity;

    Total = firstFieldTotal+secondFieldTotal+thirdFieldTotal+fourthFieldTotal+fifthFieldTotal;

    return Scaffold(
      backgroundColor: Colors.amber,

      bottomNavigationBar: Container(
        color: Colors.white,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    children: [
                      Text("Total", style: TextStyle(fontSize: 25,),
                      ),
                      Text("৳${Total}",style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 60,
                    width: 120,
                    child: FlatButton(
                        splashColor: Colors.red,
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: (){},
                        child: Text("CheckOut",
                          style: TextStyle(
                              fontSize: 20,
                            color: Colors.white
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
            ),
            SizedBox(height: 50,),

            BottomNavigationBar(
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                    backgroundColor: Colors.amber
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                    backgroundColor: Colors.amber
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                    backgroundColor: Colors.amber
                ),
              ],
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 120,
                        child: Image(
                          image: AssetImage(firstFieldimage),
                        ),
                      ),
                      Column(
                        children: [
                          Text(firstFieldname,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("৳${firstFieldprice}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2,),


                          Row(
                            children: <Widget>[
                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      if(firstFieldquentity == 1)
                                      return firstFieldquentity=1;
                                      firstFieldquentity--;
                                    });
                                  }
                              ),

                              //SizedBox(width: 2,),
                              Text(firstFieldquentity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){

                                    setState(() {
                                      if(firstFieldquentity == 9)
                                        return firstFieldquentity=9;
                                      firstFieldquentity++;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                      FlatButton(
                          splashColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)
                          ),
                          onPressed: (){},
                          child: Container(
                            // color: Colors.white,
                            height: 100,
                            width: 60,
                            child: Icon(Icons.delete_sharp),
                          )
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 120,
                        child: Image(
                          image: AssetImage(secondFieldimage),
                        ),
                      ),
                      Column(
                        children: [
                          Text(secondFieldname,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("৳$secondFieldprice",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2,),


                          Row(
                            children: <Widget>[
                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      if(secondFieldquentity == 1)
                                      return secondFieldquentity=1;
                                      secondFieldquentity--;
                                    });
                                  }
                              ),

                              //SizedBox(width: 2,),
                              Text(secondFieldquentity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){

                                    setState(() {
                                      if(secondFieldquentity == 9)
                                        return secondFieldquentity=9;
                                      secondFieldquentity++;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                      FlatButton(
                          splashColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)
                          ),
                          onPressed: (){},
                          child: Container(
                            // color: Colors.white,
                            height: 100,
                            width: 60,
                            child: Icon(Icons.delete_sharp),
                          )
                      )
                    ],
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 115,
                        child: Image(
                          image: AssetImage(thirdFieldimage),
                        ),
                      ),
                      Column(
                        children: [
                          Text(thirdFieldname,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("৳$thirdFieldprice",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2,),


                          Row(
                            children: <Widget>[
                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      if(thirdFieldquentity == 1)
                                      return thirdFieldquentity=1;
                                      thirdFieldquentity--;
                                    });
                                  }
                              ),

                              //SizedBox(width: 2,),
                              Text(thirdFieldquentity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){

                                    setState(() {
                                      if(thirdFieldquentity == 9)
                                        return thirdFieldquentity=9;
                                      thirdFieldquentity++;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                      FlatButton(
                          splashColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)
                          ),
                          onPressed: (){},
                          child: Container(
                            // color: Colors.white,
                            height: 100,
                            width: 60,
                            child: Icon(Icons.delete_sharp),
                          )
                      )
                    ],
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 120,
                        child: Image(
                          image: AssetImage(fourthFieldimage),
                        ),
                      ),
                      Column(
                        children: [
                          Text(fourthFieldname,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("৳$fourthFieldprice",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2,),


                          Row(
                            children: <Widget>[
                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      if(fourthFieldquentity == 1)
                                      return fourthFieldquentity=1;
                                      fourthFieldquentity--;
                                    });
                                  }
                              ),

                              //SizedBox(width: 2,),
                              Text(fourthFieldquentity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){

                                    setState(() {
                                      if(fourthFieldquentity == 9)
                                        return fourthFieldquentity=9;
                                      fourthFieldquentity++;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                      FlatButton(
                          splashColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)
                          ),
                          onPressed: (){},
                          child: Container(
                            // color: Colors.white,
                            height: 100,
                            width: 60,
                            child: Icon(Icons.delete_sharp),
                          )
                      )
                    ],
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 120,
                        child: Image(
                          image: AssetImage(fifthFieldimage),
                        ),
                      ),
                      Column(
                        children: [
                          Text(fifthFieldname,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("৳$fifthFieldprice",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2,),


                          Row(
                            children: <Widget>[
                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      if(fifthFieldquentity == 1)
                                      return fifthFieldquentity=1;
                                      fifthFieldquentity--;
                                    });
                                  }
                              ),

                              //SizedBox(width: 2,),
                              Text(fifthFieldquentity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              IconButton(
                                  color: Color(0xFFa8b4bf),
                                  icon: Icon(FontAwesomeIcons.plus,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: (){

                                    setState(() {
                                      if(fifthFieldquentity == 9)
                                        return fifthFieldquentity=9;
                                      fifthFieldquentity++;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                      FlatButton(
                          splashColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)
                          ),
                          onPressed: (){},
                          child: Container(
                            // color: Colors.white,
                            height: 100,
                            width: 60,
                            child: Icon(Icons.delete_sharp),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}

