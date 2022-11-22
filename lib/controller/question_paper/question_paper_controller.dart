import 'package:get/get.dart';
import '../../models/question_paper_model.dart';
import '../../services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController{
  final allPaperImages = <String>[].obs;
  // final allPaper =<QuestionPaperModel>[].obs;
  @override
  void onReady(){
    getAllPapers();
    super.onReady();
  }
  Future <void> getAllPapers() async{
    List<String> imgName=[
      "biology",
      "chemistry",
      "maths",
      "physics"];
    try {
      for (var img in imgName){
        final imgURL = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages.add(imgURL!);
      }
    } catch (e) {
      print(e);
    }
  }
}