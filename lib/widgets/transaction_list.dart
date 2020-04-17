import 'package:flutter/material.dart';
import 'package:flutterapp/models/Transaction.dart';
import 'package:intl/intl.dart';

class TranShome extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TranShome(this._userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No Transaction added yet !",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, indext) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$${_userTransactions[indext].amount}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _userTransactions[indext].tile,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd')
                              .format(_userTransactions[indext].date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
