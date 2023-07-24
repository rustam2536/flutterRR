import '../pages/dashboard_page.dart';
import '../pages/login.dart';
import '../pages/settings.dart';
import '../pages/profile.dart';
import '../pages/work.dart';

getCurrentPage(currentPage, updatePage) {
  if (currentPage == "dashboard") {
    return const DashboardPage();
  } else if (currentPage == "settings") {
    return const SettingsPage();
  } else if (currentPage == "notifications") {
    return const Work1();
  } else if (currentPage == "login") {
    return Login(updatePage: updatePage);
  } else if (currentPage == "work") {
    return Work(updatePage: updatePage);
  }
}