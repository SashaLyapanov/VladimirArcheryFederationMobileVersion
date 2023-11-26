import '../features/news/news.dart';
import '../features/aboutUs/aboutUs.dart';
import '../features/auth/view/auth.dart';

final routes = {
  '/': (context) => AuthorizationPage(),
  '/news': (context) => NewsPage(),
  '/aboutUs': (context) => AboutUsPage(),
};