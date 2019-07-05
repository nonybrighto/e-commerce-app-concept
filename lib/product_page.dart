import 'package:ecommerceui/models/product.dart';
import 'package:ecommerceui/widgets/custom_expansion_tile.dart';
import 'package:ecommerceui/widgets/dotted_slider.dart';
import 'package:ecommerceui/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductPage extends StatelessWidget {

  final Product product;

  ProductPage({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: <Widget>[
          Container(
            color: Color(0XFFf4f7fa),
          ),
          SingleChildScrollView(
                  child: Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.favorite_border, color: Colors.grey,),
                          onPressed: (){

                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          DottedSlider(
                            color: Colors.blue,
                            maxHeight: 250,
                            children: <Widget>[
                                  _productSlideImage(product.icon),
                                  _productSlideImage(product.icon),
                                  _productSlideImage(product.icon),
                                  _productSlideImage(product.icon),
                            ],
                          ),
                          _productDetails(product),
                          
                          CustomExpansionTile(
                    title: Text('Specifications', style: TextStyle(color: Colors.blue)),
                    iconColor: Colors.blue,
                    children: <Widget>[Text('Nothing on the UI biko! :-) ')],
                  ),
                          _purchaseButtons(),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _productDetails(Product product){

    return Column(
       mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(product.company, style: TextStyle(fontSize: 20, color: Color(0XFFb1bdef)),),
        SizedBox(height: 10,),
        Text(product.name, style: TextStyle(fontSize: 25),),
        SizedBox(height: 10,),
        Row(children: <Widget>[
          StarRating(rating:product.rating, size: 20,),
          SizedBox(width: 10,),
          Text('(375 Reviews)', style: TextStyle(color: Colors.grey[400]),)
        ],),
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
          Text(product.price, style: TextStyle(fontSize: 27,  fontWeight: FontWeight.bold,color: Color(0XFF85c2ff))),
          SizedBox(width: 10,),
          Text('\$80.00', style: TextStyle(color: Colors.grey, fontSize: 15, decoration: TextDecoration.lineThrough),)
        ],),
        SizedBox(height: 10,),
        _miniSpecDetails(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text('Brand warranty 1 year'),
          Text('10 days replacement'),
        ],),
        SizedBox(height: 10,),
          Text('EMI options available'),


    ],);
  }

  _miniSpecDetails(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
          _miniSpecDetail('Jet Black', 'Color(3)'),
          SizedBox(width: 10,),
          _miniSpecDetail('128 GB', 'Storage(3)'),
          SizedBox(width: 10,),
          _miniSpecDetail('3 GB', 'RAM'),
      ],
    );
  }
  _miniSpecDetail(String title, String subTitle){

        return Expanded(
                  child: Container(
            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
               mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(subTitle, style: TextStyle(fontSize: 13, color: Colors.grey),)
              ],
            ),
          ),
        );
  }

  _purchaseButtons(){
      return Row(children: <Widget>[
            Expanded(
                          child: OutlineButton(child: Text('Add to cart'),
                          color: Colors.blue, textColor: Colors.blue, onPressed: (){

              },),
            ),
            SizedBox(width: 20,),
            Expanded(
                          child: FlatButton(child: Text('Buy now'),  textColor: Colors.white, color: Colors.blue, onPressed: (){
                
              }),
            ),
      ],);
  }

  _productSlideImage(String imageUrl){

    return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.contain)
          ),
    );
  }
}