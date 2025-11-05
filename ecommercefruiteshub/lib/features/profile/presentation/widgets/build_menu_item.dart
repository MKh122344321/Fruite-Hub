import 'package:ecommercefruiteshub/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({
    super.key,
    required this.leadingWidget,
    required this.traillingWidget,
    required this.title,
    required this.onTap,
  });
  final Widget leadingWidget;
  final Widget traillingWidget;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingWidget,
      title: Text(
        title,
        style: TextStyles.semiBold13.copyWith(color: Color(0xff949D9E)),
      ),
      trailing: traillingWidget,
      onTap: onTap,
    );
  }
}
