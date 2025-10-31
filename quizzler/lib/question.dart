class Question{
  late String question;
  late bool answer;
  Question(String q, bool a){
    question = q;
    answer = a;
  }
}

// To use "q: a:"
// class Question{
//   late String question;
//   late bool answer;
//   Question({required bool a, required String q}){
//     question = q;
//     answer = a;
//   }
// }