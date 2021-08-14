import 'package:flutter/material.dart';
import 'package:fav_helper/fav_helper.dart';

Future<void> main() async {
  await FavHelper.boot();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FavWidget(
              itemKey: 'items',
              id: '1',
              builder: (context, isFav) => Text(
                isFav.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FavHelper.toggle('items', '1'),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// class Item extends StatelessWidget {
//   const Item({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print('rebuilded');
//     return Text(
//       FavHelper.isFav('items', '1').toString(),
//       style: Theme.of(context).textTheme.headline4,
//     );
//   }
// }
