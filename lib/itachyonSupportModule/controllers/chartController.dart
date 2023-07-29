import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/models/ticketModel.dart';
import 'package:medongosupport/itachyonSupportModule/services/ticketServices.dart';
final ITChartController chartController = Get.find<ITChartController>();

class ITChartController extends GetxController {
  RxBool isCreateTicketLoading = false.obs;
  RxBool isAnalyticsPageLoading = false.obs;
  RxInt touchedIndex = (-1).obs;

  ///INSTANCE OF TICKET SERVICE
  TicketService ticketService = TicketService();

  ///LIST OF ALL THE TICKETS FOR THIRTY DAYS
  List<Ticket>? allTicketsCharts;

  List<Ticket>? pendingTickets;
  List<Ticket>? inProgressTickets;
  List<Ticket>? closedTickets;


  ///LIST OF ALL TICKETS FOR SEVEN DAYS
 List <Ticket>? allTicketsChartsSevenDays;


  ///FILTERED TICKETS FOR EACH DAY
  List<Ticket>? ticketsMonday;
  List<Ticket>? ticketsTuesday;
  List<Ticket>? ticketsWednesday;
  List<Ticket>? ticketsThursday;
  List<Ticket>? ticketsFriday;
  List<Ticket>? ticketsSaturday;
  List<Ticket>? ticketsSunday;


  List<int> ticketsInfoCountForPieChart = [];


  updateLoadingStatusAnalyticsPage() async {
    isAnalyticsPageLoading.value = true;
    update();
  }

  resetLoadingStatusAnalyticsPage() async {
    isAnalyticsPageLoading.value = false;
    update();
  }

  ///FETCH ALL TICKETS LAST SEVEN DAYS
  Future getAllTicketLastSevenDays() async {
    try {
      allTicketsChartsSevenDays = await ticketService.getTicketsDataFromInternetForCharts();
        update();
        return true;
    } catch (error) {
      debugPrint("UNABLE TO FETCH TICKETS1: $error");
    }
  }


  ///FILTERING DATA FOR WEEKLY CHARTS
  Future filterDataForWeeklyCharts() async {
   if(allTicketsChartsSevenDays?.length != 0 ){
     for (Ticket ticket in allTicketsChartsSevenDays!) {

       switch (DateTime.parse(ticket.createdAt).weekday) {
         case DateTime.monday:
           ticketsMonday?.add(ticket);
           break;
         case DateTime.tuesday:
           ticketsTuesday?.add(ticket);
           break;
         case DateTime.wednesday:
           ticketsWednesday?.add(ticket);
           break;
         case DateTime.thursday:
           ticketsThursday?.add(ticket);
           break;
         case DateTime.friday:
           ticketsFriday?.add(ticket);
           break;
         case DateTime.saturday:
           ticketsSaturday?.add(ticket);
           break;
         case DateTime.sunday:
           ticketsSunday?.add(ticket);
           break;
         default:
           break;
       }


     }
   }
    update();

   return true;
  }

  ///GET ALL TICKETS LAST 30 DAYS.
  Future getAllTicketsLastThirtyDays() async {
    int page = 1;

    try {
      allTicketsCharts = await ticketService.getTicketsDataFromInternetForChartsMonthly();
      update();
      return true;
    } catch (error) {
      debugPrint("UNABLE TO FETCH TICKETS: $error");
    }
  }



  ///FILTERING DATA FOR WEEKLY CHARTS
   Future filterDataForMonthlyCharts() async{

    if(allTicketsCharts?.length != 0 ){
      for (Ticket ticket in allTicketsCharts!) {

        print("THIS IS TESTING TICKET STATUS ${ticket.status}");

        switch (ticket.status) {
          case 2:
            pendingTickets?.add(ticket);
            break;
          case 3:
            inProgressTickets?.add(ticket);
            break;
          case 5:
            closedTickets?.add(ticket);
            break;

          default:
            break;
        }
      }
    }


    update();
    return true;

  }

  ///CLEARS ALL THE FIELDS
  clearAllTheTicketsData() {
    allTicketsCharts = [];
    allTicketsChartsSevenDays =  [];
    pendingTickets = [];
    inProgressTickets = [];
    closedTickets = [];
    ticketsMonday = [];
    ticketsTuesday = [];
    ticketsWednesday = [];
    ticketsThursday = [];
    ticketsFriday = [];
    ticketsSaturday = [];
    ticketsSunday = [];
    update();
  }
}










