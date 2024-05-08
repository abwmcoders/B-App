import 'package:commerce/src/app/constants.dart';
import 'package:commerce/src/data/responses/responses.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("device-type") String deviceType,
  );

  @POST("customers/forgot-password")
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );

  @POST("customers/register")
  Future<AuthenticationResponse> register(
    @Field("country_mobile_code") String countryMobileCode,
    @Field("user_name") String username,
    @Field("email") String email,
    @Field("password") String password,
    @Field("mobile_number") String mobileNumber,
    @Field("profile_pix") String profilePix,
  );

  @GET("/home")
  Future<HomeResponse> getHome();

  @GET("/store-details")
  Future<StoreDetailsResponse> getStoreDetails();
}
