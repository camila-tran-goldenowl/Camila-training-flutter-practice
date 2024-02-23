import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/features/authentication/logic/signup_bloc.dart';
import 'package:myapp/src/features/authentication/widget/sign_title.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/common/indicator.dart';
import 'package:myapp/widgets/forms/input.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, SignupState state) {
          return Scaffold(
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: _builder(context, state),
            ),
          );
        },
      ),
    );
  }

  Widget _builder(BuildContext context, SignupState state) {
    return Container(
      color: Colors.blue, // Set the background color here
      child: Padding(
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/images/bg.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Center(child: _overlay(context, state)),
            )
          ],
        ),
      ),
    );
  }

  Widget _overlay(BuildContext context, SignupState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SignTitle('Signup'),
        const SizedBox(height: 24.0),
        // Container(
        //   decoration: const BoxDecoration(
        //     shape: BoxShape.circle,
        //   ),
        //   child: ClipOval(
        //     child: SvgPicture.asset(
        //         Assets.svgs.avatar,
        //         fit: BoxFit.cover,
        //         // width: 110,
        //         // height: 110
        //     ),
        //   ),
        // ),
        XInput(
          key: const Key('loginForm_NameInput_textField'),
          value: state.name.value,
          onChanged: context.read<SignupBloc>().onNameChanged,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Username',
            errorText: state.name.errorOf(context),
          ),
        ),
        const SizedBox(height: 8.0),
        XInput(
          key: const Key('loginForm_emailInput_textField'),
          value: state.email.value,
          onChanged: context.read<SignupBloc>().onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Email',
            errorText: state.email.errorOf(context),
          ),
        ),
        const SizedBox(height: 8.0),
        XInput(
          value: state.password.value,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: context.read<SignupBloc>().onPasswordChanged,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: state.password.errorOf(context),
          ),
        ),
        const SizedBox(height: 24.0),
        XButton(
          busy: state.status.isInProgress,
          enabled: state.isValidated,
          title: S.of(context).common_next,
          onPressed: () => context.read<SignupBloc>().signupWithEmail(context),
        ),
        const SizedBox(height: 8.0),
        _buildButton(
          icon: Assets.svgs.icGoogle,
          title: S.of(context).sign_signin_signinWithGoogle,
          busy: false,
          onPressed: () => {},
        ),
      ],
    );
  }

  Widget _buildButton({
    required String icon,
    required String title,
    required VoidCallback onPressed,
    bool busy = false,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        child: AnimatedCrossFade(
          crossFadeState:
              busy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 300),
          firstChild: const XIndicator(radius: 11),
          secondChild: SvgPicture.asset(icon),
        ),
      ),
      label: Text(' $title'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF313131),
        fixedSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF313131),
          letterSpacing: 0.24,
        ),
      ),
    );
  }
}
