import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sartarosh/screens/auth/widgets/global_passwordfield.dart';
import 'package:sartarosh/screens/auth/widgets/global_textbutton.dart';
import 'package:sartarosh/screens/routes.dart';
import 'package:sartarosh/screens/tap_box_screen/tab_box_screen.dart';
import 'package:sartarosh/utils/app_constants_RegExp/app_constants_RegExp.dart';
import 'package:sartarosh/utils/colors/app_colors.dart';
import 'package:sartarosh/utils/extensions/size.dart';
import 'package:sartarosh/utils/formaters/formatters.dart';
import 'package:sartarosh/utils/images/app_images.dart';
import 'package:sartarosh/utils/styles/app_text_style.dart';

import '../widgets/global_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKeyTwo = GlobalKey<FormState>();
  final _formKeyThree = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body:
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 102.h, left: 29.w, right: 29.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "welcome_back".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 30),
                  ),
                ),
                SizedBox(height: 11.h),
                Center(
                  child: Text(
                    "login_to_use_app".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 12),
                  ),
                ),
                SizedBox(height: 64.h),
                Text(
                  "phone".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12),
                ),
                SizedBox(height: 10.h),
                GlobalTextField(
                  onChanged: (v) {
                    if (v?.length == 17) {
                      FocusManager.instance.primaryFocus!.nextFocus();
                    }
                  },
                  type: TextInputType.phone,
                  inputFormatter: [AppInputFormatters.phoneFormatter],
                  title: '+998',
                  icon: const Icon(Icons.phone),
                  controller: phoneController,
                  validate: RegExp(''),
                  validateText: 'Invalid phone',
                  validateEmptyText: 'Enter phone number',
                  formKey: _formKeyTwo,
                ),
                SizedBox(height: 14.h),
                Text(
                  "password".tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12),
                ),
                SizedBox(height: 10.h),
                GlobalPasswordField(
                  title: '* * * * * *',
                  icon: const Icon(Icons.lock),
                  controller: passwordController,
                  validate: AppConstants.passwordRegExp,
                  formKey: _formKeyThree,
                ),
                SizedBox(height: 20.h),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: GlobalTextButton(
                    // isLoading: state.status == FormsStatus.loading,
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return const TabBox1();
                      }));
                    },
                    text: "login".tr(),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.cD6CDFE,
                      ),
                      onPressed: () {
                        // context
                        //     .read<AuthBloc>()
                        //     .add(SignInWithGoogleEvent());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.google, height: 20.h),
                          SizedBox(width: 10.w),
                          Text(
                            "sign_up_google".tr(),
                            style: AppTextStyle.sansBold.copyWith(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don_not_have_an_account".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, RouteNames.signup);
                      },
                      child: Text(
                        'register'.tr(),
                        style: AppTextStyle.sansRegular.copyWith(
                            fontSize: 12, color: AppColors.cFF9228),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
