import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/styles.dart';
import '../utils/utils.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Get.isDarkMode
            ? Border.all(width: 1, color: Colors.white24)
            : Border.all(width: 1, color: Colors.transparent),
        color: Colors.black12.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: TextField(
          keyboardType: TextInputType.text,
          controller: searchController,
          decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
              border: Style.inputBorder(),
              suffixIcon: IconButton(
                icon: Get.isDarkMode
                    ? SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: Colors.white.withOpacity(0.6),
                      )
                    : SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: Colors.black.withOpacity(0.6),
                      ),
                onPressed: () {},
              ),
              hintText: Utils.searchBarText,
              hintStyle: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: Utils.smallTextSize,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              )),
        ),
      ),
    );
  }
}
