class LoginRequest {
  String email;
  String password;
  String imei;
  String deviceType;

  LoginRequest(
    this.email,
    this.password,
    this.imei,
    this.deviceType,
  );
}

class ForgotPasswordRequest {
  String email;

  ForgotPasswordRequest(this.email);
}

class RegisterRequest {
  String countryMobileCode;
  String username;
  String email;
  String password;
  String mobileNumber;
  String profilePix;

  RegisterRequest(
    this.countryMobileCode,
    this.username,
    this.email,
    this.password,
    this.mobileNumber,
    this.profilePix,
  );
}

class StoreDetailsRequest {
  int id;
  String title, image, services, details, about;

  StoreDetailsRequest(
    this.id,
    this.title,
    this.image,
    this.services,
    this.details,
    this.about,
  );
}
