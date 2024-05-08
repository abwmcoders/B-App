// ignore_for_file: constant_identifier_names

import 'package:commerce/src/data/network/error_handler.dart';

import '../responses/responses.dart';

const CACHE_HOME_KEY = 'CACHE_HOME_KEY';
const CACHE_STORE_KEY = 'CACHE_HOME_KEY';
const CACHE_HOME_INTERVAL = 60 * 1000;
const CACHE_STORE_INTERVAL = 60 * 1000;

abstract class LocalDataSource {
  Future<HomeResponse> getHome();
  Future<StoreDetailsResponse> getStoreDetails();
  Future<void> saveHomeToCache(HomeResponse homeResponse);
  Future<void> saveStoreDetailsToCache(StoreDetailsResponse storeDetailsResponse);
  void clearCache();
  void removeFromCache(String key);
}

class LocalDataSourceImplementer implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cachedMap = {};

  @override
  Future<HomeResponse> getHome() {
    CachedItem? cachedItem = cachedMap[CACHE_HOME_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async {
    cachedMap[CACHE_HOME_KEY] = CachedItem(homeResponse);
  }

  @override
  void clearCache() {
    cachedMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cachedMap.remove(key);
  }
  
  @override
  Future<StoreDetailsResponse> getStoreDetails() {
     CachedItem? cachedItem = cachedMap[CACHE_STORE_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_STORE_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }
  
  @override
  Future<void> saveStoreDetailsToCache(StoreDetailsResponse storeDetailsResponse) async{
    cachedMap[CACHE_STORE_KEY] = CachedItem(storeDetailsResponse);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTime) {
    int currentTimeInMillis = DateTime.now().microsecondsSinceEpoch;

    bool isCachedValid = currentTimeInMillis - expirationTime < cacheTime;

    return isCachedValid;
  }
}
