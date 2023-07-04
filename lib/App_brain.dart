import 'package:second_app/Question.dart';

class App_brain {
  List<Question> _question = [
    Question(
        question: "combien de planete existe dans l'image",
        image: "images/image-1.jpg",
        reponse: true),
    Question(
        question: "Est ce que le chat est un anial carnivor",
        image: "images/image-2.jpg",
        reponse: true),
    Question(
        question: "la chine existe dans le continent africaine",
        image: "images/image-3.jpg",
        reponse: false),
    Question(
        question: "la terre est  flat",
        image: "images/image-4.jpg",
        reponse: false),
  ];
  Question getQuestion(number) {
    return _question[number];
  }
}
