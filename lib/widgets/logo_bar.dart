import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sail/constant/app_colors.dart';
import 'package:sail/constant/app_strings.dart';
import 'package:sail/models/app_model.dart';
import 'package:sail/models/user_model.dart';
import 'package:sail/models/user_subscribe_model.dart';
import 'package:sail/utils/navigator_util.dart';

class LogoBar extends StatelessWidget {
  const LogoBar({
    Key? key,
    required this.isOn,
  }) : super(key: key);

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    AppModel appModel = Provider.of<AppModel>(context);
    UserModel userModel = Provider.of<UserModel>(context);
    UserSubscribeModel userSubscribeModel = Provider.of<UserSubscribeModel>(context);

    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(60)),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Material(
                  color: isOn ? const Color(0x66000000) : AppColors.yellowColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setWidth(10), horizontal: ScreenUtil().setWidth(30)),
                      child: Text(
                        "Lotto",
                        style:
                        TextStyle(fontSize: ScreenUtil().setSp(36), color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(15))),
                Material(
                  color: isOn ? const Color(0x66000000) : AppColors.blueColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setWidth(10), horizontal: ScreenUtil().setWidth(30)),
                      child: Text(
                        "Powerball",
                        style:
                        TextStyle(fontSize: ScreenUtil().setSp(36), color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(15))),
                Material(
                  color: isOn ? const Color(0x66000000) : AppColors.redColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setWidth(10), horizontal: ScreenUtil().setWidth(30)),
                      child: Text(
                        "Daily",
                        style:
                        TextStyle(fontSize: ScreenUtil().setSp(36), color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(15))),
                Material(
                  color: isOn ? const Color(0x66000000) : AppColors.greenColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setWidth(10), horizontal: ScreenUtil().setWidth(30)),
                      child: Text(
                        "Sport Stake",
                        style:
                        TextStyle(fontSize: ScreenUtil().setSp(36), color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
