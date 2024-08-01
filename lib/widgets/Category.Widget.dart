import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomproject/models/Category.Model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('categories').get(),
      builder: (BuildContext context ,  AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Center(child: Text('Error'));
        }

        if(snapshot.connectionState == ConnectionState.waiting){
          return Container(
            height: Get.height/5,
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );

        }
        if(snapshot.data!.docs.isEmpty){
          return Center(
            child: Text('No Category Found'),
          );
        }
        if(snapshot.data != null){
          return Container(
            height: Get.height / 6,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context , index)
              
              {

                CategoriesModel(categoryId: snapshot,categoryImg: ,categoryName: ,createdAt: ,updatedAt: );
                return Row(
                  children: [
                      Padding(padding: EdgeInsets.all(5.0),
                      child: Container(
                        child:FillImageCard(
  width: 200,
  heightImage: 140,
  imageProvider: AssetImage(''),
  
  title: Text('Category'),
  description: Text(''),
), 
                      ),
                      )
                  ],
                );


                    
            }),
          );
        }
      },
    );
  }
}