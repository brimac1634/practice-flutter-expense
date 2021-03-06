import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text('No Transactions Added Yet',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                );
              })
            : ListView(
                children: transactions
                    .map((trx) => TransactionItem(
                        key: ValueKey(trx.id),
                        transaction: trx,
                        deleteTransaction: deleteTransaction))
                    .toList(),
              ));
  }
}
