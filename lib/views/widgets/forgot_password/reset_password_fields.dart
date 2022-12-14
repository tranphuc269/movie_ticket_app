import 'package:flutter/material.dart';

//Helper
import '../../../helper/utils/form_validator.dart';

//Widget
import '../common/custom_textfield.dart';

class ResetPasswordFields extends StatelessWidget {
  final TextEditingController newPasswordController;
  final TextEditingController cNewPasswordController;

  const ResetPasswordFields({
    Key? key,
    required this.newPasswordController,
    required this.cNewPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //New Password Field
        CustomTextField(
          hintText: 'Nhập mật khẩu của bạn',
          floatingText: 'New Password',
          controller: newPasswordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          validator: FormValidator.passwordValidator,
        ),

        const SizedBox(height: 25),

        //Confirm New Password Field
        CustomTextField(
          hintText: 'Nhập lại mật khẩu của bạn',
          floatingText: 'Xác nhận mật khẩu',
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
