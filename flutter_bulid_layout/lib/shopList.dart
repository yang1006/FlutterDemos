import 'package:flutter/material.dart';

class Product{
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget{

  ShoppingListItem({this.product, this.inCart, this.onCartChanged});
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
      return new ListTile(
        onTap: () {onCartChanged(product, !inCart);},
        leading: new CircleAvatar(
          backgroundColor: _getColor(context),
          child: new Text(product.name[0]),
        ),
        title: new Text(product.name, style: _getTextStyle(context)),
      );
  }
}



//存储可变状态

class ShoppingList extends StatefulWidget{

  ShoppingList({Key key, this.products}) : super(key : key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}