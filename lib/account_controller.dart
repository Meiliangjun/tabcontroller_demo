import 'package:flutter/material.dart';


class AccountControllerView extends StatelessWidget {

	const AccountControllerView({Key key}) : super(key: key);

	static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

	@override
	Widget build(BuildContext context) {
	  return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
              childCount: 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
          ),
        )
      ],
    );
    return Text('This is my information.', style: optionStyle);
  }
	
}
