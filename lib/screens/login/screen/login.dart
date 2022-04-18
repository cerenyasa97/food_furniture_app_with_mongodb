import 'package:flutter/material.dart';
import 'package:food_furniture_app/core/base/base_view.dart';
import 'package:food_furniture_app/core/widgets/button/custom_button.dart';
import 'package:food_furniture_app/core/widgets/text_form_field/transparent_text_form_field.dart';
import 'package:food_furniture_app/flavor_config.dart';
import 'package:food_furniture_app/screens/login/view_model/login_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends BaseView<LoginViewModel> {
  const Login({Key? key}) : super(key: key);

  @override
  LoginViewModel get viewModel => LoginViewModel();

  @override
  Widget? body(BuildContext context, LoginViewModel viewModel) =>
      Consumer<FlavorConfig>(
        builder: (context, config, _) => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(config.appConstants!.loginImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment:
                      config.applicationType == Application.furniture
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                  children: [
                    Text(
                      config.appTitle,
                      style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Form(
                        key: viewModel.loginFormKey,
                        child: Column(
                          children: [
                            TransparentTextFormField(
                              textFieldBackgroundColor: config
                                  .appConstants?.loginTextFieldBackgroundColor,
                              textFieldTextColor:
                                  config.appConstants?.loginTextFieldTextColor,
                              label: 'E-mail',
                              onSaved: (text) => viewModel.email = text,
                              validator: (email) {
                                if(email != null && (viewModel.emailValidation(email) ?? false)) return null;
                                else return "Please enter a valid email address";
                              },
                            ),
                            const SizedBox(height: 24),
                            TransparentTextFormField(
                              textFieldBackgroundColor: config
                                  .appConstants?.loginTextFieldBackgroundColor,
                              textFieldTextColor:
                                  config.appConstants?.loginTextFieldTextColor,
                              label: 'Password',
                              obscure: true,
                              onSaved: (text) => viewModel.password = text,
                              validator: (password) {
                                if(password != null && (viewModel.passwordValidation(password) ?? false)) return null;
                                else return "Please enter a valid password";
                              },
                            ),
                            const SizedBox(height: 24),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CustomButton(
                                text: 'Log In',
                                onPressed: viewModel.login,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Forgot password?',
                                    style: GoogleFonts.quicksand(
                                      color: config.applicationType !=
                                              Application.food
                                          ? Color(0xFF3A4F4F)
                                          : Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
