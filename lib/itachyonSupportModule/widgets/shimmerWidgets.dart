import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:shimmer/shimmer.dart';


///LOADING SHIMMER FOR FEED ITEMS
class ShimmerForFeedItems extends StatelessWidget {
  const ShimmerForFeedItems({Key? key}) : super(key: key);

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


///LOADING SHIMMER FOR CHAT ITEMS
class ShimmerForChats extends StatelessWidget {
  const ShimmerForChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColor.greyShimmer,
        highlightColor: AppColor.white,
        child: ListView.builder(
            itemCount : 10,
            itemBuilder: (context, index){
              return ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
                //tileColor: AppColor.primaryColor,
                horizontalTitleGap: 10,
                leading: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.15,
                  width: ScreenSize.width(context)* 0.15,
                ),

                title: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.white,
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
              );
            })
    );
  }
}













class ShimmerForAddressBar extends StatelessWidget {
  const ShimmerForAddressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: AppColor.greyShimmer,
          highlightColor: AppColor.white,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.only(top: 0),
            //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            height: 60,
            width: ScreenSize.width(context)* 1.00,
          ),
        ),
      ],
    );
  }
}

class ShimmerForPoster extends StatelessWidget {
  const ShimmerForPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: AppColor.greyShimmer,
          highlightColor: AppColor.white,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.only(top: 10),
            //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            height: ScreenSize.height(context)* 0.2,
            width: ScreenSize.width(context)* 0.9,
          ),
        ),
      ],
    );
  }
}









class ShimmerForProduct extends StatelessWidget {
  const ShimmerForProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.greyShimmer,
      highlightColor: AppColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            width:ScreenSize.width(context)*0.95,
            height: ScreenSize.height(context)*0.075,
            color: Colors.white,

          ),



          Container(
            margin: EdgeInsets.only(top: 10),
            width:ScreenSize.width(context)*0.95,
            height: ScreenSize.height(context)*0.075,
            color: Colors.white,

          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            width:ScreenSize.width(context)*0.95,
            height: ScreenSize.height(context)*0.075,
            color: Colors.white,

          ),


          Container(
            margin: EdgeInsets.only(top: 10),
            width:ScreenSize.width(context)*0.95,
            height: ScreenSize.height(context)*0.075,
            color: Colors.white,

          ),
        ],
      ),
    );
  }
}







