import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Helpers
import '../../../helper/utils/form_validator.dart';

//Providers
import '../../../providers/all_providers.dart';

//Widgets
import '../common/custom_textfield.dart';

class ChangePasswordFields extends ConsumerWidget {
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController cNewPasswordController;

  const ChangePasswordFields({
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.cNewPasswordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProv = ref.watch(authProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Current Password Field
        CustomTextField(
          hintText: 'Nhập mật khẩu cũ',
          floatingText: 'Mật khẩu cũ',
          controller: currentPasswordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          validator: (inputPw) => FormValidator.currentPasswordValidator(
            inputPw,
            authProv.currentUserPassword,
          ),
        ),

        const SizedBox(height: 25),

        //New Password Field
        CustomTextField(
          hintText: 'Nhập mật khẩu của bạn',
          floatingText: 'Mật khẩu mới',
          controller: newPasswordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          validator: (newPw) => FormValidator.newPasswordValidator(
            newPw,
            authProv.currentUserPassword,
          ),
        ),

        const SizedBox(height: 25),

        //Confirm New Password Field
        CustomTextField(
          hintText: 'Nhập lại mật khẩu',
          floatingText: 'Mật khẩu mới',
          controller: cNewPasswordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          validator: (confirmPw) => FormValidator.confirmPasswordValidator(
            confirmPw,
            newPasswordController.text,
          ),
        ),
      ],
    );
  }
}
