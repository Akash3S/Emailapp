import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mail_app/responsive.dart';
import 'package:mail_app/screens/main/component/side_menu_item.dart';
import 'package:mail_app/screens/main/component/tags.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constant.dart';

class Sidemenu extends StatelessWidget {

  const Sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/Logo Outlook.png",
                      width: 46,
                    ),
                    Spacer(),
                    if (!Responsive.isDesktop(context))
                      CloseButton(),
                  ],
                ),
                SizedBox(height: kDefaultPadding),
            
                // Fix the ElevatedButton
                ElevatedButton.icon(
                  // Add style property
                  style: ElevatedButton.styleFrom(

                    backgroundColor: kPrimaryColor, // Instead of color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                    ),
                  ),
                  onPressed: () {},
                  icon: WebsafeSvg.asset(
                    "assets/Icons/Edit.svg",
                    width: 16,
                  ),
                  label: Text(
                    "New message",
                    style: TextStyle(color: Colors.white),
                  ),
            
                ),
                SizedBox(height: kDefaultPadding,),
                ElevatedButton.icon(
                  // Add style property
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor, // Instead of color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  icon: WebsafeSvg.asset(
                    "assets/Icons/Download.svg",
                    width: 16,
                  ),
                  label: Text(
                    "Get messages",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: kDefaultPadding * 2),
               SideMenuItem(
                 press: (){},
                 title: "Inbox",
                 iconSrc: "assets/icons/Inbox.sug",
                 isActive: true,
                 itemCount: 3,
               ),
              SideMenuItem(
                press: (){},
                title: "Sent",
                iconSrc: "assets/icons/Send.sug",
                isActive: false,
              ),
                SideMenuItem(
                  press: (){},
                  title: "Drafts",
                  iconSrc:"assets/icons/File.sug" ,
            
                ),
                SideMenuItem(
                  press: (){},
                  title: "Deletd",
                  iconSrc: "assets/icons/Trash.sug",
                  isActive: false,
                  showBorder: false,
                ),
                SizedBox(height: kDefaultPadding*2,),
                Tags(),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}