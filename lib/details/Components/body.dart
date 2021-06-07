import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:medico/Components/rounded_icon_btn.dart';
import 'package:medico/Pages/shop/components/Product.dart';
import 'package:medico/details/Components/product_images.dart';
class Body extends StatelessWidget {

  final Product product;
  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductDescription(product: product);
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.04,
          ),
          child: TopRoundedContainer(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width*0.04,
                    vertical: MediaQuery.of(context).size.height*0.019,
                ),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
                  child: Text(product.description,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),

                  maxLines: 3,),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding:  EdgeInsets.all( MediaQuery.of(context).size.width*0.04),
                  child: Text("See More Details",
                    style: TextStyle(
                      color: Colors.blue[300],
                      fontSize: 15,
                    ),

                    maxLines: 3,),
                ),

              ],
            ),
          ),
        ), //Product Description
        SizedBox(height: 40,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              icon: Icon(FeatherIcons.shoppingCart),
             label: Text(
                "Add to Cart".toUpperCase(),
                style: TextStyle(fontSize: 15),
              ),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.red)
                      )
                  ),
              ),

              onPressed: (){},


            ),
          ),
        ), //Add to cart option
      ],
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({

    Key key,
    @required this.child,@required this.color,
    @required this.press,
  }) : super(key: key);
  final Widget child;
  final GestureTapCallback press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.02),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.02),
      width: double.infinity,
      //height: MediaQuery.of(context).size.width*0.70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )

      ),

    );
  }
}
