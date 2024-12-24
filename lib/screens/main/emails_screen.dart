import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mail_app/constant.dart';
import 'package:mail_app/screens/main/component/header.dart';

import 'component/email.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({
    Key? key,
    this.email,
  }) : super(key: key);

  final Email? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Header(),
              Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 24,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/images/user_image.png"), // Replace with a valid image
                        ),
                        SizedBox(width: kDefaultPadding),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text: "Elvia Atkins",
                                            style: Theme.of(context).textTheme.labelLarge,
                                            children: [
                                              TextSpan(
                                                text: "  <elvia.atkins@gmail.com> to Jerry Torp",
                                                style: Theme.of(context).textTheme.bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Inspiration for our new home",
                                          style: Theme.of(context).textTheme.headlineLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: kDefaultPadding / 2),
                                  Text(
                                    "Today at 15:32",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              SizedBox(height: kDefaultPadding),
                              LayoutBuilder(
                                builder: (context, constraints) => SizedBox(
                                  width: constraints.maxWidth > 850 ? 800 : constraints.maxWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello my love,\n\n"
                                            "Sunt architecto voluptatum esse tempora sint nihil "
                                            "minus incidunt nisi. Perspiciatis natus quo unde magnam numquam "
                                            "pariatur amet ut. Perspiciatis ab totam. Ut labore maxime provident. "
                                            "Voluptate ea omnis et ipsum asperiores laborum repellat explicabo fuga. "
                                            "Dolore voluptatem praesentium quis eos laborum dolores cupiditate nemo labore.\n\n"
                                            "Love you,\n\nElvia",
                                        style: TextStyle(
                                          height: 1.5,
                                          color: Color(0xFF4D5875),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(height: kDefaultPadding),
                                      Row(
                                        children: [
                                          Text(
                                            "6 attachments",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Spacer(),
                                          Text(
                                            "Download All",
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                          SizedBox(width: kDefaultPadding / 4),
                                          IconButton(
                                            icon: Icon(Icons.download),
                                            color: Colors.grey,
                                            iconSize: 20,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: kDefaultPadding / 2),
                                      Divider(thickness: 1),
                                      SizedBox(
                                        height: 200,
                                       child: Row(

                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Container(
                                             height: 200,
                                             width: 250,
                                             child: SingleChildScrollView(
                                               child: Column(
                                                                                           // mainAxisAlignment: MainAxisAlignment.center,
                                               
                                                 children: [
                                                   SingleChildScrollView(scrollDirection: Axis.vertical,),
                                                                                      Container(height: 100,width: 230,
                                               child: Image.asset('assets/images/img_0.png',fit: BoxFit.cover,)),
                                                                                       SizedBox(height: 7,),
                                               
                                                                                       Container(height: 100,width: 230,
                                                child: Image.asset('assets/images/img_2.png',fit: BoxFit.cover,)),
                                                 ],
                                               ),
                                             ),
                                           ),
                                          // SizedBox(width: 15,),

                                        Container(height: 200,width: 290,
                                            child: Image.asset('assets/images/img_1.png',fit: BoxFit.cover,))

                                       ],
                                       ),
                                      ),
                                   ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
