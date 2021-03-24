import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:fitstat_app/models/mealDay.dart";
import 'package:fitstat_app/models/product.dart';

class DatabaseService {
  final String uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  DatabaseService({this.uid});
  //collection refference

//Collection for indywidual data of user
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('userData');
// Collection for mealday
// final CollectionReference mealDayDataCollection = userDataCollection.document(uid)
// Add MealDay collection
  void addDayMeal() async {
    MealDay mealday = MealDay(DateTime.now(), "kanapka", 550);

    userDataCollection
        .doc(uid)
        .collection('daymeal')
        .doc()
        .set(mealday.toMap());
  }

  Future updateProductInMealDay() async {
    Product product = Product(
        mealType: 1,
        foodName: "Pizza",
        calories: 512,
        fat: 33,
        protein: 222,
        sugar: 30,
        servingUnits: "grams",
        imageUrl: "httpnkjdfnkjdfkjsfkjnsd");

    userDataCollection
        .doc(uid)
        .collection('daymeal')
        .doc("mANv4Zv4xFBaUwwcY7ih")
        .update({
      "products": FieldValue.arrayUnion([product.toMap()])
    });
  }

// Add MealDay collection
  Future addMealDay(String calories, DateTime date, int fat, int protein,
      int sugar, String uid) async {
    return await userDataCollection.doc(uid).collection('mealDay').doc().set({
      'calories': calories,
      'date': Timestamp.now(),
      'fat': fat,
      'protein': protein,
      'sugar': sugar,
      'uid': uid,
      'breakfast': [
        {
          "mealName": "pizza ",
          "calories": 13,
          "fat": 5,
          "sugar": 7,
          "protein": 8,
        }
      ],
      'lunch': [
        {
          "mealName": "pizza ",
          "calories": 13,
          "fat": 5,
          "sugar": 7,
          "protein": 8,
        }
      ],
      'Dinner': [
        {
          "mealName": "pizza ",
          "calories": 13,
          "fat": 5,
          "sugar": 7,
          "protein": 8,
        }
      ],
      'Supper': [
        {
          "mealName": "pizza ",
          "calories": 13,
          "fat": 5,
          "sugar": 7,
          "protein": 8,
        }
      ],
      'snacks': [
        {
          "mealName": "pizza ",
          "calories": 13,
          "fat": 5,
          "sugar": 7,
          "protein": 8,
        }
      ]
    });
  }

  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('meal').doc().collection('product');

  Future updateUserData(String name, String sex, int age, int weight,
      int height, String photo) async {
    return await userDataCollection.doc(uid).set({
      'uid': uid,
      'name': name,
      "sex": sex,
      "age": age,
      'weight': weight,
      'height': height,
      "photo ": photo,
    });
  }

  Future<void> createProductData(String foodName, String calories, int fat,
      int protein, int sugars, String imageUrl) {
    return productCollection
        .add({
          'foodName': foodName,
          'calories': calories,
          'fat': fat,
          'protein': protein,
          'sugars': sugars,
          'imageUrl': imageUrl,
        })
        .then((value) => print("product added"))
        .catchError(
            (onError) => print("an error occured while adding product"));
  }
}
