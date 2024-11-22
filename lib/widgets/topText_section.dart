import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../decorations/custom_color.dart';

class TopTextSection extends StatelessWidget {
  const TopTextSection({
    required this.topTextfirst,
    required this.topTextsecond,
    required this.isFirst,
  });

  final String topTextfirst;
  final String topTextsecond;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    final TextConstants textConstants = TextConstants();
    // final customColors = Theme.of(context).extension<CustomColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          topTextfirst,
          style: textTheme.headlineSmall,
        ),
        isFirst
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textConstants.kPage1TopTextSecond,
                    style: textTheme.titleLarge,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: textConstants.kPage1TopTextSecondFirstHalf,
                          style: textTheme.titleLarge!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: textConstants.kPage1TopTextSecondSecondHalf,
                          style: textTheme.titleLarge!.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Text(
                topTextsecond,
                style: textTheme.titleLarge!.copyWith(
                  color: const Color(0xFF2FA270),
                ),
              ),
      ],
    );
  }
}
