import 'package:flutter/material.dart';

import 'widgets/order_button.dart';
import 'widgets/order_details.dart';
import 'widgets/payment_method.dart';
import 'widgets/payment_total.dart';
import '../../models/movie.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key, required this.movie, required this.session})
      : super(key: key);
  final Movie movie;
  final String session;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Pedido",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              OrderDetails(movie: movie, session: session),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Pagamento",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const PaymentMethod(),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Confirmar total",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const PaymentTotal(total: 32),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    OrderButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
