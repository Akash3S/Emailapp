import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mail_app/responsive.dart';
import 'package:mail_app/screens/main/component/email.dart';
import 'package:mail_app/screens/main/side_menu.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constant.dart';
import 'component/email_card.dart';
import 'emails_screen.dart';

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({
   Key? key,
  }) : super(key: key);

  @override
  State<ListOfEmails> createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: ConstrainedBox(
           constraints:BoxConstraints(maxWidth: 250),
           child: Sidemenu()),
      key: _scaffoldKey,
      body: Container(
        child:  Padding(
          padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
          child: SafeArea(
            right: false,
              child:  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Row(
                  children: [
                    if(!Responsive.isDesktop(context))
              IconButton(
              icon: Icon(Icons.menu),
                onPressed: (){
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
                    if(!Responsive.isDesktop(context))
                    SizedBox(height: 5,),
                    Expanded(
                        child: TextField(
                      onChanged: (value){},
                      decoration: InputDecoration(
                        hintText: "Search",
                            fillColor: kBgLightColor,
                        filled: true,
                        suffixIcon: Padding(padding:const EdgeInsets.all(kDefaultPadding*0.75),
                          child: WebsafeSvg.asset("assets/icons/search.sug",width: 24),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none
                        )
                      ),

                    ))
                  ],
                    ),
                  ),

                SizedBox(height: kDefaultPadding,),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                     child: Row(
                       children: [
                         IconButton(
                           icon: Icon(Icons.keyboard_arrow_down),
                           color: Colors.black,
                           iconSize: 20,
                           onPressed: () {

                           },
                         ),
                         SizedBox(width: 5,),
                         Text("Sort by date",style: TextStyle(fontWeight: FontWeight.w500),),
                         Spacer(),
                         IconButton(
                           icon: Icon(Icons.sort),
                           color: Colors.black,
                           iconSize: 20,
                           onPressed: () {

                           },
                         ),


                       ],
                     ),
                   ),
                  SizedBox(height: kDefaultPadding,),
                  Expanded(
                      child: ListView.builder(
                        itemCount: emails.length,
                          itemBuilder: (context,index)=>EmailCard(
                            isActive: Responsive.isMobile(context) ? false : index == 0,
                            email: emails[index],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EmailScreen(email: emails[index]),
                                ),
                              );
                            },
                          )
                        )
                      )
                    ],
                  )
                ),
              ),
           ),
         );
       }
      }