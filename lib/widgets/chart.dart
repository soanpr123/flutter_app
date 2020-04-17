import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/Transaction.dart';
import 'package:flutterapp/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Charts extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Charts(this.recentTransactions);
  List<Map<String, Object>> get TransactionValue {
    return List.generate(7, (indext) {
      final weekDay = DateTime.now().subtract(
        Duration(days: indext),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get totalSpending {
    return TransactionValue.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(TransactionValue);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: TransactionValue.map((data) {
            return Flexible(

              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
