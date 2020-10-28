import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_plus/constants.dart';
import 'package:go_plus/size_config.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key,
    this.iconSrc,
    this.title,
    this.color = kIconsColor,
    this.press,
  }) : super(key: key);
  final String iconSrc, title;
  final Color color;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize * 2, vertical: defaultSize * 2,
        ),
        child: SafeArea(
          child: Row(
            children: [
              SvgPicture.asset(
                iconSrc,
                height: 25,
                color: color,
              ),
              SizedBox(
                width: defaultSize * 2,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: defaultSize * 1.6,
                  color: kIconsColor,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 2.5,
                color: kIconsColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}