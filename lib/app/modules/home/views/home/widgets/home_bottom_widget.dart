import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/common-widgets/custom_button.dart';
import 'package:zetaton/app/modules/home/provider/home_provider.dart';
import 'package:zetaton/app/resources/app_color.dart';

class HomeBottomWidget extends StatelessWidget {
  const HomeBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return Stack(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primaryColor.withOpacity(0.9)),
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(4),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    provider.isFirstPage == false
                        ? CustomButton(
                            title: "Previous",
                            onTap: () {
                              provider.findPrevious();
                            })
                        : const SizedBox.shrink(),
                    provider.isLastPage == false
                        ? CustomButton(
                            title: "Next",
                            onTap: () {
                              provider.findNext();
                            })
                        : const SizedBox.shrink(),
                  ]),
            ),
            if (provider.wallpaperResponse != null)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${provider.wallpaperResponse!.page * provider.wallpapers.length} / ${provider.wallpaperResponse!.totalResults}",
                    style: const TextStyle(
                        color: AppColor.lightColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
