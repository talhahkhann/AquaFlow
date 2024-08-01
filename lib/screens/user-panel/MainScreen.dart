
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:ecomproject/widgets/Banner.Widget.dart';
import 'package:ecomproject/widgets/CustomDrawer.Widget.dart';
import 'package:ecomproject/widgets/Heading.Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.appSecondaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName),
        centerTitle: true,
        
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: Get.height/90.0,),
           

              //Banners
              BannerWidget(),
              HeadingWidget( headingtitle: 'Categories', headingsubtitle: 'According to your budget', onTap: (){

              },buttontext: 'See More >',),
            ],
          )
        ),
      ),
    );
  }
}
