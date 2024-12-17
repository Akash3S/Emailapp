import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mail_app/screens/main/emails_screen.dart';
import 'package:mail_app/screens/main/side_menu.dart';

import '../responsive.dart';
import 'main/list_of_emails.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
     body: Responsive(
         mobile: ListOfEmails(),
       tablet: Row(
         children: [
           Expanded(
             flex: 6,
               child: ListOfEmails()),
           Expanded(
               flex:6,
               child: EmailScreen(),
           )
         ],
       ),
        desktop: Row(
          children: [
            Expanded(
                flex: _size.width > 1340 ? 2 : 4,
                child: Sidemenu(),
                ),
          Expanded(
            flex: _size.width > 1340 ? 8 : 10,
            child: EmailScreen(),
          )
          ],
        ),


     )

   );
  }
}
