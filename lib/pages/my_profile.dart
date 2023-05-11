import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sail/models/user_model.dart';
import 'package:sail/service/user_service.dart';
import 'package:sail/utils/navigator_util.dart';
import 'package:sail/widgets/bottom_block.dart';
import 'package:sail/widgets/profile_widget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  MyProfileState createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> {
  late UserModel _userModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userModel = Provider.of<UserModel>(context);
  }

  void onLogoutTap() {
    _userModel.logout();
    NavigatorUtil.goLogin(context);
  }

  void onWebLinkTap(String name, String link) => _userModel.checkHasLogin(
      context,
      () => UserService().getQuickLoginUrl({'redirect': link})?.then((value) {
            NavigatorUtil.goWebView(context, name, value);
          }));

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(32),
                left: ScreenUtil().setWidth(32),
                top: ScreenUtil().setHeight(32),
                bottom: ScreenUtil().setHeight(32)),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                child: Column(
                  children: <Widget>[
                    ProfileWidget(
                      avatar: _userModel.userEntity?.avatarUrl ?? "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1683799585~exp=1683800185~hmac=0afd4b35a90c0a09259f73a065f7d1930aed2b0853bd1390267d17323df1babe",
                      userName: _userModel.userEntity?.email ?? "login",
                      onTap: onLogoutTap,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                        ),
                      ),
                    ),
                    FinanceWidget(onWebLinkTap: onWebLinkTap),
                    Container(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                        ),
                      ),
                    ),
                    AccountWidget(onWebLinkTap: onWebLinkTap),
                  ],
                ),
              ),
            ),
          ),
          const BottomBlock(),
        ],
      ),
    ));
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key, required this.onWebLinkTap}) : super(key: key);

  final dynamic onWebLinkTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "account",
                  style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () => onWebLinkTap("personal center", '/profile'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "⚙️ Account Settings",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () => onWebLinkTap("my ticket", "/ticket"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "📲 Contact us",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FinanceWidget extends StatelessWidget {
  const FinanceWidget({Key? key, required this.onWebLinkTap}) : super(key: key);

  final dynamic onWebLinkTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "finance",
                  style: TextStyle(
                    color: Color(0xFFADADAD),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () => onWebLinkTap("My Order", "/order"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "💳 Card details",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () => onWebLinkTap("my invitation", "/invite"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "📥 Inbox",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
