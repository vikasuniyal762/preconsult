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

class ManageTickets extends StatefulWidget {
  const ManageTickets({Key? key}) : super(key: key);
  @override
  State<ManageTickets> createState() => _ManageTicketsState();
}

class _ManageTicketsState extends State<ManageTickets> {
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
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
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
                    height: 100.0,
                    tabBars: const TabBar(
                        isScrollable: true,
                        labelColor: AppColor.primaryColor,
                        indicatorColor: AppColor.primaryColor,
                        indicatorWeight: 5.0,
                        tabs: [
                          Tab(
                            text: 'PENDING TICKET',
                          ),
                          Tab(
                            text: 'IN PROGRESS',
                          ),
                          Tab(
                            text: 'CLOSED TICKET',
                          ),
                        ])),
                backgroundColor: AppColor.white,
                body: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TabBarView(
                    children: [
                      pendingTasks(),
                      inProgressTasks(),
                      closedTasks()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///WIDGET FOR PENDING TICKET
Widget pendingTasks() {
  return Center(
      child: FutureBuilder(
          future: ticketController.getAllPendingTickets(),
          builder: (context, snapshot) {
            if (ticketController.pendingTickets?.length == 0) {
              return const NoTicketsErrorPage(); // Show an error message if fetching fails
            }


            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: ticketController.pendingTickets?.length,
                itemBuilder: (context, index) {
                  Ticket ticket = ticketController.pendingTickets![index];
                  return ListBodyForTicket(ticket: ticket);
                },
              );
            }

            if (snapshot.hasError) {
              return const NoTicketsErrorPage();
            }

            return const ShimmerForChats(); //
          }));
}

///WIDGET FOR PROGRESS TICKET
Widget inProgressTasks() {
  return Center(
      child: FutureBuilder(
          future: ticketController.getAllProgressTickets(),
          builder: (context, snapshot) {
            if (ticketController.inProgressTickets?.length == 0) {
              return const NoTicketsErrorPage(); // Show an error message if fetching fails
            }


            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: ticketController.inProgressTickets?.length,
                itemBuilder: (context, index) {
                  Ticket ticket = ticketController.  inProgressTickets![index];
                  return ListBodyForTicket(ticket: ticket);
                },
              );
            } // Show a message when there are no tickets or null data

            if (snapshot.hasError) {
              return const NoTicketsErrorPage();
            }

            return const ShimmerForChats(); //
          }));
}
///WIDGET FOR CLOSED TICKET

Widget closedTasks() {
  return Center(
      child: FutureBuilder(
          future: ticketController.getAllClosedTickets(),
          builder: (context, snapshot) {
            if (ticketController.closedTickets?.length == 0) {
              return const NoTicketsErrorPage(); // Show an error message if fetching fails
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: ticketController.closedTickets?.length,
                itemBuilder: (context, index) {
                  Ticket ticket = ticketController.closedTickets![index];
                  return ListBodyForTicket(ticket: ticket);
                },
              );
            } // Show a message when there are no tickets or null data

            return const ShimmerForChats(); //
          }));
}


///LIST BODY FOR TICKET
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
            padding: const EdgeInsets.only(left: 2.5, top: 5, bottom: 0.0),
            child: titleText(
                context: context,
                text: widget.ticket.title,
                maxLines: 2,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
                fontSize: 16.0),
          ),
          subtitle: ReadMoreText(
            widget.ticket.description ?? "",
            trimLines: 2,
            textAlign: TextAlign.start,
            colorClickableText: AppColor.primaryColor,
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
        Padding(
          padding: EdgeInsets.only(top: ScreenSize.height(context) * 0.25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.task_alt,
                size: 75.0,
                color: AppColor.primaryColor,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  'NO TICKETS',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackMild),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
