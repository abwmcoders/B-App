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
