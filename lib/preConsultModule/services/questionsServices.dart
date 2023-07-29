import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medongosupport/preConsultModule/models/questionsModel.dart';
import 'package:medongosupport/preConsultModule/widgets/toastMessage.dart';

class QuestionsService {
  ///Get Firestore instance for the retrieval of questions from firestore database
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  ///Get Firebase Storage instance for the audio,video and image storage of the patient
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;



  ///GETS ALL THE FLOWS FROM THE FIRESTORE
   getAllQuestionsFromDb() async {
    try{
      QuerySnapshot<Map<String, dynamic>> res = await firebaseFirestore
          .collection('flowCharts')
          .get();


      return questionsMainFromJson(res.docs);
    }catch(error){
      showToast("Unable to load question. Please check your internet connection.", ToastGravity.SNACKBAR);
    }
  }


  // getQuestionsCollection() async {
  //   var res = await firebaseFirestore.collection('dash').get();
  //   List<Map<String, dynamic>> questionList = [];
  //
  //   res.docs.forEach((doc) {
  //     List<dynamic> elements = doc.data()['elements'];
  //     List<Elements> elementsList = elementsFromJson(elements);
  //
  //     questionList.add({
  //       'elements': elementsList,
  //       'startAge': doc.data()['startAge'],
  //       'endAge': doc.data()['endAge'],
  //       'gender': doc.data()['gender'],
  //     });
  //   });
  //
  //   print(questionList);
  // }

// print("THIS IS DOCUMENTS LENGTH ${res.docs.length}");
//
// List<QuestionsMain> all = questionsMainFromJson(res.docs);
//
//
// for (int i = 0; i < all.length; i++) {
//   // if (all[i].startAge != null && all[i].endAge != null) {
//   //   if (all[i].startAge! == "18" && all[i].endAge! == "30" && all[i].gender! =="female") {
//   //     int docIndex=i;
//   //     print("Doc index = $docIndex");
//   //     print(all[docIndex].elements![i].text);
//   //   }
//   // }
//   print("THIS IS ELEMENTS ${all[i].elements}");
//
// }


}



