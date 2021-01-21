import 'package:yourapp/model/CatigoreysModel.dart';
import 'package:yourapp/model/HomeSliderModel.dart';
import 'package:stripe_payment/stripe_payment.dart';

// --------------------- Error Masseges ----------------------------
const String emailErrorMessege = 'email is not valid';
const String passwordErrorMessege = 'password is not valid';
const String userErrorMessege = 'UserName is not valid';
const String confermPasswordErrorMessege = 'Password not match';
//---------------------HomeModelFakeData-----------------------------

List<HomeSliderModel> slider = [
  new HomeSliderModel(
      'https://www.techprevue.com/wp-content/uploads/2016/09/fashion-online-shopping-sites.jpg',
      'Urban Streetwear'),
  new HomeSliderModel(
      'https://assets.vogue.com/photos/5f5fac8b7d9362f52d645560/16:9/w_1280,c_limit/social-holding.jpg',
      'VOGA'),
  new HomeSliderModel(
      'https://www.savethestudent.org/uploads/Online-fashion-retailers.jpg',
      'HM'),
  new HomeSliderModel(
      'https://img.freepik.com/free-photo/young-woman-jumping-isolated-yellow-wall_1368-41656.jpg?size=626&ext=jpg',
      'ZARA'),
];

//---------------------CAtigores Fake Data----------------------------

List<CatigoreysModel> catigorys = [
  new CatigoreysModel(
      'https://image.freepik.com/free-photo/man-portrait_1296-628.jpg', 'MEN'),
  new CatigoreysModel(
      'https://img.freepik.com/free-photo/portrait-young-beautiful-hipster-bad-girl-trendy-red-hoodie-earring-her-nose-positive-model-having-fun-shows-tongue_158538-15460.jpg?size=626&ext=jpg',
      'WOMEN'),
  new CatigoreysModel(
      'https://image.freepik.com/free-photo/children-fashion-young-models-kids-posing_86390-1085.jpg',
      'KIDS'),
  new CatigoreysModel(
      'https://img.freepik.com/free-photo/top-view-open-woman-bag_155003-8360.jpg?size=626&ext=jpg&ga=GA1.2.1820064841.1606694400',
      'BAGS'),
  new CatigoreysModel(
      'https://image.freepik.com/free-photo/men-fashion-leather-derby-shoes-isolated-yellow_107612-405.jpg',
      'SHOSES'),
  new CatigoreysModel(
      'https://img.freepik.com/free-photo/businessman-checking-time_1357-97.jpg?size=626&ext=jpg',
      'WATCHES')
];

//--------------------Shipping Fee-------------------------------------
String shippingFee = '\$15.00';

//--------------------Estimated Tax-------------------------------------
String estimatedTax = '\$30.00';
//--------------------List of Cards------------------------------------
List<CreditCard> cards = [
  new CreditCard(
      number: '4242424242424242',
      expMonth: 02,
      expYear: 24,
      cvc: '129',
      name: 'Ali Motie'),
  new CreditCard(
      number: '5555555555554444',
      expMonth: 02,
      expYear: 24,
      cvc: '129',
      name: 'Ali Motie'),
  new CreditCard(
      number: '5555555555554444',
      expMonth: 02,
      expYear: 24,
      cvc: '129',
      name: 'Ali Motie'),
];

const Duration kBaseSettleDuration = Duration(milliseconds: 246);
