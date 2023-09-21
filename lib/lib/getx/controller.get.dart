import 'package:get/get.dart';

class MyGetXController extends GetxController {
  RxBool commentstate1 = false.obs;
  RxBool commentstate2 = false.obs;
  RxBool commentstate3 = false.obs;
  RxBool commentstate4 = false.obs;
  RxString commenttext1 = ''.obs;
  RxString commenttext2 = ''.obs;
  RxString commenttext3 = ''.obs;
  RxString commenttext4 = ''.obs;

  RxBool star1 = false.obs;
  RxBool star2 = false.obs;
  RxBool star3 = false.obs;
  RxBool star4 = false.obs;
  RxBool star5 = false.obs;
  RxString starText = ''.obs;
  RxInt starCount = 0.obs;

  RxBool isChooseStar = false.obs;

  RxString commentText = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxInt playerNumber = 1.obs;

  savePlayerNumber(number) {
    playerNumber.value = number;
  }

  resetPlayerNumber() {
    playerNumber.value = 1;
  }

  chooseStar() {
    isChooseStar.value = true;
  }

  changeCommentState(index) {
    if ((commentstate1.value == true && commentstate2.value == true) ||
        (commentstate2.value == true && commentstate3.value == true) ||
        (commentstate3.value == true && commentstate4.value == true) ||
        (commentstate1.value == true && commentstate3.value == true) ||
        (commentstate1.value == true && commentstate4.value == true) ||
        (commentstate2.value == true && commentstate4.value == true)) {
      print('condition reach');
    } else {
      if (index == 1) {
        commentstate1.value = !commentstate1.value;
      } else if (index == 2) {
        commentstate2.value = !commentstate2.value;
      } else if (index == 3) {
        commentstate3.value = !commentstate3.value;
      } else if (index == 4) {
        commentstate4.value = !commentstate4.value;
      }
    }
  }

  resetForm() {
    isChooseStar.value = false;
    starCount.value = 0;
    commentstate1.value = false;
    commentstate2.value = false;
    commentstate3.value = false;
    commentstate4.value = false;

    commenttext1.value = '';
    star1.value = false;
    star2.value = false;
    star3.value = false;
    star4.value = false;
    star5.value = false;
    starText.value = '';
  }

  changeStarState(index) {
    if (index == 1) {
      starCount.value = 1;
      star1.value = true;
      starText.value = 'BAD';
      commenttext1.value = 'Unhelpful-Driver';
      if (star2.value = true) {
        star2.value = false;
      }
      if (star3.value = true) {
        star3.value = false;
      }
      if (star4.value = true) {
        star4.value = false;
      }
      if (star5.value = true) {
        star5.value = false;
      }

      isChooseStar.value = true;
    } else if (index == 2) {
      starCount.value = 2;
      star1.value = true;
      star2.value = true;
      starText.value = 'BAD';
      if (star3.value = true) {
        star3.value = false;
      }
      if (star4.value = true) {
        star4.value = false;
      }
      if (star5.value = true) {
        star5.value = false;
      }

      isChooseStar.value = true;
    } else if (index == 3) {
      starCount.value = 3;
      star1.value = true;
      star2.value = true;
      star3.value = true;
      starText.value = 'GOOD';
      if (star4.value = true) {
        star4.value = false;
      }
      if (star5.value = true) {
        star5.value = false;
      }

      isChooseStar.value = true;
    } else if (index == 4) {
      starCount.value = 4;
      star1.value = true;
      star2.value = true;
      star3.value = true;
      star4.value = true;
      if (star5.value = true) {
        star5.value = false;
      }
      starText.value = 'GOOD';
    } else if (index == 5) {
      starCount.value = 5;
      star1.value = true;
      star2.value = true;
      star3.value = true;
      star4.value = true;
      star5.value = true;
      starText.value = 'PERFECT';
      isChooseStar.value = true;
    }
  }
}
