import 'package:fake_store/common/style.dart';
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
      body: Column(
        children: [
          buildCard(),
          buildCard(),
          buildCard(),
        ],
      ),
    );
  }

  Widget buildCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(5),
          height: 160,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Image.network(
                      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                      width: 100,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: grayColor.withOpacity(0.6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        '\$55.99',
                        style: boldStyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Judul',
                        style: boldStyle.copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Icon(
                            Icons.star,
                            size: 16,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4.1',
                            style: boldStyle,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
