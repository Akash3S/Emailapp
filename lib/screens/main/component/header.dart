import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constant.dart';
import '../../../responsive.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
    child: Row(
    children: [
    // We need this back button on mobile only
    if (Responsive.isMobile(context)) BackButton(),
    IconButton(
      icon: WebsafeSvg.asset(
          "assets/Icons/Trash.sug",
        width: 24),
      onPressed: (){},
    ),
    IconButton(
    icon: WebsafeSvg.asset(
    "assets/Icons/Reply.svg",
    width: 24,
    ),
    onPressed: () {},
    ),
    IconButton(
    icon: WebsafeSvg.asset(
    "assets/Icons/Reply all.svg",
    width: 24,
    ),
    onPressed: () {},
    ),
    IconButton(
    icon: WebsafeSvg.asset(
    "assets/Icons/Transfer.svg",
    width: 24,
    ),
    onPressed: () {},
    ),
    Spacer(),
    // We don't need print option on mobile
    if (Responsive.isDesktop(context))
    IconButton(
    icon: WebsafeSvg.asset(
    "assets/Icons/Printer.svg",
    width: 24,
    ),
    onPressed: () {},
    ),
    IconButton(
    icon: WebsafeSvg.asset(
    "assets/Icons/Markup.svg",
    width: 24,
    ),
    onPressed: () {},
    ),
    IconButton(
    icon: WebsafeSvg.asset(
    "assets/Icons/More vertical.svg",
    width: 24,
    ),
    onPressed: () {},
    ),
    ],
    )
    );

  }

}