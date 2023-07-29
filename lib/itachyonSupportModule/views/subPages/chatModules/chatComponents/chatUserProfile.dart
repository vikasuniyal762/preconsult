// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:medongo/constants/appColors.dart';
// import 'package:medongo/models/chatModels/chatMessages.dart';
// import 'package:medongo/widgets/appBar.dart';
// import 'package:medongo/widgets/texts.dart';
//
// class ChatUserProfileView extends StatefulWidget {
//   ChatUserProfileView({
//     Key? key,
//     required this.chatUsers,
//   }) : super(key: key);
//
//   ChatUsers? chatUsers;
//
//   @override
//   State<ChatUserProfileView> createState() => _ChatUserProfileViewState();
// }
//
// class _ChatUserProfileViewState extends State<ChatUserProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//           color: AppColor.tertiaryColor.withOpacity(0.2),
//         ),
//         child: Scaffold(
//           appBar: titleAppBarWithBackButton(
//             context: context,
//             leading: Padding(
//               padding: const EdgeInsets.only(right: 0.0),
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.cancel_outlined,
//                   color: AppColor.primaryColor,
//                 ),
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: AppColor.primaryColor,
//                       backgroundImage: widget.chatUsers!.avatar != ''
//                           ? NetworkImage(widget.chatUsers!.avatar)
//                           : null, // Set to null if avatar is empty
//                       child: widget.chatUsers!.avatar == ''
//                           ? Icon(
//                               Icons.person,
//                               color: AppColor.primaryColor,
//                             )
//                           : null,
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         chatUsersProfile(
//                             header: "Name:", text: widget.chatUsers!.name),
//                       ],
//                     ),
//                     SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         chatUsersProfile(
//                             header: "Work Position:",
//                             text: widget.chatUsers!.workPosition),
//                       ],
//                     ),
//                     const Divider(
//                       height: 20.0,
//                       thickness: 2,
//                     ),
//
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       margin: const EdgeInsets.only(bottom: 8.0),
//                       decoration: BoxDecoration(
//                           color: AppColor.green.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(10.0)),
//                       child: Row(
//                         children: [
//                           regularText(
//                               context: context,
//                               text: 'General',
//                               fontWeight: FontWeight.w500,
//                               fontSize: 20.0),
//                         ],
//                       ),
//                     ),
//
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         chatUsersProfile(
//                             header: "First Name:",
//                             text: widget.chatUsers!.firstName),
//                       ],
//                     ),
//
//                     SizedBox(height: 18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         chatUsersProfile(
//                             header: "Last Name:",
//                             text: widget.chatUsers!.lastName),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       margin: const EdgeInsets.only(bottom: 8.0),
//                       decoration: BoxDecoration(
//                           color: AppColor.green.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(10.0)),
//                       child: Row(
//                         children: [
//                           regularText(
//                               context: context,
//                               text: 'More',
//                               fontWeight: FontWeight.w500,
//                               fontSize: 20.0),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         chatUsersProfile(
//                             header: "Gender:",
//                             text: widget.chatUsers!.gender),
//                       ],
//                     ),
//                     SizedBox(height: 18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         chatUsersProfile(
//                             header: "Birthday:",
//                             text: widget.chatUsers!.birthday),
//                       ],
//                     ),
//                     SizedBox(height: 18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         chatUsersProfile(
//                             header: "Status:",
//                             text: widget.chatUsers!.status),
//                       ],
//                     ),
//                     // SizedBox(height: 12,),
//
//                     // Container(
//                     //   decoration: BoxDecoration(
//                     //     color: AppColor.tertiaryColor.withOpacity(0.2),
//                     //   ),
//                     //   child: Row(
//                     //     children: [
//                     //       regularText(
//                     //           context: context,
//                     //           text: 'More',
//                     //           fontWeight: FontWeight.w500,
//                     //           fontSize: 20.0),
//                     //     ],
//                     //   ),
//                     // ),
//                     // SizedBox(height: 8),
//                     // chatUsersProfile(
//                     //     header: "Gender:", text: widget.chatUsers!.gender),
//                     // Divider(
//                     //   thickness: 1,
//                     // ),
//                     // SizedBox(height: 16),
//                     // chatUsersProfile(
//                     //     header: "Birthday:", text: widget.chatUsers!.birthday),
//                     // Divider(
//                     //   thickness: 1,
//                     // ),
//                     // SizedBox(height: 8),
//                     // chatUsersProfile(
//                     //     header: "Work Position:",
//                     //     text: widget.chatUsers!.workPosition),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
