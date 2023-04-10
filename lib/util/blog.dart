import 'package:vinayakply/util/storage.dart';

class UserCred {
  bool isUserLogin() {
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive == '' ? false : true;
  }

  bool isHavePincode() {
    String isActive = StorageUtil.getString('PINCODE');
    //print("ff${isActive}ff");
    return isActive == '' ? false : true;
  }

  String getUserId() {
    String isActive = StorageUtil.getString('USERID');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getUserName() {
    String isActive = StorageUtil.getString('NAME');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getUserImage() {
    String isActive = StorageUtil.getString('IMAGE');
    //print("ff${isActive}ff");
    return isActive;
  }

  String getPincode() {
    String isActive = StorageUtil.getString('PINCODE');
    return isActive;
  }

  String getLng() {
    String isActive = StorageUtil.getString('LNG');
    return isActive;
  }

  String getEmail() {
    String isActive = StorageUtil.getString('EMAIL');
    return isActive;
  }

  String getMob() {
    String isActive = StorageUtil.getString('MOB');
    return isActive;
  }

  String getName() {
    String isActive = StorageUtil.getString('NAME');
    return isActive;
  }

  String getLat() {
    String isActive = StorageUtil.getString('LAT');
    return isActive;
  }

  String getUserType() {
    String isActive = StorageUtil.getString('USERTYPE');
    return isActive;
  }

  bool getPincodeAvail() {
    String isActive = StorageUtil.getString('AVAIL');
    return isActive == 'true' ? true : false;
  }

  void addUserId(String id) {
    StorageUtil.putString('USERID', id);
  }

  void addUserType(String id) {
    StorageUtil.putString('USERTYPE', id);
  }

  void addUsername(String name) {
    StorageUtil.putString('NAME', name);
  }

  void addUserimage(String image) {
    StorageUtil.putString('IMAGE', image);
  }

  void addPincode(String pin) {
    StorageUtil.putString('PINCODE', pin);
  }

  void setShop(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setBank(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setSchool(String info) {
    StorageUtil.putString('INFO', info);
  }

  void setCategory(String info) {
    StorageUtil.putString('INFO', info);
  }

  void addPincodeAvail(bool isAvail) {
    StorageUtil.putString('AVAIL', '$isAvail');
  }

  void addName(String isAvail) {
    StorageUtil.putString('NAME', isAvail);
  }

  void addEmail(String isAvail) {
    StorageUtil.putString('EMAIL', isAvail);
  }

  void addMob(String isAvail) {
    StorageUtil.putString('MOB', isAvail);
  }

  void addLatLng({double lat = 0.0, double lng = 0.0}) {
    StorageUtil.putString('LAT', '$lat');
    StorageUtil.putString('LNG', '$lng');
  }

  void logoutUser() {
    StorageUtil.putString('USERID', '');
    StorageUtil.putString('USERTYPE', '');
    StorageUtil.putString('PINCODE', '');
    StorageUtil.putString('LAT', '');
    StorageUtil.putString('LNG', '');
    StorageUtil.putString('AVAIL', 'false');
    StorageUtil.putString('MOB', '');
    StorageUtil.putString('NAME', '');
    StorageUtil.putString('EMAIL', '');
    StorageUtil.clearAll();
  }
}

final userCred = UserCred();
