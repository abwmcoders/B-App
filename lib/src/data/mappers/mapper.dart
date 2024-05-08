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

extension ForgotPasswordMapper on ForgotPasswordResponse? {
  ForgotPassword toDomain() {
    return ForgotPassword(
      this?.support?.orEmpthy() ?? empty,
    );
  }
}

extension ServiceResponseMapper on ServiceResponse? {
  Services toDomain() {
    return Services(
      this?.id?.orZero() ?? zero,
      this?.title?.orEmpthy() ?? empty,
      this?.image?.orEmpthy() ?? empty,
    );
  }
}

extension StoresResponseMapper on StoresResponse? {
  Stores toDomain() {
    return Stores(
      this?.id?.orZero() ?? zero,
      this?.title?.orEmpthy() ?? empty,
      this?.image?.orEmpthy() ?? empty,
    );
  }
}

extension BannersResponseMapper on BannerResponse? {
  Banners toDomain() {
    return Banners(
      this?.id?.orZero() ?? zero,
      this?.title?.orEmpthy() ?? empty,
      this?.image?.orEmpthy() ?? empty,
      this?.link?.orEmpthy() ?? empty,
    );
  }
}

// extension HomeDataResponseMapper on HomeDataResponse? {
//   HomeData toDomain() {
//     return HomeData(
//       this?.services.toDomain(),
//       this?.banners?.toDomain(),
//       this?.stores.toDomain(),
//     );
//   }
// }

extension HomeResponseMapper on HomeResponse? {
  Home toDomain() {
    List<Services> mappedServices =
        (this?.data?.services?.map((service) => service.toDomain()) ??
                const Iterable.empty())
            .cast<Services>()
            .toList();
    List<Stores> mappedStores =
        (this?.data?.stores?.map((store) => store.toDomain()) ??
                const Iterable.empty())
            .cast<Stores>()
            .toList();
    List<Banners> mappedBanners =
        (this?.data?.banners?.map((banner) => banner.toDomain()) ??
                const Iterable.empty())
            .cast<Banners>()
            .toList();
    //List<Banners> mappedBanners = this?.data?.banners.map((Banners banners) => banners.t)

    var data = HomeData(
      mappedServices,
      mappedBanners,
      mappedStores,
    );

    return Home(data);
  }
}

extension StoreDetailsMapper on StoreDetailsResponse? {
  StoreDetails toDomain() {
    return StoreDetails(
      this?.id?.orZero() ?? zero,
      this?.title?.orEmpthy() ?? empty,
      this?.image?.orEmpthy() ?? empty,
      this?.details?.orEmpthy() ?? empty,
      this?.services?.orEmpthy() ?? empty,
      this?.about?.orEmpthy() ?? empty,
    );

  }
}
