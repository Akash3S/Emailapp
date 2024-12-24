import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mail_app/responsive.dart';
import 'package:mail_app/screens/main/component/side_menu_item.dart';
import 'package:mail_app/screens/main/component/tags.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constant.dart';

class Sidemenu extends StatefulWidget {

  const Sidemenu({Key? key}) : super(key: key);

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {

  final outlooksSmtp=
  hotmail(dotenv.env["OUTLOOK EMAIL"]!,dotenv.env["OUTLOOK EMAIL"]!);
  sendMailFromOutlook()async{
    final message = Message()
      ..from = Address(dotenv.env["OUTLOOK EMAIL"]!, 'Confarmation bot')
      ..recipients.add('bacolo9339@ronete.com')

      ..subject = 'This is just check test mail'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.';
     // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, outlooksSmtp);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
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
                Padding(
                    padding: const EdgeInsets.only(right: 108),
                    child: TextButton.icon(
                      icon: const Icon(Icons.error_outlined,color: Colors.black,size: 20,),
                      label: const Text('Sent',style: TextStyle(color: Colors.grey),),
                      onPressed: (){
                        sendMailFromOutlook();
                      },),
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