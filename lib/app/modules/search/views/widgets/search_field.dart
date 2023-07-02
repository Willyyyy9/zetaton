import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/common-widgets/custom_icon_button.dart';
import 'package:zetaton/app/common-widgets/custom_text_field.dart';
import 'package:zetaton/app/modules/search/provider/search_provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, _) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: CustomTextField(
                  hint: "Search", controller: provider.searchController),
            ),
            Positioned(
                top: 2,
                right: 4,
                child: CustomIconButton(
                  icon: FontAwesomeIcons.magnifyingGlass,
                  onTap: () {
                    provider.searchFirst();
                  },
                ))
          ],
        );
      },
    );
  }
}
