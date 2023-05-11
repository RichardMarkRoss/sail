class AppUrls {
  static const String baseUrl = 'https://user.51mdss.com'; // Basic interface address
  static const String baseApiUrl = '$baseUrl/api/v1'; // Basic interface address

  static const String login = '$baseApiUrl/passport/auth/login';
  static const String register = '$baseApiUrl/passport/auth/register';
  static const String getQuickLoginUrl = '$baseApiUrl/passport/auth/getQuickLoginUrl';

  static const String userSubscribe = '$baseApiUrl/user/getSubscribe';
  static const String plan = '$baseApiUrl/guest/plan/fetch';
  static const String server = '$baseApiUrl/user/server/fetch';
  static const String userInfo = '$baseApiUrl/user/info';
}
