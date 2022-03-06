import 'package:flutter/material.dart';

import '../../../constants/assets/path.dart';
import '../../helpers/url_launch.dart';

class SocialMediaButton extends InkWell {
  SocialMediaButton(
    SocialMediaIcons iconData, {
    Key? key,
    String? url,
    bool mini = false,
    bool constrainMinWidth = true,
    double? iconSize,
    double? iconBorderRadius,
    double? splashRadius,
    double? splashBorderRadius,
    TextStyle? textStyle,
    GestureTapCallback? onTap,
    GestureTapCallback? onLongPress,
    ValueChanged<bool>? onHighlightChanged,
    ValueChanged<bool>? onHover,
  }) : super(
          key: key,
          borderRadius:
              BorderRadius.all(Radius.circular(splashBorderRadius ?? 4.0)),
          child: Builder(builder: (_) {
            String icon = getIconName(iconData);
            return ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constrainMinWidth && !mini ? 120.0 : 0.0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(iconBorderRadius ?? 4.0)),
                      child: Image(
                          image: AssetImage(
                              '${AssetPath.icons}/${icon.toLowerCase()}.png')),
                    ),
                    iconSize: iconSize ?? 24.0,
                    splashRadius: splashRadius,
                    onPressed: !mini ? null : (onTap ?? (url == null ? null : () async => await URLHelper.open(url))),
                  ),
                  Visibility(
                    visible: !mini,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        icon,
                        style: textStyle ??
                            const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          onTap: mini ? null : (onTap ?? (url == null ? null : () async => await URLHelper.open(url))),
          onLongPress: onLongPress,
          onHover: onHover,
          onHighlightChanged: onHighlightChanged,
        );

  static String getIconName(SocialMediaIcons iconData) {
    switch (iconData) {
      case SocialMediaIcons.facebook:
        return 'Facebook';
      case SocialMediaIcons.github:
        return 'GitHub';
      case SocialMediaIcons.instagram:
        return 'Instagram';
      case SocialMediaIcons.linkedIn:
        return 'LinkedIn';
      case SocialMediaIcons.medium:
        return 'Medium';
      case SocialMediaIcons.twitter:
        return 'Twitter';
      case SocialMediaIcons.youtube:
        return 'YouTube';
    }
  }
}

enum SocialMediaIcons {
  facebook,
  instagram,
  github,
  linkedIn,
  medium,
  twitter,
  youtube,
}
