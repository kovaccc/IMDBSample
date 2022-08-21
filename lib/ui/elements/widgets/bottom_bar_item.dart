import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/paddings.dart';
import '../../resources/text_styles.dart';

class BottomBarItem extends StatelessWidget {
  final bool isSelected;
  final String leadingIconPath;
  final String label;
  final void Function() onPressed;

  const BottomBarItem(
      {Key? key,
      required this.isSelected,
      required this.leadingIconPath,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          SizedBox(
            height: 3,
            width: ImdbPaddings(context).screenWidth * 0.25,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: isSelected
                      ? ImdbColors.primaryOrange
                      : ImdbColors.secondaryBlack),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(leadingIconPath,
                    color:
                        isSelected ? ImdbColors.primaryOrange : Colors.white),
                ImdbPaddings(context).extraSmallHorizontalSizedBox(),
                Text(label,
                    style: isSelected
                        ? ImdbTextStyles.paragraph2SfOrangeBold
                        : ImdbTextStyles.paragraph2SfWhiteBold)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
