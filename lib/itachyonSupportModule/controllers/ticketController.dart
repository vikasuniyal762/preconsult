import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medongosupport/itachyonSupportModule/models/ticketModel.dart';
import 'package:medongosupport/itachyonSupportModule/services/ticketServices.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/toastMessage.dart';

final ITTicketController ticketController = Get.find<ITTicketController>();

class ITTicketController extends GetxController {
  RxBool isCreateTicketLoading = false.obs;

  FocusNode titleNode = FocusNode(),
      descriptionNode = FocusNode();

  TextEditingController titleController = TextEditingController(),
      descriptionController = TextEditingController();

  TicketService ticketService = TicketService();

  var rand = Random();

  ///LIST OF ALL THE TICKETS
  List<Ticket>? allTickets;
  List<Ticket>? pendingTickets;
  List<Ticket>? inProgressTickets;
  List<Ticket>? closedTickets;







  ///CLEAR ALL ADD TICKET FIELDS
  clearAllAddTicketFields(){
    titleController.clear();
    descriptionController.clear();
    update();
  }



  ///ADD TICKET
  Future<void> addTask() async {

    if(titleController.text.isEmpty){
      showToast(message: "Please enter title", gravity: ToastGravity.TOP);
    }

    try {
      var status = await ticketService.createTicket(
        title : titleController.text, description : descriptionController.text,
      );

      if (status) {
        clearAllAddTicketFields();
        showToast(message: "Ticket Created", gravity: ToastGravity.TOP);
        Get.back();
      }

      update();
      debugPrint("create ticket: $status");
    } catch (error) {
      // SHOW AN ERROR
      debugPrint("UNABLE TO CREATE TICKET TASK: $error");
    }
  }


  ///UPDATES TICKET LOADING STATUS IN ADD TICKET PAGE TO TRUE
  updateCreateTicketLoadingStatus() async {
    isCreateTicketLoading.value = true;
    update();
  }

  ///UPDATES TICKET LOADING STATUS IN ADD TICKET PAGE TO FALSE
  resetCreateTicketLoadingStatus() async {
    isCreateTicketLoading.value = false;
    update();
  }

  ///DATE FORMATTER
  formatDateForTickets({String? dateString}) {
    DateFormat format = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
    DateTime date = format.parse(dateString!);

    final formattedDate =

        ///CHECKS IF THE GIVEN DATE IS OLDER THAN 7 DAYS
        date.isBefore(DateTime.now().subtract(const Duration(days: 7)))
            ?

            ///DATE FORMAT - Jan 26 2023
            DateFormat().add_yMMMd().format(date)
            :

            ///CHECKS IF THE GIVEN DATE IS OLDER THAN 24 HOURS
            date.isBefore(DateTime.now().subtract(const Duration(hours: 24)))
                ?

                ///DATE FORMAT - Jan 26
                DateFormat().add_MMMd().format(date)
                :

                ///DATE FORMAT - 12:00 AM/PM
                DateFormat().add_jm().format(date);

    return formattedDate.toString();
  }

  ///CALLS DATABASE FUNCTION AND UPDATES "all pending ticket" VALUE AFTER FETCHING THE DATA
  getAllPendingTickets() async {
    try {
      pendingTickets = await ticketService.getTicketsFromInternetByStatus(status : 2);
      update();
      return pendingTickets;
    } catch (error) {
      debugPrint("UNABLE TO FETCH TICKETS: $error");
    }
  }

  ///CALLS DATABASE FUNCTION AND UPDATES "all progress ticket" VALUE AFTER FETCHING THE DATA
  getAllProgressTickets() async {
    try {
      inProgressTickets = await ticketService.getTicketsFromInternetByStatus(status : 3);
      update();
      return inProgressTickets;
    } catch (error) {
      debugPrint("UNABLE TO FETCH TICKETS: $error");
    }
  }

  ///CALLS DATABASE FUNCTION AND UPDATES "all closed tickets" VALUE AFTER FETCHING THE DATA
  getAllClosedTickets() async {
    try {
      closedTickets = await ticketService.getTicketsFromInternetByStatus(status : 5);
      update();

      return closedTickets;
    } catch (error) {
      debugPrint("UNABLE TO FETCH TICKETS: $error");
    }
  }



  ///GET ALL TICKET REPORT
  getAllTicketReports() async {
    try {
      allTickets = await ticketService.getTicketReportsMainDataFromInternet();

      update();

      return allTickets;
    } catch (error) {
      debugPrint("UNABLE TO FETCH TICKETS: $error");
    }
  }
}
