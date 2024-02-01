import 'package:flutter/material.dart';
import 'package:grocery/themes/app_theme.dart';

class SearchHomeWidget extends StatefulWidget {
  const SearchHomeWidget({super.key});

  @override
  State<SearchHomeWidget> createState() => _SearchHomeWidgetState();
}

class _SearchHomeWidgetState extends State<SearchHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: AppTheme.lightPrimaryColor,
      alignment: Alignment.center,
      child: _searchInputText(),
    );
  }

  Widget _searchInputText() {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
      child: SizedBox(
        height: 35,
        child: TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}
