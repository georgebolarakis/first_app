import "package:flutter/material.dart";

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    //we are adding the layoutbuilder widget
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            //we need to make this text shrink in case it is too big so it can look better
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text("\£${spendingAmount.toStringAsFixed(0)}"),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              //we are calculating the height and width according to the constraints option in our LayoutBuilder method
              //it gets 60% of the available height
              height: constraints.maxHeight * 0.6,
              width: 10,
              //we need to have a background that is partially filled
              child: Stack(
                children: <Widget>[
                  //the first widget is the bottom most
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //allows us to create a box that is sized as a fraction of another value
                  //in our case based on the percentage of the total amount
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            )
          ],
        );
      },
    );
  }
}
