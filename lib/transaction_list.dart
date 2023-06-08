import './transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  //Passing the List into new variable.
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      //Using Listview to display the data in scrollable list.
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          //Using Card Widget for making Card layout
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  child: Text(
                    //retrive the data using the variable.
                    '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('yMMMd').format(transactions[index].dateTime),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),

      /** List View Scroll View
     * 
     *     return ListView(
      children: transactions.map((e) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.purple,
                  width: 2,
                )),
                child: Text(
                  '\$ ${e.amount.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    e.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('yMMMd').format(e.dateTime),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
     */
    );
  }
}
