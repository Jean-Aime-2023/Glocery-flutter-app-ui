// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, dead_code, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:glocery/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //list of cart items

        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "My Cart",
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              Expanded(
                  child: ListView.builder(
                itemCount: value.cartItems
                    .length, // Specify the itemCount to prevent the RangeError
                itemBuilder: (context, index) {
                  if (index < value.cartItems.length) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index][2],
                            height: 36,
                          ),
                          title: Text(value.cartItems[index][0]),
                          subtitle: Text('\$' ' ' + value.cartItems[index][1]),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index),
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Handle the case where the index is out of range (optional)
                    return ListTile(
                      title: Text("Invalid Index"),
                    );
                  }
                },
              )
            ),
            Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Total Price",style: TextStyle(color: Colors.green [100]),),
                      const SizedBox(height: 4,),
                      Text('\$'' ' + value.calculateTotal(),style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade100),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text("Pay now",style: TextStyle(color: Colors.white),),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
            ],
          );

          //total + pay now
          
        }));
  }
}