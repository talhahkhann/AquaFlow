import 'package:ecomproject/utils/AppConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String headingtitle;
  final String headingsubtitle;
  final VoidCallback onTap;
  final String  buttontext;
   HeadingWidget({super.key,required this.headingtitle,required this.headingsubtitle,required this.onTap,required this.buttontext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
      child: Padding(padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(headingtitle,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800),),
              Text(headingsubtitle,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 12.0),),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: AppConstant.appbarColor, width: 1.5)),
          child:Padding(padding: EdgeInsets.all(8.0),
          child:Text('See more >',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.0,color: AppConstant.appbarColor),)
          ) ,
          ),
        )
      ],),
      ),
    );
  }
}