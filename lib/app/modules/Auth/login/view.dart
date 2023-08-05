
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/Auth/login/controller.dart';
import 'package:school/app/modules/Auth/widgets/authTitle.dart';
import 'package:school/app/modules/Auth/widgets/bottom_widget.dart';
import '../../../core/constants/border_radius.dart';
import '../../../widgets/handling_data_view_request.dart';
import '../controller.dart';
import '../widgets/phone_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: GetX<LoginController>(
        builder: (LoginController){
          return HandlingDataViewRequest(statusRequest: loginController.statusRequest.value,
              widget: Stack(
                children: [
                  ListView(
                    children: [
                      SafeArea(
                        child: Align(alignment:Alignment.topCenter,
                            child: AuthTitle(title: "logIn".tr,)
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(mainPadding),
                        child: Column(
                          children: [
                            Form(
                                key:loginController.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PhoneField(
                                      controller:loginController.phoneController,
                                      validator: (String? value){
                                        if(value == null || value.isEmpty){
                                          return "This field is required";
                                        }
                                        return null;
                                      },),
                                    SizedBox(height: 3.0.hp,),
                                    Text("password".tr,style: TextStyle(
                                      fontSize: 12.0.sp,
                                    ),),
                                    const SizedBox(height: 17.0,),
                                    TextFormField(
                                      controller: loginController.passwordController,
                                      style:TextStyle(fontSize: 19) ,
                                      validator: (String? value){
                                        if(value == null || value.isEmpty){
                                          return "This field is required";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      obscureText: loginController.obscure.value,
                                      decoration: InputDecoration(
                                        hintText: "✶✶✶✶✶✶✶✶✶✶✶✶✶",
                                        hintStyle: TextStyle(color: Color(0XFF1A1B23).withOpacity(.4)),
                                        //hintStyle: TextStyle(fontSize: 30.0),
                                        border:  OutlineInputBorder(
                                          borderRadius:  BorderRadius.circular(textFieldRadius),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xEEEEEEEE),
                                          ),
                                        ),
                                        suffixIcon: InkWell(
                                            onTap: (){
                                              loginController.changeObscure();
                                            },
                                            child: loginController.obscure.value?
                                            const Icon(Icons.visibility_off_outlined)
                                            :const Icon(Icons.visibility_outlined)),

                                      ),
                                    ),
                                  ],)
                            ),
                            //Forget Password
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.all(3.0.wp),
                            //       child: InkWell(
                            //         onTap: (){
                            //           Get.to(()=>ForgetPasswordScreen());
                            //         },
                            //         child: Text("forgetPassword".tr,style: TextStyle(
                            //           color: Color(0xFF292D32).withOpacity(.3),
                            //           fontSize: 11.0.sp,
                            //           fontWeight: FontWeight.w700,
                            //         ),),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      //Flexible(child: Container(height: 200,)),
                    ],
                  ),
                  Align(alignment: Alignment.bottomCenter,
                    child:
                    BottomWidget(
                      text: "logIn".tr,onPressed: (){
                      loginController.login();
                      FocusScope.of(context).unfocus();
                    },),)
                ],
              ),
          );
        }
      ),
    );
  }
}

