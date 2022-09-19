import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: Container(
        child: Card(
          child: Row(
            children: [
              Stack(children: [
                Image.network('')
              ],),
              Column()
            ],
          ),
        ),
      ),
    );
  }
}
