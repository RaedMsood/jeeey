// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  // skipped getter for the '--------generalVariables-----------' key

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `View more`
  String get viewMore {
    return Intl.message(
      'View more',
      name: 'viewMore',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `Daily new`
  String get dailyNew {
    return Intl.message(
      'Daily new',
      name: 'dailyNew',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message(
      'Copy',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `Sharing`
  String get sharing {
    return Intl.message(
      'Sharing',
      name: 'sharing',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Rename`
  String get rename {
    return Intl.message(
      'Rename',
      name: 'rename',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Click again to exit!`
  String get clickAgainToExit {
    return Intl.message(
      'Click again to exit!',
      name: 'clickAgainToExit',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------bottombar-----------' key

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get neww {
    return Intl.message(
      'New',
      name: 'neww',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------mainFilter-----------' key

  /// `Recommend`
  String get recommend {
    return Intl.message(
      'Recommend',
      name: 'recommend',
      desc: '',
      args: [],
    );
  }

  /// `New Arrivals`
  String get newArrivals {
    return Intl.message(
      'New Arrivals',
      name: 'newArrivals',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated`
  String get topRated {
    return Intl.message(
      'Top Rated',
      name: 'topRated',
      desc: '',
      args: [],
    );
  }

  /// `Most Popular`
  String get mostPopular {
    return Intl.message(
      'Most Popular',
      name: 'mostPopular',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '-----------------Trends-----------------' key

  /// `Top Trends`
  String get topTrends {
    return Intl.message(
      'Top Trends',
      name: 'topTrends',
      desc: '',
      args: [],
    );
  }

  /// `Recommended trends for you`
  String get recommendedTrendsForYou {
    return Intl.message(
      'Recommended trends for you',
      name: 'recommendedTrendsForYou',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '-----------------BigOffers-----------------' key

  /// `Big Offers`
  String get bigOffers {
    return Intl.message(
      'Big Offers',
      name: 'bigOffers',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '-----------------Wishlist--------------------' key

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any product in my wishlist`
  String get youDontHaveAnyProductInMyWishlist {
    return Intl.message(
      'You don\'t have any product in my wishlist',
      name: 'youDontHaveAnyProductInMyWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Add to list`
  String get addToList {
    return Intl.message(
      'Add to list',
      name: 'addToList',
      desc: '',
      args: [],
    );
  }

  /// `Shop now`
  String get shopNow {
    return Intl.message(
      'Shop now',
      name: 'shopNow',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete these products?`
  String get areYouSureYouWantToDeleteTheseProducts {
    return Intl.message(
      'Are you sure you want to delete these products?',
      name: 'areYouSureYouWantToDeleteTheseProducts',
      desc: '',
      args: [],
    );
  }

  /// `They will also be removed from the lists.`
  String get theyWillAlsoBeRemovedFromTheLists {
    return Intl.message(
      'They will also be removed from the lists.',
      name: 'theyWillAlsoBeRemovedFromTheLists',
      desc: '',
      args: [],
    );
  }

  /// `Create a new list`
  String get createANewList {
    return Intl.message(
      'Create a new list',
      name: 'createANewList',
      desc: '',
      args: [],
    );
  }

  /// `Create a list`
  String get createAList {
    return Intl.message(
      'Create a list',
      name: 'createAList',
      desc: '',
      args: [],
    );
  }

  /// `Goods`
  String get goods {
    return Intl.message(
      'Goods',
      name: 'goods',
      desc: '',
      args: [],
    );
  }

  /// `There are no lists`
  String get thereAreNoLists {
    return Intl.message(
      'There are no lists',
      name: 'thereAreNoLists',
      desc: '',
      args: [],
    );
  }

  /// `A new way to manage your favorite products! You can classify in your own way`
  String get aNewWayToManageYourFavoriteProductsYouCanClassifyInYourOwnWay {
    return Intl.message(
      'A new way to manage your favorite products! You can classify in your own way',
      name: 'aNewWayToManageYourFavoriteProductsYouCanClassifyInYourOwnWay',
      desc: '',
      args: [],
    );
  }

  /// `List name`
  String get listName {
    return Intl.message(
      'List name',
      name: 'listName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a list name`
  String get pleaseEnterAListName {
    return Intl.message(
      'Please enter a list name',
      name: 'pleaseEnterAListName',
      desc: '',
      args: [],
    );
  }

  /// `Delete list`
  String get deleteList {
    return Intl.message(
      'Delete list',
      name: 'deleteList',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the list?`
  String get areYouSureYouWantToDeleteTheList {
    return Intl.message(
      'Are you sure you want to delete the list?',
      name: 'areYouSureYouWantToDeleteTheList',
      desc: '',
      args: [],
    );
  }

  /// `Copy to list`
  String get copyToList {
    return Intl.message(
      'Copy to list',
      name: 'copyToList',
      desc: '',
      args: [],
    );
  }

  /// `Selection of products`
  String get selectionOfProducts {
    return Intl.message(
      'Selection of products',
      name: 'selectionOfProducts',
      desc: '',
      args: [],
    );
  }

  /// `Add goods`
  String get addGoods {
    return Intl.message(
      'Add goods',
      name: 'addGoods',
      desc: '',
      args: [],
    );
  }

  /// `Products list is empty`
  String get productsListIsEmpty {
    return Intl.message(
      'Products list is empty',
      name: 'productsListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Add your favorite products to the list by making a selection on the Wish List page or clicking the heart button on the Details page`
  String get addYourFavoriteProducts {
    return Intl.message(
      'Add your favorite products to the list by making a selection on the Wish List page or clicking the heart button on the Details page',
      name: 'addYourFavoriteProducts',
      desc: '',
      args: [],
    );
  }

  /// `Add products`
  String get addProducts {
    return Intl.message(
      'Add products',
      name: 'addProducts',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------cart-----------' key

  /// `Shopping bag`
  String get shoppingBag {
    return Intl.message(
      'Shopping bag',
      name: 'shoppingBag',
      desc: '',
      args: [],
    );
  }

  /// `You may want to fill in`
  String get youMayWantToFillIn {
    return Intl.message(
      'You may want to fill in',
      name: 'youMayWantToFillIn',
      desc: '',
      args: [],
    );
  }

  /// `Login Required`
  String get loginRequired {
    return Intl.message(
      'Login Required',
      name: 'loginRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please login to continue`
  String get pleaseLoginToContinue {
    return Intl.message(
      'Please login to continue',
      name: 'pleaseLoginToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Please select the products you wish to pay for`
  String get pleaseSelectTheProductsYouWishToPayFor {
    return Intl.message(
      'Please select the products you wish to pay for',
      name: 'pleaseSelectTheProductsYouWishToPayFor',
      desc: '',
      args: [],
    );
  }

  /// `Share My Cart`
  String get shareMyCart {
    return Intl.message(
      'Share My Cart',
      name: 'shareMyCart',
      desc: '',
      args: [],
    );
  }

  /// `More details`
  String get moreDetails {
    return Intl.message(
      'More details',
      name: 'moreDetails',
      desc: '',
      args: [],
    );
  }

  /// `Please select a size`
  String get pleaseSelectASize {
    return Intl.message(
      'Please select a size',
      name: 'pleaseSelectASize',
      desc: '',
      args: [],
    );
  }

  /// `Please select a unit`
  String get pleaseSelectAUnit {
    return Intl.message(
      'Please select a unit',
      name: 'pleaseSelectAUnit',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------confirmOrder-----------' key

  /// `Confirm order`
  String get confirmOrder {
    return Intl.message(
      'Confirm order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Shipping method`
  String get shippingMethod {
    return Intl.message(
      'Shipping method',
      name: 'shippingMethod',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Have a coupon or discount voucher?`
  String get haveACouponOrDiscountVoucher {
    return Intl.message(
      'Have a coupon or discount voucher?',
      name: 'haveACouponOrDiscountVoucher',
      desc: '',
      args: [],
    );
  }

  /// `The total`
  String get theTotal {
    return Intl.message(
      'The total',
      name: 'theTotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery cost`
  String get deliveryCost {
    return Intl.message(
      'Delivery cost',
      name: 'deliveryCost',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discountOnBill {
    return Intl.message(
      'Discount',
      name: 'discountOnBill',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Please chose a payment method`
  String get pleaseChoseAPaymentMethod {
    return Intl.message(
      'Please chose a payment method',
      name: 'pleaseChoseAPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Please chose a shipping method`
  String get pleaseChoseAShippingMethod {
    return Intl.message(
      'Please chose a shipping method',
      name: 'pleaseChoseAShippingMethod',
      desc: '',
      args: [],
    );
  }

  /// `Recipient's phone number`
  String get recipientsPhoneNumber {
    return Intl.message(
      'Recipient\'s phone number',
      name: 'recipientsPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the recipient's phone number`
  String get pleaseEnterTheRecipientsPhoneNumber {
    return Intl.message(
      'Please enter the recipient\'s phone number',
      name: 'pleaseEnterTheRecipientsPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address is required`
  String get addressIsRequired {
    return Intl.message(
      'Address is required',
      name: 'addressIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Back to home`
  String get backToHome {
    return Intl.message(
      'Back to home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Successful`
  String get transactionSuccessful {
    return Intl.message(
      'Transaction Successful',
      name: 'transactionSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been successful placed. Thank you for shopping with us.`
  String get yourOrderHasBeenSuccessfulPlacedThankYouForShoppingWithUs {
    return Intl.message(
      'Your order has been successful placed. Thank you for shopping with us.',
      name: 'yourOrderHasBeenSuccessfulPlacedThankYouForShoppingWithUs',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------address-----------' key

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Your address`
  String get yourAddress {
    return Intl.message(
      'Your address',
      name: 'yourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add a new address`
  String get addANewAddress {
    return Intl.message(
      'Add a new address',
      name: 'addANewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit address`
  String get editAddress {
    return Intl.message(
      'Edit address',
      name: 'editAddress',
      desc: '',
      args: [],
    );
  }

  /// `Confirm address`
  String get confirmAddress {
    return Intl.message(
      'Confirm address',
      name: 'confirmAddress',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this address?`
  String get doYouWantToDeleteThisAddress {
    return Intl.message(
      'Do you want to delete this address?',
      name: 'doYouWantToDeleteThisAddress',
      desc: '',
      args: [],
    );
  }

  /// `The address will be permanently deleted`
  String get theAddressWillBePermanentlyDeleted {
    return Intl.message(
      'The address will be permanently deleted',
      name: 'theAddressWillBePermanentlyDeleted',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message(
      'Province',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `Province is required`
  String get provinceIsRequired {
    return Intl.message(
      'Province is required',
      name: 'provinceIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please chose a city`
  String get pleaseChoseACity {
    return Intl.message(
      'Please chose a city',
      name: 'pleaseChoseACity',
      desc: '',
      args: [],
    );
  }

  /// `To specify the area`
  String get toSpecifyTheArea {
    return Intl.message(
      'To specify the area',
      name: 'toSpecifyTheArea',
      desc: '',
      args: [],
    );
  }

  /// `Nearest landmark`
  String get nearestLandmark {
    return Intl.message(
      'Nearest landmark',
      name: 'nearestLandmark',
      desc: '',
      args: [],
    );
  }

  /// `Nearest landmark is required`
  String get nearestLandmarkIsRequired {
    return Intl.message(
      'Nearest landmark is required',
      name: 'nearestLandmarkIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please locate on the map*`
  String get pleaseLocateOnTheMap {
    return Intl.message(
      'Please locate on the map*',
      name: 'pleaseLocateOnTheMap',
      desc: '',
      args: [],
    );
  }

  /// `*Please add a new accurate address to enjoy a unique delivery experience.`
  String get pleaseAddANewAccurateAddressToEnjoyAUniqueDeliveryExperience {
    return Intl.message(
      '*Please add a new accurate address to enjoy a unique delivery experience.',
      name: 'pleaseAddANewAccurateAddressToEnjoyAUniqueDeliveryExperience',
      desc: '',
      args: [],
    );
  }

  /// `The address you entered is not within the delivery range. Please double-check and select the correct address`
  String get theAddressYouEnteredIsNotWithinTheDeliveryRange {
    return Intl.message(
      'The address you entered is not within the delivery range. Please double-check and select the correct address',
      name: 'theAddressYouEnteredIsNotWithinTheDeliveryRange',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------profile-----------' key

  /// `Coupons`
  String get coupons {
    return Intl.message(
      'Coupons',
      name: 'coupons',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get points {
    return Intl.message(
      'points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Gift card`
  String get giftCard {
    return Intl.message(
      'Gift card',
      name: 'giftCard',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Survey center`
  String get surveyCenter {
    return Intl.message(
      'Survey center',
      name: 'surveyCenter',
      desc: '',
      args: [],
    );
  }

  /// `Free trial center`
  String get freeTrialCenter {
    return Intl.message(
      'Free trial center',
      name: 'freeTrialCenter',
      desc: '',
      args: [],
    );
  }

  /// `Join now`
  String get joinNow {
    return Intl.message(
      'Join now',
      name: 'joinNow',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------myOrder-----------' key

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrder {
    return Intl.message(
      'My Orders',
      name: 'myOrder',
      desc: '',
      args: [],
    );
  }

  /// `All orders`
  String get allOrders {
    return Intl.message(
      'All orders',
      name: 'allOrders',
      desc: '',
      args: [],
    );
  }

  /// `Unpaid`
  String get unpaid {
    return Intl.message(
      'Unpaid',
      name: 'unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Shipped`
  String get shipped {
    return Intl.message(
      'Shipped',
      name: 'shipped',
      desc: '',
      args: [],
    );
  }

  /// `Returns`
  String get returns {
    return Intl.message(
      'Returns',
      name: 'returns',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Request`
  String get request {
    return Intl.message(
      'Request',
      name: 'request',
      desc: '',
      args: [],
    );
  }

  /// `Payment details:`
  String get paymentDetails {
    return Intl.message(
      'Payment details:',
      name: 'paymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Total goods:`
  String get totalGoods {
    return Intl.message(
      'Total goods:',
      name: 'totalGoods',
      desc: '',
      args: [],
    );
  }

  /// `Opinions`
  String get opinions {
    return Intl.message(
      'Opinions',
      name: 'opinions',
      desc: '',
      args: [],
    );
  }

  /// `Shipping time`
  String get shippingTime {
    return Intl.message(
      'Shipping time',
      name: 'shippingTime',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Colors`
  String get colors {
    return Intl.message(
      'Colors',
      name: 'colors',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Unity`
  String get unity {
    return Intl.message(
      'Unity',
      name: 'unity',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------reviews-----------' key

  /// `Evaluations`
  String get evaluations {
    return Intl.message(
      'Evaluations',
      name: 'evaluations',
      desc: '',
      args: [],
    );
  }

  /// `Add Rating`
  String get addRating {
    return Intl.message(
      'Add Rating',
      name: 'addRating',
      desc: '',
      args: [],
    );
  }

  /// `Can you leave your review?`
  String get canYouLeaveYourReview {
    return Intl.message(
      'Can you leave your review?',
      name: 'canYouLeaveYourReview',
      desc: '',
      args: [],
    );
  }

  /// `Does the product size fit well?`
  String get doesTheProductSizeFitWell {
    return Intl.message(
      'Does the product size fit well?',
      name: 'doesTheProductSizeFitWell',
      desc: '',
      args: [],
    );
  }

  /// `Add a comment`
  String get AddAComment {
    return Intl.message(
      'Add a comment',
      name: 'AddAComment',
      desc: '',
      args: [],
    );
  }

  /// `Please add a comment`
  String get pleaseAddAComment {
    return Intl.message(
      'Please add a comment',
      name: 'pleaseAddAComment',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get small {
    return Intl.message(
      'Small',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `Appropriate`
  String get appropriate {
    return Intl.message(
      'Appropriate',
      name: 'appropriate',
      desc: '',
      args: [],
    );
  }

  /// `Big`
  String get big {
    return Intl.message(
      'Big',
      name: 'big',
      desc: '',
      args: [],
    );
  }

  /// `Add photos`
  String get addPhotos {
    return Intl.message(
      'Add photos',
      name: 'addPhotos',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------settings-----------' key

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Address Book`
  String get addressBook {
    return Intl.message(
      'Address Book',
      name: 'addressBook',
      desc: '',
      args: [],
    );
  }

  /// `Manage My Account`
  String get manageMyAccount {
    return Intl.message(
      'Manage My Account',
      name: 'manageMyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Contact Preferences`
  String get contactPreferences {
    return Intl.message(
      'Contact Preferences',
      name: 'contactPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Clear Cache`
  String get clearCache {
    return Intl.message(
      'Clear Cache',
      name: 'clearCache',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Cookie Policy`
  String get privacyAndCookiePolicy {
    return Intl.message(
      'Privacy & Cookie Policy',
      name: 'privacyAndCookiePolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Rating & Feedback`
  String get ratingAndFeedback {
    return Intl.message(
      'Rating & Feedback',
      name: 'ratingAndFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Connect to Us`
  String get connectToUs {
    return Intl.message(
      'Connect to Us',
      name: 'connectToUs',
      desc: '',
      args: [],
    );
  }

  /// `About Jeeey`
  String get aboutJeeey {
    return Intl.message(
      'About Jeeey',
      name: 'aboutJeeey',
      desc: '',
      args: [],
    );
  }

  /// `SIGN OUT`
  String get signOut {
    return Intl.message(
      'SIGN OUT',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to sign out?`
  String get doYouReallyWantToSignOut {
    return Intl.message(
      'Do you really want to sign out?',
      name: 'doYouReallyWantToSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Application language`
  String get applicationLanguage {
    return Intl.message(
      'Application language',
      name: 'applicationLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Change currency`
  String get changeCurrency {
    return Intl.message(
      'Change currency',
      name: 'changeCurrency',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------user-----------' key

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password to log in to your Jeeey account`
  String get enterYourPasswordToLogInToYourJeeeyAccount {
    return Intl.message(
      'Enter your password to log in to your Jeeey account',
      name: 'enterYourPasswordToLogInToYourJeeeyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Hello my new friend!`
  String get helloMyNewFriend {
    return Intl.message(
      'Hello my new friend!',
      name: 'helloMyNewFriend',
      desc: '',
      args: [],
    );
  }

  /// `Specify your name and password to create a Jeeey account`
  String get specifyYourNameAndPasswordToCreateAJeeeyAccount {
    return Intl.message(
      'Specify your name and password to create a Jeeey account',
      name: 'specifyYourNameAndPasswordToCreateAJeeeyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone number or email:`
  String get phoneNumberOrEmail {
    return Intl.message(
      'Phone number or email:',
      name: 'phoneNumberOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get userName {
    return Intl.message(
      'Name:',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get logIn {
    return Intl.message(
      'Log in',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password:`
  String get password {
    return Intl.message(
      'Password:',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPassword {
    return Intl.message(
      'Old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password`
  String get createANewPassword {
    return Intl.message(
      'Create a new password',
      name: 'createANewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Resend code in`
  String get resendCodeIN {
    return Intl.message(
      'Resend code in',
      name: 'resendCodeIN',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Code has been send to`
  String get codeHasBeenSendTo {
    return Intl.message(
      'Code has been send to',
      name: 'codeHasBeenSendTo',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Continue with google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Facebook with Continue`
  String get continueWithFacebook {
    return Intl.message(
      'Facebook with Continue',
      name: 'continueWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `15% discount\n on your first offer`
  String get discount {
    return Intl.message(
      '15% discount\n on your first offer',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `jeeey cloub alglaban\n exclusive benefits`
  String get exclusiveBenefits {
    return Intl.message(
      'jeeey cloub alglaban\n exclusive benefits',
      name: 'exclusiveBenefits',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get atLeast8Characters {
    return Intl.message(
      'At least 8 characters',
      name: 'atLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `At least one letter`
  String get atLeastOneLetter {
    return Intl.message(
      'At least one letter',
      name: 'atLeastOneLetter',
      desc: '',
      args: [],
    );
  }

  /// `At least one number`
  String get atLeastOneNumber {
    return Intl.message(
      'At least one number',
      name: 'atLeastOneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number or email`
  String get pleaseEnterYourPhoneNumberOrEmail {
    return Intl.message(
      'Please enter your phone number or email',
      name: 'pleaseEnterYourPhoneNumberOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter old password`
  String get pleaseEnterOldPassword {
    return Intl.message(
      'Please enter old password',
      name: 'pleaseEnterOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please enter your name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code`
  String get pleaseEnterTheVerificationCode {
    return Intl.message(
      'Please enter the verification code',
      name: 'pleaseEnterTheVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get pleaseConfirmYourPassword {
    return Intl.message(
      'Please confirm your password',
      name: 'pleaseConfirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password do not match`
  String get passwordDoNotMatch {
    return Intl.message(
      'Password do not match',
      name: 'passwordDoNotMatch',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------success-----------' key

  /// `The operation was completed successfully`
  String get successfully {
    return Intl.message(
      'The operation was completed successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `The password has been changed`
  String get thePasswordHasBeenChanged {
    return Intl.message(
      'The password has been changed',
      name: 'thePasswordHasBeenChanged',
      desc: '',
      args: [],
    );
  }

  /// `Deleted address successfully`
  String get deletedAddressSuccessfully {
    return Intl.message(
      'Deleted address successfully',
      name: 'deletedAddressSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Logout successfully`
  String get logoutSuccessfully {
    return Intl.message(
      'Logout successfully',
      name: 'logoutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Products have been added to the list`
  String get productsHaveBeenAddedToTheList {
    return Intl.message(
      'Products have been added to the list',
      name: 'productsHaveBeenAddedToTheList',
      desc: '',
      args: [],
    );
  }

  /// `The modification has been completed successfully`
  String get theModificationHasBeenCompletedSuccessfully {
    return Intl.message(
      'The modification has been completed successfully',
      name: 'theModificationHasBeenCompletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `The list has been deleted successfully`
  String get theListHasBeenDeletedSuccessfully {
    return Intl.message(
      'The list has been deleted successfully',
      name: 'theListHasBeenDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Deleted successfully`
  String get deletedSuccessfully {
    return Intl.message(
      'Deleted successfully',
      name: 'deletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `A new list has been created successfully`
  String get aNewListHasBeenCreatedSuccessfully {
    return Intl.message(
      'A new list has been created successfully',
      name: 'aNewListHasBeenCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '--------error-----------' key

  /// `Sorry, no internet connection`
  String get network {
    return Intl.message(
      'Sorry, no internet connection',
      name: 'network',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get network2 {
    return Intl.message(
      'Check your internet connection',
      name: 'network2',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there is an internet issue`
  String get timeout {
    return Intl.message(
      'Sorry, there is an internet issue',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  /// `Please try again`
  String get pleaseTryAgain {
    return Intl.message(
      'Please try again',
      name: 'pleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect verification code`
  String get incorrectVerificationCode {
    return Intl.message(
      'Incorrect verification code',
      name: 'incorrectVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Please check the verification code`
  String get incorrectVerificationCode2 {
    return Intl.message(
      'Please check the verification code',
      name: 'incorrectVerificationCode2',
      desc: '',
      args: [],
    );
  }

  /// `Verification code expired`
  String get verificationCodeExpired {
    return Intl.message(
      'Verification code expired',
      name: 'verificationCodeExpired',
      desc: '',
      args: [],
    );
  }

  /// `Please resend the verification code`
  String get verificationCodeExpired2 {
    return Intl.message(
      'Please resend the verification code',
      name: 'verificationCodeExpired2',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Please check the phone number or email`
  String get pleaseCheckThePhoneNumberOrEmail {
    return Intl.message(
      'Please check the phone number or email',
      name: 'pleaseCheckThePhoneNumberOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get incorrectPassword {
    return Intl.message(
      'Incorrect password',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Account not found`
  String get accountNotFound {
    return Intl.message(
      'Account not found',
      name: 'accountNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Please verify the account`
  String get pleaseVerifyTheAccount {
    return Intl.message(
      'Please verify the account',
      name: 'pleaseVerifyTheAccount',
      desc: '',
      args: [],
    );
  }

  /// `The password does not meet the conditions`
  String get thePasswordDoesNotMeetTheConditions {
    return Intl.message(
      'The password does not meet the conditions',
      name: 'thePasswordDoesNotMeetTheConditions',
      desc: '',
      args: [],
    );
  }

  /// `Password is same user password`
  String get passwordIsSameUserPassword {
    return Intl.message(
      'Password is same user password',
      name: 'passwordIsSameUserPassword',
      desc: '',
      args: [],
    );
  }

  /// `The product is already in the cart`
  String get theProductIsAlreadyInTheCart {
    return Intl.message(
      'The product is already in the cart',
      name: 'theProductIsAlreadyInTheCart',
      desc: '',
      args: [],
    );
  }

  /// `If you want to modify the product, go to the shopping bag`
  String get ifYouWantToModifyTheProductGoToTheShoppingBag {
    return Intl.message(
      'If you want to modify the product, go to the shopping bag',
      name: 'ifYouWantToModifyTheProductGoToTheShoppingBag',
      desc: '',
      args: [],
    );
  }

  /// `User cannot`
  String get userCannot {
    return Intl.message(
      'User cannot',
      name: 'userCannot',
      desc: '',
      args: [],
    );
  }

  /// `add more than one review on one product`
  String get addMoreThanOneReviewOnOneProduct {
    return Intl.message(
      'add more than one review on one product',
      name: 'addMoreThanOneReviewOnOneProduct',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
