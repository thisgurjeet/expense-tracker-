import 'package:expense_tracker/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'No Transactions added yet',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontFamily: 'OpenSans'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child:
                        Image(image: AssetImage('assets/images/waiting.png')))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text('₹${transactions[index].amount}')),
                          )),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () {
                          deleteTx(transactions[index].id);
                        },
                      )),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
