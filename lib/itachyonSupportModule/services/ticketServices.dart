import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medongosupport/itachyonSupportModule/constants/appConst.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:medongosupport/itachyonSupportModule/models/ticketModel.dart';

class TicketService {

  ///EMPTY TICKETS TO RETURN LENGTH - 0
  List<Ticket> tickets = [];


  ///CREATE TICKET
  Future<dynamic> createTicket({
    required String title,
    required String description,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${itUserController.userPrefsModel.accessToken}',
    };
    ///AUTH URL
    Uri url = Uri.https(AppConst.domainLogin, '/addTask');


   var body = json.encode({
      "title": title,
      "description": description,
    });


    try{
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      ///DECODES RESPONSE BODY
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    }catch(error) {
      debugPrint("$error");
    }
  }


  ///GET PENDING, IN PROGRESS AND CLOSED TICKETS LIST
  Future getTicketsFromInternetByStatus({required int status}) async {

    var headers = {
      'Authorization': 'Bearer ${itUserController.userPrefsModel.accessToken}',
    };


    ///GETS CURRENT USER INFO FROM THE INTERNET
    Uri url = Uri.https(AppConst.domainLogin, '/tasks/status/$status');


    try {
      final response = await http.get(url,headers: headers);
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        return ticketsFromJson(responseBody);
      }
      else {
        return tickets;
      }
    } catch (error) {
      debugPrint("ERROR IN FETCHING TICKETS: $error");
    }
  }

  ///GET TICKETS FOR REPORT
  Future getTicketReportsMainDataFromInternet() async {

    ///HEADERS
    var headers = {
      'Authorization': 'Bearer ${itUserController.userPrefsModel.accessToken}',
    };

    ///URL
    Uri url = Uri.https(AppConst.domainLogin, '/tasks');


    try {
      final response = await http.get(url,headers: headers);
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        return ticketsFromJson(responseBody['data']);
      }
      else {
        //showToast(message: "${responseBody["Error"]}", gravity: ToastGravity.BOTTOM);
        return tickets;
      }
    } catch (error) {
      debugPrint("ERROR IN FETCHING TICKETS: $error");
    }
  }

  ///GET PENDING - IN PROGRESS - CLOSED TICKETS FOR CHARTS
  getTicketsDataFromInternetForCharts() async {



    ///HEADERS
    var headers = {
      'Authorization': 'Bearer ${itUserController.userPrefsModel.accessToken}',
    };

    ///URL
    Uri url = Uri.https(AppConst.domainLogin, '/getTaskDataLast7Days');


    try {
      final response = await http.get(url,headers: headers);
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
         return ticketsFromJson(responseBody['data']);
      }
      else {
        //showToast(message: "${responseBody["Error"]}", gravity: ToastGravity.BOTTOM);
        return tickets;
      }
    } catch (error) {
      debugPrint("ERROR IN FETCHING TICKETS: $error");
    }
  }

  ///GET PENDING - IN PROGRESS - CLOSED TICKETS FOR  MONTHLY  CHARTS
  getTicketsDataFromInternetForChartsMonthly() async {

    ///HEADERS
    var headers = {
      'Authorization': 'Bearer ${itUserController.userPrefsModel.accessToken}',
    };

    ///URL
    Uri url = Uri.https(AppConst.domainLogin, '/getTaskDataLast30Days');

    try {
      final response = await http.get(url,headers: headers);
      final responseBody = json.decode(response.body);

      if (response.statusCode == 200) {
        return ticketsFromJson(responseBody['data']);
      }
      else {
        //showToast(message: "${responseBody["Error"]}", gravity: ToastGravity.BOTTOM);
        return tickets;
      }
    } catch (error) {
      debugPrint("ERROR IN FETCHING TICKETS: $error");
    }
  }
}