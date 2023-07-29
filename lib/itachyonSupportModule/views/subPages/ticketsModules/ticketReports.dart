import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:medongosupport/itachyonSupportModule/constants/appColors.dart';
import 'package:medongosupport/itachyonSupportModule/constants/screenSize.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/homeController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/ticketController.dart';
import 'package:medongosupport/itachyonSupportModule/controllers/userController.dart';
import 'package:get/get.dart';
import 'package:medongosupport/itachyonSupportModule/models/ticketModel.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/appBar.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/shimmerWidgets.dart';
import 'package:medongosupport/itachyonSupportModule/widgets/texts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:readmore/readmore.dart';

class TicketReports extends StatefulWidget {
  const TicketReports({Key? key}) : super(key: key);

  @override
  State<TicketReports> createState() => _TicketReportsState();
}

class _TicketReportsState extends State<TicketReports> {
  //INITIALIZE PAGE WITH USER DATA
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ///GETS CURRENT USER DATA WHICH IS SAVED IN GET STORAGE ( SHARED PREFERENCES )
      itUserController.getDataFromPrefs();

      ///GETS CURRENT USER INFO FROM THE INTERNET
      itUserController.getCurrentUserInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        // Handle no network connection
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No Network Connection'),
            content: Text('loading.....'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
    return SafeArea(
      child: Obx(
        () => LoadingOverlay(
          color: AppColor.white,
          opacity: 1.0,
          progressIndicator: LoadingBouncingGrid.square(
            size: 75.0,
            backgroundColor: AppColor.primaryColor,
            borderColor: AppColor.primaryColor,
            duration: const Duration(milliseconds: 1000),
          ),
          isLoading: homeController.isHomeLoading.value,
          child: SafeArea(
            child: Scaffold(
              appBar: titleAppBarWithBackButton(
                context: context,
              ),
              backgroundColor: AppColor.white,
              body: const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: TicketsListView(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///CLASS OF TICKET LIST TICKET VIEW
class TicketsListView extends StatefulWidget {
  const TicketsListView({
    Key? key,
  }) : super(key: key);

  @override
  State<TicketsListView> createState() => _TicketsListViewState();
}

class _TicketsListViewState extends State<TicketsListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ticketController.getAllTicketReports(),
      builder: (context, snapshot) {

        if (ticketController.allTickets?.length == 0) {
          return const NoTicketsErrorPage(); // Show an error message if fetching fails
        }


        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: ticketController.allTickets?.length,
            itemBuilder: (context, index) {
              Ticket ticket = ticketController.allTickets![index];
              return ListBodyForTicket(ticket: ticket);
            },
          );
        } // Show a message when there are no tickets or null data

        return const ShimmerForChats(); //
      }
    );

  }
}

///LIST BODY SHOWING TICKET DETAILS
class ListBodyForTicket extends StatefulWidget {
  ListBodyForTicket({Key? key, required this.ticket}) : super(key: key);
  Ticket ticket;

  @override
  State<ListBodyForTicket> createState() => _ListBodyForTicketState();
}

class _ListBodyForTicketState extends State<ListBodyForTicket> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 1.0,
        child: ListTile(

          minVerticalPadding: 5.0,

          shape: const Border(
              left: BorderSide(
                  color: AppColor.primaryColor,
                  style: BorderStyle.solid,
                  width: 5.0)),

          leading: const Icon(
            Icons.task_alt_sharp,
            color: AppColor.primaryColor,
            size: 25.0,
          ),

          title: Padding(
            padding: const EdgeInsets.only(left: 2.5, top: 5,bottom: 0.0),
            child: titleText(
                context: context,
                text: widget.ticket.title,
                maxLines: 2,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
                fontSize: 16.0
            ),
          ),

          subtitle: ReadMoreText(
            widget.ticket.description,
            trimLines:2,
            textAlign: TextAlign.start,
            colorClickableText : AppColor.primaryColor,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),


        ),
      ),
    );

  }
}


///NO TICKET ERROR PAGE
class NoTicketsErrorPage extends StatelessWidget {
  const NoTicketsErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: ScreenSize.height(context) * 0.25),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task_alt,
                    size: 75.0,
                    color: AppColor.primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Text(
                      'NO TICKETS RAISED',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackMild),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
