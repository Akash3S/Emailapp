import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mail_app/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constant.dart';

class Sidemenu extends StatelessWidget{

const Sidemenu({
   required Key key,
}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
       Row(
         children: [
           Image.asset("assets/images/Logo Outlook.png",width: 46,),
           Spacer(),
           if(!Responsive.isDesktop(context))CloseButton(),
         ],
       ),
         SizedBox(height: kDefaultPadding,),
            FlatButton.icon(
              minWidth: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: kPrimaryColor,
              onPressed: () {},
              icon: WebsafeSvg.asset("assets/Icons/Edit.svg", width: 16),
              label: Text(
                "New message",
                style: TextStyle(color: Colors.white),
              ),
            ).addNeumorphism(
              topShadowColor: Colors.white,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
            ),

          ],
        ),

      )),
    );
  }

}