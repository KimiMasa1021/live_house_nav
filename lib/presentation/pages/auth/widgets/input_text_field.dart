import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/text_theme/text_theme.dart';

class InputTextField extends ConsumerWidget {
  const InputTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.formValidation,
    required this.keyboardType,
    required this.setValue,
  });
  final String title;
  final String hintText;
  final Function(String? val) formValidation;
  final TextInputType keyboardType;
  final ValueNotifier<String> setValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(myTextThemeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.fs15.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          TextFormField(
            validator: (val) => formValidation(val),
            onSaved: (newValue) => setValue.value = newValue ?? "",
            keyboardType: keyboardType,
            obscureText: keyboardType == TextInputType.visiblePassword,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorStyle: textTheme.fs16.copyWith(color: Colors.white),
            ),
            autofocus: true,
          ),
        ],
      ),
    );
  }
}
