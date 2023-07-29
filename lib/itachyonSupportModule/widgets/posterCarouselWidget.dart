// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appImages.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';


class PosterCarouselWidgetTop extends StatefulWidget {
 const PosterCarouselWidgetTop({Key? key}) : super(key: key);

  @override
  State<PosterCarouselWidgetTop> createState() => _PosterCarouselWidgetTopState();
}



class _PosterCarouselWidgetTopState extends State<PosterCarouselWidgetTop> {

  CarouselSliderController? _sliderController;


  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  var posterList = [AppImages.bannerOne, AppImages.bannerTwo, AppImages.bannerThree ];


  @override
 Widget build(BuildContext context) {
   return Container(
     height: ScreenSize.height(context) * 0.2,
     child: ListView(
       children: <Widget>[
         Container(
           height: ScreenSize.height(context) * 0.2,
           child: CarouselSlider.builder(
             unlimitedMode: true,
             controller: _sliderController,
             slideBuilder: (index) {
               return Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: Image.asset(
                   posterList[index],
                   width: ScreenSize.width(context),

                   fit: BoxFit.fill,
                 ),
               );
             },
             slideTransform: const DefaultTransform(),
             itemCount: posterList.length,
             initialPage: 0,
             enableAutoSlider: true,
           ),
         ),
       ],
     ),
   );
 }
}




class PosterCarouselWidgetBottom extends StatefulWidget {
  const PosterCarouselWidgetBottom({Key? key}) : super(key: key);

  @override
  State<PosterCarouselWidgetBottom> createState() => _PosterCarouselWidgetBottomState();
}

class _PosterCarouselWidgetBottomState extends State<PosterCarouselWidgetBottom> {

  CarouselSliderController? _sliderController;


  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  var posterList = [AppImages.bannerFour, AppImages.bannerFive, AppImages.bannerSix ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        children: <Widget>[
          Container(
            height: 150,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              controller: _sliderController,
              slideBuilder: (index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    posterList[index],
                    width: ScreenSize.width(context),
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                );
              },
              slideTransform: const DefaultTransform(),
              itemCount: posterList.length,
              initialPage: 0,
              enableAutoSlider: true,
            ),
          ),
        ],
      ),
    );
  }
}



// posterObjects(context) {
//   var posterList = [AppImages.bannerOne, AppImages.bannerTwo, AppImages.bannerThree ];
//
//  final List<Widget> imageSliders = posterList
//      .map((item) => Padding(
//        padding: const EdgeInsets.only(left: 0.0,right: 0.0),
//        child: Image.asset(
//          item,
//          width: ScreenSize.width(context),
//          fit: BoxFit.fill,
//        ),
//      ))
//      .toList();
//
//  return Container(
//    width: ScreenSize.width(context),
//    padding: const EdgeInsets.only(top: 0),
//    child: CarouselSlider(
//      options: CarouselOptions(
//        autoPlay: false,
//        autoPlayInterval: const Duration(seconds: 3),
//        autoPlayAnimationDuration: const Duration(milliseconds: 2500),
//        aspectRatio: 3,
//        //enlargeFactor: 5,
//        //aspectRatio : 26/5,
//        enlargeCenterPage: false,
//        disableCenter: false,
//        scrollPhysics: const BouncingScrollPhysics(),
//        enlargeStrategy: CenterPageEnlargeStrategy.scale,
//      ),
//      items: imageSliders,
//    ),
//  );
//
// }
