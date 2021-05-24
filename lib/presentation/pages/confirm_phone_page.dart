import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yammi/application/bloc/confirm_phone/confirm_phone_bloc.dart';
import 'package:yammi/core/errors/auth_failure.dart';
import 'package:yammi/injection.dart';
import 'package:yammi/presentation/resources/colors.dart';
import 'package:yammi/presentation/resources/dimensions.dart';
import 'package:yammi/presentation/routes/router.gr.dart';

class ConfirmPhonePage extends StatefulWidget {
  final String _phoneNumber;

  const ConfirmPhonePage(this._phoneNumber, {Key? key}) : super(key: key);

  @override
  _ConfirmPhonePageState createState() => _ConfirmPhonePageState();
}

class _ConfirmPhonePageState extends State<ConfirmPhonePage> {
  final ConfirmPhoneBloc _bloc = getIt<ConfirmPhoneBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _pin;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<ConfirmPhoneBloc, ConfirmPhoneState>(
        bloc: _bloc,
        listener: (context, state) async {
          if (state is Loading) {
            await EasyLoading.show(
              maskType: EasyLoadingMaskType.black,
            );
          } else if (state is FailedConfirmation) {
            await EasyLoading.dismiss();

            final AuthFailure authFailure = state.authFailure;
            String errorMessage = 'Something went wrong';

            if (authFailure is VerificationCodeNotCorrectError) {
              errorMessage = 'Verification code is not correct';
            }

            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(errorMessage))
            );
          } else if (state is SuccessConfirmation) {
            await EasyLoading.dismiss();

            AutoRouter.of(context).pushAndPopUntil(const RestaurantsPageRoute(), predicate: (Route<dynamic> route) => false);
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
                  Text('Enter the code sent to your phone number. ${widget._phoneNumber}', style: Theme.of(context).textTheme.subtitle1,),
                  const SizedBox(height: 64,),
                  PinCodeTextField(
                    appContext: context, 
                    length: 4, 
                    onChanged: (String value) => _pin = value,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'This feild is required';
                      }

                      if (text.length < 4) {
                        return 'Enter the full code';
                      }

                      return null;
                    },
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        activeColor: primaryColor,
                        inactiveColor: primaryColor,
                        selectedColor: primaryColor,
                        borderRadius: BorderRadius.circular(roundRadius),
                        fieldHeight: 50,
                        fieldWidth: 40,
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

                          _bloc.add(ConfirmationEvent(widget._phoneNumber, _pin));
                        }, 
                        child: const Text('Confirm', style: TextStyle(color: Colors.white),)),
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