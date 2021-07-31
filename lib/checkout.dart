import 'package:flutter/material.dart';
import 'package:ecomer/mybutton.dart';
import 'package:ecomer/cartmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomer/productProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:ecomer/checkoutsingleproduct.dart';


class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextStyle myStyle = TextStyle(
    fontSize: 18,
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductProvider productProvider;

  Widget _buildBottomSingleDetail({String startName, String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
          style: myStyle,
        ),
        Text(
          endName,
          style: myStyle,
        ),
      ],
    );
  }

  User user;
  double total;
  List<CartModel> myList;

  Widget _buildButton() {
    return Column(
        children: productProvider.userModelList.map((e) {
          return Container(
            height: 50,
            child: MyButton(
              name: "Check Out",
              onPressed: () {
                if (productProvider.getCheckOutModelList.isNotEmpty) {
                  FirebaseFirestore.instance.collection("Order").add({
                    "Product": productProvider.getCheckOutModelList
                        .map((c) => {
                      "ProductName": c.name,
                      "ProductPrice": c.price,
                      "ProductQuetity": c.quentity,
                      "ProductImage": c.image,

                    })
                        .toList(),
                    "TotalPrice": total.toStringAsFixed(2),
                    "UserName": e.userName,
                    "UserEmail": e.userEmail,
                    "UserNumber": e.userPhoneNumber,
                    "UserAddress": e.userAddress,
                    "UserId": user.uid,
                  });
                  setState(() {
                    myList.clear();
                  });

                } else {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("No Item Yet"),
                    ),
                  );
                }
              },
            ),
          );
        }).toList());
  }

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    myList = productProvider.checkOutModelList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    double subTotal = 0;

    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getCheckOutModelList.forEach((element) {
      subTotal += element.price * element.quentity;
    });

    total = subTotal;
    if (productProvider.checkOutModelList.isEmpty) {
      total = 0.0;
    }

    return Scaffold(
        key: _scaffoldKey,

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
                        Text("৳${total}",style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (ctx, myIndex) {
                      return CheckOutSingleProduct(
                        index: myIndex,
                        image: myList[myIndex].image,
                        name: myList[myIndex].name,
                        price: myList[myIndex].price,
                        quentity: myList[myIndex].quentity,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
