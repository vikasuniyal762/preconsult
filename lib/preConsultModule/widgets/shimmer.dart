
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:medongosupport/preConsultModule/consts/appColors.dart';
import 'package:medongosupport/preConsultModule/consts/screenSize.dart';
import 'package:shimmer/shimmer.dart';


///LOADING SHIMMER FOR FEED ITEMS
class ShimmerForLoading extends StatelessWidget {
  const ShimmerForLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColor.greyShimmer,
        highlightColor: AppColor.white,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index){
              return Column(
                children: [
                  const SizedBox(height: 10,),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    //tileColor: AppColor.primaryColor,
                    horizontalTitleGap: 10,
                    leading: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      margin: const EdgeInsets.only(top: 0),
                      //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      height: ScreenSize.height(context)* 0.15,
                      width: ScreenSize.width(context)* 0.15,
                    ),

                    title: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      margin: const EdgeInsets.only(top: 0),
                      //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      height: ScreenSize.height(context)* 0.02,
                      width: ScreenSize.width(context)* 0.75,
                    ),

                    subtitle: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      margin: const EdgeInsets.only(top: 10),
                      //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      height: ScreenSize.height(context)* 0.03,
                      width: ScreenSize.width(context)* 0.75,
                    ),

                    //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration:  BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    height: ScreenSize.height(context) * 0.25,
                  ),
                  const SizedBox(height: 10,),
                ],
              );
            })
    );
  }
}

