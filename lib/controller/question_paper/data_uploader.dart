import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../firebase_ref/loading_status.dart';
import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';


class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
  final loadingStatus= LoadingStatus.loading.obs; // loading status is observable
  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0

    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papersInAssets = manifestMap.keys
        .where((path) =>
    path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
    // print (papersInAssets);
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(
          QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      // print (stringPaperContent);
    }
    // print ('Item Numbers ${questionPapers[0].description}');
    var batch = fireStore.batch();
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "Description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_paper": paper.questions == null ? 0 : paper.questions!
            .length,
      });
      for (var questions in paper.questions!) {
        final questionPATH = questionRF(paperId: paper.id,
            questionId: questions.id);
        batch.set(questionPATH, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });
        for (var answer in questions.answers) {
          batch.set(questionPATH.collection("answers").doc(answer.identifier), {

            "identifier": answer.identifier,
            "Answer": answer.answer
          }
          );
        }
      }
    }
    await batch.commit();
    loadingStatus.value=LoadingStatus.completed;
  }
}
