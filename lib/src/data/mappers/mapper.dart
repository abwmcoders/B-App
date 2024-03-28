import 'package:commerce/src/app/extention.dart';
import 'package:commerce/src/data/responses/responses.dart';


import '../../domain/model/model.dart';

const empty = '';
const zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.orEmpthy() ?? empty,
      this?.name?.orEmpthy() ?? empty,
      this?.numOfNotification?.orZero() ?? zero,
    );
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(
      this?.email?.orEmpthy() ?? empty,
      this?.phone?.orEmpthy() ?? empty,
      this?.link?.orEmpthy() ?? empty,
    );
  }
}


extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.contact.toDomain(),
      this?.customer.toDomain(),
    );
  }
}

