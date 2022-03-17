import 'package:fitstat_app/screens/authenticate/cubit/auth_cubit.dart';
import 'package:fitstat_app/screens/home/HomeScreen.dart';
import 'package:fitstat_app/shared/Widgets/custom_button.dart';
import 'package:fitstat_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => Focus.of(context).unfocus(),
        child: Scaffold(
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
              if (state is AuthLoginSuccess) {
                formKey.currentState!.reset();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              }
            },
            builder: (context, state) => _buildLoginScreen(),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginScreen() {
    return SafeArea(
      child: FormBuilder(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height: 180, width: 180),
                const SizedBox(height: 20),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FormBuilderTextField(
                    textInputAction: TextInputAction.next,
                    name: "email",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.email(context,
                          errorText: "Podj poprawny adres Email")
                    ]),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Podaj Email",
                        hintStyle: kHintStyle,
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: kOutlinedBorder,
                        focusedBorder: kOutlinedBorder,
                        errorBorder: kOutlinedErrorBorder,
                        focusedErrorBorder: kOutlinedBorder),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FormBuilderTextField(
                    textInputAction: TextInputAction.next,
                    name: "hasło",
                    obscureText: isObscure,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        prefixIcon: const Icon(Icons.login),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure
                                ? Icons.radio_button_off
                                : Icons.radio_button_checked,
                          ),
                        ),
                        hintText: "Podaj hasło",
                        hintStyle: kHintStyle,
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: kOutlinedBorder,
                        focusedBorder: kOutlinedBorder,
                        errorBorder: kOutlinedErrorBorder,
                        focusedErrorBorder: kOutlinedBorder),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                LoginButton(onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final authCubit = BlocProvider.of<AuthCubit>(context);
                    authCubit.login(
                        formKey.currentState!.fields['email']!.value,
                        formKey.currentState!.fields['password']!.value);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Czy zakończyć aplikacje"),
            content: const Text('Czy napewno ?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    'Tak',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Nie',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        )) ??
        false;
  }
}

class LoginButton extends StatelessWidget {
  final Function onPressed;
  const LoginButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Dupka");
    // return CustomButton(
    //   onPressed: (onPressed),
    //   child: BlocConsumer<AuthCubit, AuthState>(
    //       listener: (context, state) {},
    //       builder: (context, state) {
    //         if (state is AuthLoginLoading) {
    //           return kLoaderBtn;
    //         } else {
    //           return const Text("Login");
    //         }
    //       }),
    // );
  }
}
