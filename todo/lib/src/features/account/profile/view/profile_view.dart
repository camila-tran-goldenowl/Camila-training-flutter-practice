import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/button/text_button.dart';
import 'package:myapp/widgets/forms/input.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});


  // Widget _form(BuildContext context, SignupState state) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       const SizedBox(height: 24.0),
  //       XInput(
  //         key: const Key('loginForm_NameInput_textField'),
  //         value: state.name.value,
  //         onChanged: context.read<SignupBloc>().onNameChanged,
  //         keyboardType: TextInputType.name,
  //         decoration: InputDecoration(
  //           labelText: 'Username',
  //           hintText: 'Username',
  //           errorText: state.name.errorOf(context),
  //         ),
  //       ),
  //       const SizedBox(height: 8.0),
  //       XInput(
  //         key: const Key('loginForm_emailInput_textField'),
  //         value: state.email.value,
  //         onChanged: context.read<SignupBloc>().onEmailChanged,
  //         keyboardType: TextInputType.emailAddress,
  //         decoration: InputDecoration(
  //           labelText: 'Email',
  //           hintText: 'Email',
  //           errorText: state.email.errorOf(context),
  //         ),
  //       ),
  //       const SizedBox(height: 8.0),
  //       XInput(
  //         value: state.password.value,
  //         key: const Key('loginForm_passwordInput_textField'),
  //         onChanged: context.read<SignupBloc>().onPasswordChanged,
  //         obscureText: true,
  //         decoration: InputDecoration(
  //           hintText: 'Password',
  //           errorText: state.password.errorOf(context),
  //         ),
  //       ),
  //       const SizedBox(height: 8.0),
  //       XButton(
  //         busy: state.status.isInProgress,
  //         enabled: state.isValidated,
  //         title: S.of(context).common_next,
  //         onPressed: () => context.read<SignupBloc>().signupWithEmail(context),
  //       ),
  //       const SizedBox(height: 16.0),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // _form(),
            const SizedBox(height: 46),
            XTextButton(
                buttonStyle: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 36),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(0,
                        0), // Minimum size to allow the button to size itself vertically
                  ),
                ),
                title: "Logout",
                onPressed: () async {
                  final result =
                      await context.read<AccountBloc>().onLogOut(context);
                  if (result == true) {
                    AppCoordinator.pop();
                  }
                })
          ],
        ),
      ),
    );
  }
}
