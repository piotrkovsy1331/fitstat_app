class User {
  final String uid;
  User({this.uid});
}

class UserDescription {
  final String sex;
  final int weight;
  final int age;

  UserDescription({this.sex, this.weight, this.age}) {
    assert(this.sex != null, "sex is emoty");
    assert(this.weight != null, "weight is empty");
    assert(this.age != null, "age is empty");
  }
}
