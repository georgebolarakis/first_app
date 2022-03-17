import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import 'widgets/chart.dart';

//void main() => runApp(MyApp());

void main() {
  //we need to set this method in order fo the SystemChrome to run
  // WidgetsFlutterBinding.ensureInitialized();
  //we need to add systemchrome to be able to set application wide or system wide settings for our app
  //in this case we allow the use of the app in portrait mode
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  subtitle1: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
          //the transaction is after today minus 7 days
          (tx) => tx.date.isAfter(
            DateTime.now().subtract(
              Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime txChosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: txChosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  //we need to be able to delete the transaction
  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  //we will add two methods that will handle the portrait/landscape instead of
  //having them in our build method

  Widget _buildLandscapeContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Show Chart",
          style: Theme.of(context).textTheme.headline6,
        ),
        //we are seting the switch to be adaptive for iOS
        Switch.adaptive(
          //so we can use our defined colors on iOS also
          activeColor: Theme.of(context).accentColor,
          value: _showChart,
          onChanged: (val) {
            setState(() {
              _showChart = val;
            });
          },
        )
      ],
    );
  }

  Widget _buildPortraitContent(MediaQueryData MediaQuery, AppBar appBar) {
    return Container(
      //we are deducting the height of the appBar here
      //we managed to do that by adding the AppBar in a variable above
      //we are also deducting the pading from the top with the second -
      height: (MediaQuery.size.height -
              appBar.preferredSize.height -
              MediaQuery.padding.top) *
          0.25,
      child: Chart(_recentTransactions),
    );
  }

  Widget _buildAppBar() {}

  @override
  Widget build(BuildContext context) {
    //for testing purposes
    print("build() MyHomePage state");

    //we are storing the mediaQuery in a variable
    final mediaQuery = MediaQuery.of(context);
    //we need to find in which mode we are
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    //we are assigning the AppBar configuration in a variable and we call it in our scafold
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Personal Expenses',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(
              'Personal Expenses',
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          );

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.6,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    //we need to store the body of the scaffold inside a variable so we can re-use it
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //we are adding a switch for landscape mode to choose btw list or chart
            //but first we need to wrap in in a Row to add some labels
            if (isLandscape) _buildLandscapeContent(),

            //we are checking if we are in portrait mode
            // ignore: sdk_version_ui_as_code
            if (!isLandscape) _buildPortraitContent(mediaQuery, appBar),

            if (!isLandscape) txListWidget,
            //chart needs our recent transactions
            //we check if _showChart is true
            // ignore: sdk_version_ui_as_code
            if (isLandscape)
              _showChart
                  ? Container(
                      //we are deducting the height of the appBar here
                      //we managed to do that by adding the AppBar in a variable above
                      //we are also deducting the pading from the top with the second -
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.6,
                      child: Chart(_recentTransactions),
                    )
                  //otherwise _showChart is false hence saw the list
                  : txListWidget,
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            //we need to run a check on which platform we are running
            //we import dart.io on the top and we run Platform. method
            floatingActionButtonLocation: //Platform.isIOS
                //? Container()
                //:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          );
  }
}
