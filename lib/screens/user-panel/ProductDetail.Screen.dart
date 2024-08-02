import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomproject/models/Product.Model.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel? productModel;
  ProductDetailScreen({super.key, required ProductModel productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appbarColor,
        title: Text('Product Details'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),

                //Product Images
                child: CarouselSlider(
                    items: widget.productModel!.productImages
                        .map(
                          (imageUrls) => ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              imageUrl: imageUrls,
                              fit: BoxFit.cover,
                              width: Get.width - 10,
                              placeholder: (context, url) => ColoredBox(
                                color: Colors.white,
                                child: Center(
                                  child: CupertinoActivityIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        aspectRatio: 2.5,
                        viewportFraction: 1,
                        enlargeCenterPage: true)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
