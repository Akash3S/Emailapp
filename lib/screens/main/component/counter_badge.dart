import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mail_app/screens/extension.dart';

import '../../../constant.dart';

class CounterBadge extends StatelessWidget{
  const CounterBadge({
    required Key key,
    required this.count,
  }) : super(key: key);

  final int count;
  @override
  Widget build(BuildContext context) {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
  decoration: BoxDecoration(
      color: kBadgeColor, borderRadius: BorderRadius.circular(9)),
  child: Text(
    count.toString(),
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ),
).addNeumorphism(
  offset: Offset(4, 4),
  borderRadius: 9,
  blurRadius: 4,
  topShadowColor: Colors.white,
  bottomShadowColor: Color(0xFF30384D).withOpacity(0.3),
);
  }

}