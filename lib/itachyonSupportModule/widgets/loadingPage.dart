//
// import 'package:flutter/material.dart';
// import 'package:loading_animations/loading_animations.dart';
//
//
//
// class LoadingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: <Widget>[
//
//             SliverPadding(padding: EdgeInsets.only(top: size.height/4)),
//
//             SliverToBoxAdapter(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: LoadingBouncingLine.square(
//                       size: 60.0,
//                       backgroundColor: AppColor.primaryColor,
//                       borderColor: AppColor.primaryColor,
//                       duration: Duration(milliseconds: 500),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         )
//     ),);
//   }
// }
//
//
