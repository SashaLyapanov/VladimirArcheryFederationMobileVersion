import '../features/news/news.dart';
import '../features/aboutUs/aboutUs.dart';
import '../features/auth/view/auth.dart';

final routes = {
  '/': (context) => NewsPage(),
  '/auth': (context) => AuthorizationPage(),
  '/aboutUs': (context) => AboutUsPage(),
};