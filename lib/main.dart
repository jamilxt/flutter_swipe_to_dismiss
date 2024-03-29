import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MyApp is a StatefulWidget. This allows us to update the state of the
// Widget whenever an item is removed.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final items = List<String>.generate(3, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Dismissible(
                // MyApp is a StatefulWidget. This allows us to update the state of the
                // Widget whenever an item is removed.
                key: Key(item),
                // We also need to provide a function that tells our app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from our data source
                  setState(() {
                    items.removeAt(index);
                  });

                  // Then show a snackbar!
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed")));
                },
                // Show a red background as the item is swiped away
                background: Container(color: Colors.red),
                child: ListTile(title: Text('$item')),
              );
            }),
      ),
    );
  }
}
