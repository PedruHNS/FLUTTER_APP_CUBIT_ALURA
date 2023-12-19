import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
const PaymentMethod({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Row(children: <Widget>[
        Image(
          width: 30,
          image: AssetImage("assets/images/visa.png"),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("VISA Classic", style: TextStyle(fontWeight: FontWeight.w500),),
                Text("****-6789", style: TextStyle(color: Color(0xFF9C9C9C)),),
              ],
            ),
          ),
        ),
        Icon(Icons.arrow_forward_ios),
    ],);
  }
}
