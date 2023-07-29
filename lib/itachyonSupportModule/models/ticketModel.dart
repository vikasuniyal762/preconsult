List<Ticket> ticketsFromJson(str) =>
    List<Ticket>.from((str).map((x) => Ticket.fromJson(x)));
///TICKET MODEL
class Ticket {
  var results;
  var id;
  var title;
  var description;
  var priority;
  var status;
  var multitask;
  var repeatTask;
  var project;
  var stage;
  var createdBy;
  var createdAt;
  var modifiedBy;
  var modifiedOn;
  var statusModifiedBy;
  var closedTask;
  var closedOn;
  var startDate;
  var deadline;
  var plannedStart;
  var plannedFinish;
  var gUID;
  var numberOfComments;
  var numberOfNewComments;
  var allowChangeDeadlines;
  var accept;
  var addToReport;
  var createdFromTemplate;
  var timeSpent;
  var timeSpentFromHistory;
  var skipWeekend;
  var forumTopicID;
  var forumID;
  var siteID;
  var subordinateTask;
  var addedToFavorites;
  var exchangeID;
  var outlookVersion;
  var lastViewDate;
  var sortIndex;
  var durationPlan;
  var durationActual;
  var checklist;
  var durationType;
  var notifications;
  var pinned;
  var pinnedInGroup;
  var iV;
  var updatedAt;

  Ticket(
      {this.results,
      this.id,
      this.title,
      this.description,
      this.priority,
      this.status,
      this.multitask,
      this.repeatTask,
      this.project,
      this.stage,
      this.createdBy,
        this.createdAt,
      this.modifiedBy,
      this.modifiedOn,
      this.statusModifiedBy,
      this.closedTask,
      this.closedOn,
      this.startDate,
      this.deadline,
      this.plannedStart,
      this.plannedFinish,
      this.gUID,
      this.numberOfComments,
      this.numberOfNewComments,
      this.allowChangeDeadlines,
      this.accept,
      this.addToReport,
      this.createdFromTemplate,
      this.timeSpent,
      this.timeSpentFromHistory,
      this.skipWeekend,
      this.forumTopicID,
      this.forumID,
      this.siteID,
      this.subordinateTask,
      this.addedToFavorites,
      this.exchangeID,
      this.outlookVersion,
      this.lastViewDate,
      this.sortIndex,
      this.durationPlan,
      this.durationActual,
      this.checklist,
      this.durationType,
      this.notifications,
      this.pinned,
      this.pinnedInGroup,
      this.iV,
      this.updatedAt});
///TICKET FROM JSON
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        results: json['results'],
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        priority: json['priority'],
        status: json['status'],
        multitask: json['multitask'],
        repeatTask: json['repeatTask'],
        project: json['project'],
        stage: json['stage'],
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        modifiedBy: json['modifiedBy'],
        modifiedOn: json['modifiedOn'],
        statusModifiedBy: json['statusModifiedBy'],
        closedTask: json['closedTask'],
        closedOn: json['closedOn'],
        startDate: json['startDate'],
        deadline: json['deadline'],
        plannedStart: json['plannedStart'],
        plannedFinish: json['plannedFinish'],
        gUID: json['GUID'],
        numberOfComments: json['numberOfComments'],
        numberOfNewComments: json['numberOfNewComments'],
        allowChangeDeadlines: json['allowChangeDeadlines'],
        accept: json['accept'],
        addToReport: json['addToReport'],
        createdFromTemplate: json['createdFromTemplate'],
        timeSpent: json['timeSpent'],
        timeSpentFromHistory: json['timeSpentFromHistory'],
        skipWeekend: json['skipWeekend'],
        forumTopicID: json['forumTopicID'],
        forumID: json['forumID'],
        siteID: json['siteID'],
        subordinateTask: json['subordinateTask'],
        addedToFavorites: json['addedToFavorites'],
        exchangeID: json['exchangeID'],
        outlookVersion: json['outlookVersion'],
        lastViewDate: json['lastViewDate'],
        sortIndex: json['sortIndex'],
        durationPlan: json['durationPlan'],
        durationActual: json['durationActual'],
        checklist: json['checklist'],
        durationType: json['durationType'],
        notifications: json['notifications'],
        pinned: json['pinned'],
        pinnedInGroup: json['pinnedInGroup'],
        iV: json['__v'],
    updatedAt:json['updatedAt']);
  }

  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.results != null) {
  //     data['results'] = this.results!.map((v) => v.toJson()).toList();
  //   }
  //   data['_id'] = this.id;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['priority'] = this.priority;
  //   data['status'] = this.status;
  //   data['multitask'] = this.multitask;
  //   data['repeatTask'] = this.repeatTask;
  //   data['project'] = this.project;
  //   data['stage'] = this.stage;
  //   data['createdBy'] = this.createdBy;
  //   data['dateCreated'] = this.dateCreated;
  //   data['modifiedBy'] = this.modifiedBy;
  //   data['modifiedOn'] = this.modifiedOn;
  //   data['statusModifiedBy'] = this.statusModifiedBy;
  //   data['closedTask'] = this.closedTask;
  //   data['closedOn'] = this.closedOn;
  //   data['startDate'] = this.startDate;
  //   data['deadline'] = this.deadline;
  //   data['plannedStart'] = this.plannedStart;
  //   data['plannedFinish'] = this.plannedFinish;
  //   data['GUID'] = this.gUID;
  //   data['numberOfComments'] = this.numberOfComments;
  //   data['numberOfNewComments'] = this.numberOfNewComments;
  //   data['allowChangeDeadlines'] = this.allowChangeDeadlines;
  //   data['accept'] = this.accept;
  //   data['addToReport'] = this.addToReport;
  //   data['createdFromTemplate'] = this.createdFromTemplate;
  //   data['timeSpent'] = this.timeSpent;
  //   data['timeSpentFromHistory'] = this.timeSpentFromHistory;
  //   data['skipWeekend'] = this.skipWeekend;
  //   data['forumTopicID'] = this.forumTopicID;
  //   data['forumID'] = this.forumID;
  //   data['siteID'] = this.siteID;
  //   data['subordinateTask'] = this.subordinateTask;
  //   data['addedToFavorites'] = this.addedToFavorites;
  //   data['exchangeID'] = this.exchangeID;
  //   data['outlookVersion'] = this.outlookVersion;
  //   data['lastViewDate'] = this.lastViewDate;
  //   data['sortIndex'] = this.sortIndex;
  //   data['durationPlan'] = this.durationPlan;
  //   data['durationActual'] = this.durationActual;
  //   data['checklist'] = this.checklist;
  //   data['durationType'] = this.durationType;
  //   data['notifications'] = this.notifications;
  //   data['pinned'] = this.pinned;
  //   data['pinnedInGroup'] = this.pinnedInGroup;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}

// var results;
// String? id;
// String? title;
// String? description;
// int? priority;
// int? status;
// String? multitask;
// String? repeatTask;
// int? project;
// int? stage;
// String? createdBy;
// String? dateCreated;
// int? modifiedBy;
// String? modifiedOn;
// int? statusModifiedBy;
// int? closedTask;
// Null? closedOn;
// Null? startDate;
// String? deadline;
// String? plannedStart;
// String? plannedFinish;
// Null? gUID;
// int? numberOfComments;
// int? numberOfNewComments;
// String? allowChangeDeadlines;
// String? accept;
// String? addToReport;
// String? createdFromTemplate;
// int? timeSpent;
// int? timeSpentFromHistory;
// int? skipWeekend;
// int? forumTopicID;
// int? forumID;
// String? siteID;
// String? subordinateTask;
// String? addedToFavorites;
// int? exchangeID;
// int? outlookVersion;
// String? lastViewDate;
// int? sortIndex;
// int? durationPlan;
// int? durationActual;
// List<String>? checklist;
// int? durationType;
// String? notifications;
// String? pinned;
// String? pinnedInGroup;
// int? iV;
