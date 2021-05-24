import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:yammi/application/bloc/sign_in/sign_in_bloc.dart';
import 'package:yammi/core/errors/auth_failure.dart';
import 'package:yammi/injection.dart';
import 'package:yammi/presentation/resources/colors.dart';
import 'package:yammi/presentation/routes/router.gr.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInBloc _bloc = getIt<SignInBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'AE');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SignInBloc, SignInState>(
        bloc: _bloc,
        listener: (context, state) async {
          if (state is Loading) {
            await EasyLoading.show(
              maskType: EasyLoadingMaskType.black,
            );
          } else if (state is FailedSignIn) {
            await EasyLoading.dismiss();

            final AuthFailure authFailure = state.authFailure;
            String errorMessage = 'Something went wrong';

            if (authFailure is PhoneNumberNotCorrectError) {
              errorMessage = 'Phone number is not correct';
            }

            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(errorMessage))
            );
          } else if (state is SuccessLogin) {
            await EasyLoading.dismiss();

            AutoRouter.of(context).push(ConfirmPhonePageRoute(phoneNumber: state.phoneNumber));
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset('assets/images/logo.png', width: 200, height: 200,)),
                  const SizedBox(height: 16),
                  Text('Please enter your phone number to login', style: Theme.of(context).textTheme.subtitle1,),
                  const SizedBox(height: 64,),
                  InternationalPhoneNumberInput(
                    initialValue: _phoneNumber,
                    onInputChanged: (PhoneNumber number) => _phoneNumber = number,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'This feild is required';
                      }

                      return null;
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    inputDecoration: InputDecoration(
                      border: Theme.of(context).inputDecorationTheme.border,
                    ),
                  ),
                  const SizedBox(height: 32,),
                  Center(
                    child: SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (!_formKey.currentState!.validate()) return;

                          _bloc.add(LoginEvent(_phoneNumber.phoneNumber!));
                        }, 
                        child: const Text('Login', style: TextStyle(color: Colors.white),)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}