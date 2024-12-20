import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mail_app/constant.dart';
import 'package:mail_app/screens/extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'email.dart';

class EmailCard extends StatelessWidget {
  const EmailCard({
    Key? key,
    this.isActive = true,
    this.email,
    this.press,
  }) : super(key: key);

  final bool? isActive;
  final Email? email;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: kDefaultPadding,
      ),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isActive! ? kBgDarkColor : kPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            email?.image ?? 'assets/default_avatar.png',
                          ),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${email?.name ?? 'Unknown'}\n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive! ? Colors.white : kTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: email?.subject ?? 'No Subject',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                  color:
                                  isActive! ? Colors.white : kTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email?.time ?? 'Unknown Time',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                              color: isActive! ? Colors.white70 : null,
                            ),
                          ),
                          const SizedBox(height: 5),
                          if (email?.isAttachmentAvailable ?? false)
                            SvgPicture.asset(
                              "assets/icons/Paperclip.svg",
                              height: 18,
                              color: isActive! ? Colors.white : kTextColor,
                            ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    email?.body ?? 'No Content',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      height: 1.5,
                      color: isActive! ? Colors.white70 : null,
                    ),
                  ),
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: const Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: const Color(0xFF234395).withOpacity(0.15),
            ),
            if (!(email?.isChecked ?? true))
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: kBadgeColor,
                    shape: BoxShape.circle,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: const Offset(2, 2),
                ),
              ),
            Positioned(
              right: 8,
              top: 0,
              child: SvgPicture.asset(
                "assets/Icons/Markup filled.svg",
                height: 18,
                color: email?.tagColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
