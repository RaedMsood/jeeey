class AppURL {
  static String get base => 'https://jeeey.najaz.in';

  static String get baseURL => '$base/api/app';

  static String get checkUser => '/auth/check';

  static String get logInOrSignUp => '/auth/login';

  static String get checkOtp => '/auth/check_otp';

  static String get resendOtp => '/auth/update_otp';

  static String get forgetPassword => '/auth/forget_password';

  static String get resetPassword => '/auth/reset_password';

  static String get logout => '/auth/logout';

  static String get addresses => '/addresses';

  static String get getCities => '/cities';

  static String get getDistricts => '/districts';

  static String get createAddress => '/addresses/store';

  static String get updateAddress => '/addresses/update';

  static String get deleteAddress => '/addresses/delete';

  static String get productDetailsForCart => '/product_data';

  static String get getAllCart => '/carts';

  static String get addToCart => '/carts/store';

  static String get updateCart => '/carts/update';

  static String get deleteCart => '/carts/delete';

  static String get confirmOrder => '/orders/store';

  static String get getOrderDate => '/orders/get_order_data';

  static String get orders => '/orders';

}
