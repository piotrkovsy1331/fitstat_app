import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/constants.dart';
import '../../../shared/size_config.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    this.iconSrc,
    this.title,
    this.press,
  }) : super(key: key);
  final String? iconSrc, title;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 4, vertical: defaultSize * 3),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(iconSrc!),
              SizedBox(width: defaultSize * 2),
              Text(
                title!,
                style: TextStyle(
                  fontSize: defaultSize * 1.6, //16
                  color: kTextLigntColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
