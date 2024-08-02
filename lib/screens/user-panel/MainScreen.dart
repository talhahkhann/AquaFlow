import 'package:ecomproject/screens/user-panel/AllCategories.Screen.dart';
import 'package:ecomproject/screens/user-panel/AllFlashSaleProducts.Sceen.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:ecomproject/widgets/Banner.Widget.dart';
import 'package:ecomproject/widgets/Category.Widget.dart';
import 'package:ecomproject/widgets/CustomDrawer.Widget.dart';
import 'package:ecomproject/widgets/FlashSale.Widget.dart';
import 'package:ecomproject/widgets/Heading.Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../widgets/AllProduct.Widget.dart';
import 'AllProducts.Screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appbarColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppConstant.appbarColor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: Get.height / 90.0,
            ),

            //Banners
            BannerWidget(),
            HeadingWidget(
              headingtitle: 'Categories',
              headingsubtitle: 'According to your budget',
              onTap: () {
                Get.to(() => AllCategoriesScreen());
              },
              buttontext: 'See More >',
            ),
            CategoriesWidget(),

            HeadingWidget(
                headingtitle: 'Flash Sale',
                headingsubtitle: 'According to your budget ',
                onTap: () {
                  Get.to(() => AllFlashSaleProductsScreen());
                },
                buttontext: 'See More >'),
            FlashSaleWidget(),
            HeadingWidget(
                headingtitle: 'All Products',
                headingsubtitle: 'According to your budget',
                onTap: () {
                  Get.to(() => AllProductsScreen());
                },
                buttontext: 'See More >'),
            AllProductsWidget(),
          ],
        )),
      ),
    );
  }
}
