import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mail_app/screens/main/emails_screen.dart';
import 'package:mail_app/screens/main/side_menu.dart';

import '../responsive.dart';
import 'main/list_of_emails.dart';

class MainScreen extends StatefulWidget{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
     body: Responsive(
         mobile: ListOfEmails(),
       tablet: Row(
         children: [
           Expanded(
             flex: 3,
               child: ListOfEmails()),
           Expanded(
               flex:8,
               child: EmailScreen(),
           )
         ],
       ),
        desktop: Row(
          children: [
            Expanded(
                flex: _size.width > 1340 ? 2 : 6,
                child: Sidemenu(),
                ),
          Expanded(
            flex: _size.width > 1340 ? 3 : 5,
            child: ListOfEmails(),
          ), Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: EmailScreen(),
            ),
          ],
        ),


     )

   );
  }
}
