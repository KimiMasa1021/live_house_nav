import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:live_house_nav/common/go_router_provider/routes/routes.dart';
import 'package:live_house_nav/presentation/notifier/auth/sign_up_notifier.dart';
import 'package:live_house_nav/presentation/pages/auth/widgets/input_text_field.dart';

import '../../../../common/unit/form_validation.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final email = useState("");
    final password = useState("");
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputTextField(
                title: "メールアドレス",
                hintText: "example@gmail.com",
                formValidation: (val) => FormValidation.emailValidation(val),
                keyboardType: TextInputType.emailAddress,
                setValue: email,
              ),
              InputTextField(
                title: "パスワード",
                hintText: "8桁以上の半角英数字",
                formValidation: (val) => FormValidation.passwordValidation(val),
                keyboardType: TextInputType.visiblePassword,
                setValue: password,
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  await authNotifier.signIn(
                    email.value,
                    password.value,
                    () => context.pop(),
                  );
                },
                child: const Text("ログイン"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
