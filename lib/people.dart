class People {
  People({required this.name, required this.age, required this.country, required this.desc, required this.img});

  final String name;
  final int age;
  final String country;
  final String desc;
  final String img;

  String get getName {
    return name;
  }

  int get getAge {
    return age;
  }

  String get getCountry {
    return country;
  }

  String get getDesc {
    return desc;
  }

  String get getImg {
    return img;
  }
}