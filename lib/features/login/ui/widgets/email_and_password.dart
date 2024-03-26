import 'package:advanced_project/core/helpers/app_regex.dart';
import 'package:advanced_project/core/helpers/spacing.dart';
import 'package:advanced_project/core/widgets/app_text_form_fields.dart';
import 'package:advanced_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_project/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {

  
  
   bool isObscureText = true;
   

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;


   late TextEditingController passwordController;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController=context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

    void setupPasswordControllerListener() {
      passwordController.addListener(() {
        setState(() {
           hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        });
      });
    }


    @override
  void dispose() {
    
    super.dispose();

    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
            AppTextFormField(
              controller: context.read<LoginCubit>().emailController,
              hintText: "Email",validator: (value) {
              if(value==null || value.isEmpty || !AppRegex.isEmailValid(value)){
                return "please enter a valid email";
              }
            },
            ),
              
                verticalSpace(18),
              
                 AppTextFormField(
                  controller: context.read<LoginCubit>().passwordController,
                      hintText: 'Password',
                      isObscureText: isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });

                        },
                        child: Icon(
                          isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                     validator: (value) {
              if(value==null || value.isEmpty){
                return "please enter a valid password";
              }
            },
                    ),

                         verticalSpace(24),
            PasswordValidations(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),


        ],
      ),
    );
  }
  

}