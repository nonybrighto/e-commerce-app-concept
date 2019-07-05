import 'package:ecommerceui/widgets/custom_bottom_navigation_bar.dart';
import 'package:ecommerceui/widgets/dotted_slider.dart';
import 'package:ecommerceui/widgets/great_deal_item.dart';
import 'package:ecommerceui/models/product.dart';
import 'package:ecommerceui/widgets/top_slider_item.dart';
import 'package:ecommerceui/widgets/trending_item.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: Padding(
          padding: EdgeInsets.only(top: 12, left: 5, right: 5),
          child: _appBar(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_topSlider(), _trending(), _greatDeals()],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomNavigationBarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          CustomNavigationBarItem(
            icon: Icons.favorite,
            title: 'Wishlist',
          ),
          CustomNavigationBarItem(
            icon: Icons.shopping_cart,
            title: 'Cart',
          ),
          CustomNavigationBarItem(
            icon: Icons.person,
            title: 'Profile',
          ),
        ],
        onTap: (index) {
          print('The current Index is $index');
        },
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  _floatingActionButton() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: Color(0XFFcce5ff),
              borderRadius: BorderRadius.circular(50)),
          child: FloatingActionButton(
            elevation: 0,
            child: Icon(Icons.camera),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  _appBar() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        Spacer(),
        Icon(
          Icons.search,
          color: Colors.grey,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(Icons.notifications_active),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        )
      ],
    );
  }

  _topSlider() {
    return DottedSlider(
      maxHeight: 140,
      color: Colors.red,
      children: <Widget>[for (var i = 0; i < 5; i++) TopSliderItem()],
    );
  }

  _trending() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _headerText('Trending'),
            Text(
              'View all >>',
              style: TextStyle(color: Color(0XFF3398ff)),
            ),
          ],
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone 7 plus (128GB)',
                    icon: 'assets/iphone_7.png',
                    rating: 4.5,
                    remainingQuantity: 5,
                    price: '\$2,000'),
                gradientColors: [ Color(0XFFa466ec),  Colors.purple[400]],
              ),
             
              TrendingItem(
                product: Product(
                    company: 'Samsung',
                    name: 'Samsung S10 (128GB)',
                    icon: 'assets/samsung.png',
                    rating: 4.5,
                    price: '\$1,890'),
                gradientColors: [Color(0XFF6eed8c), Colors.green[400]],
              ),
             
              TrendingItem(
                product: Product(
                    company: 'Apple',
                    name: 'iPhone X (64GB)',
                    icon: 'assets/iphone_x.png',
                    rating: 3.5,
                    price: '\$2,890'),
                gradientColors: [Color(0XFFf28767), Colors.orange[400]],
              ),
             
            ],
          ),
        )
      ],
    );
  }

  _greatDeals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _headerText('Great Deals'),
        DottedSlider(
          maxHeight: 145,
          color: Color(0XFF83e4c2),
          children: <Widget>[for (var i = 0; i < 5; i++) GreatDealItem()],
        ),
      ],
    );
  }

  _headerText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
