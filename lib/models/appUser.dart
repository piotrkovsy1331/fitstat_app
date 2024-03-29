class AppUser {
  final String/*?*/ uid;
  AppUser({this.uid});
}

class AppUserDescription {
  final String/*?*/ uid;
  final String/*?*/ name;
  final String/*?*/ sex;
  final int/*?*/ age;
  final int/*?*/ weight;
  final int/*?*/ height;

  final String/*?*/ photoUrl;

  AppUserDescription(
      {this.uid,
      this.name,
      this.sex,
      this.age,
      this.weight,
      this.height,
      this.photoUrl}) {
    assert(this.name != null, "name is empty");
    assert(this.sex != null, "sex is empty");
    assert(this.weight != null, "weight is empty");
    assert(this.age != null, "age is empty");
    assert(this.height != null, "height is empty");
    assert(this.photoUrl != null, "no image ");
  }
}
