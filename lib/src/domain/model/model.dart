class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.image,
    required this.subTitle,
    required this.title,
  });
}

class Customer {
  String id;
  String name;
  int numOfNotification;

  Customer(
    this.id,
    this.name,
    this.numOfNotification,
  );
}

class Contact {
  String email;
  String phone;
  String link;

  Contact(
    this.email,
    this.phone,
    this.link,
  );
}

class Authentication {
  Customer? customer;
  Contact? contact;

  Authentication(
    this.contact,
    this.customer,
  );
}

class DeviceInfo {
  String name;
  String identifier;
  String version;
  DeviceInfo(
    this.name,
    this.version,
    this.identifier,
  );
}

class ForgotPassword {
  String email;

  ForgotPassword(this.email);
}

class Services {
  int id;
  String title;
  String image;

  Services(
    this.id,
    this.title,
    this.image,
  );
}

class Stores {
  int id;
  String title;
  String image;

  Stores(
    this.id,
    this.title,
    this.image,
  );
}

class Banners {
  int id;
  String title;
  String link;
  String image;

  Banners(
    this.id,
    this.image,
    this.link,
    this.title,
  );
}

class HomeData {
  List<Services>? services;
  List<Stores>? stores;
  List<Banners>? banners;

  HomeData(
    this.services,
    this.banners,
    this.stores,
  );
}

class Home {
  HomeData? homeData;

  Home(
    this.homeData,
  );
}

class StoreDetails {
  int? id;
  String? title, image, details, services, about;

  StoreDetails(
    this.id,
    this.title,
    this.image,
    this.details,
    this.services,
    this.about,
  );
}
