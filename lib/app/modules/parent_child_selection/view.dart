
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/modules/Auth/login/view.dart';
import 'package:school/app/modules/home/student/home_view.dart';
import 'package:school/app/widgets/handling_data_view.dart';
import '../../core/constants/border_radius.dart';
import 'controller.dart';

class ChildSelectionScreen extends StatelessWidget {
  ChildSelectionScreen({Key? key}) : super(key: key);
  ChildSelectionController childSelectionController = Get.put(ChildSelectionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<ChildSelectionController>(
        builder: (childSelectionController)=> HandlingDataView(
          statusRequest: childSelectionController.statusRequest.value,
            widget: Stack(
                children:[
                  Align(
                      alignment: Alignment.bottomCenter,
                      //Get.height - 140,
                      child: Image.asset("assets/images/img.png",
                        height: 180,width: double.infinity,fit: BoxFit.fill,)),
                  SafeArea(
                    child: Center(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text("chooseChild".tr,style: TextStyle(fontSize: 14.0.sp),)),
                          SizedBox(height: 15,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: mainPadding),
                            child: childSelectionController.data.length==0
                                ?SizedBox(width:200,
                                child: Center(child: NoSonWidget()))
                            :childSelectionController.data.length==1?
                            Center(
                              child: SizedBox(
                                width: 150,
                                height: 170,
                                child: ChildCard(name: childSelectionController.data[0].firstName!,
                                    image: childSelectionController.data[0].profileImage!,
                                    onTap: (){
                                      childSelectionController.saveId(0);
                                      Get.offAll(()=>HomeScreen());
                                    }),
                              ),
                            )
                            :GridView.builder(
                                physics: ScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 2.0.hp),
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300.0,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 12.0,
                                  childAspectRatio: 0.9,
                                ),
                                shrinkWrap: true,
                                itemCount: childSelectionController.data.length,
                                itemBuilder: (BuildContext context,int index){
                                  return ChildCard(name: childSelectionController.data[index].firstName!,
                                      image: childSelectionController.data[index].profileImage!,
                                      onTap: (){
                                        childSelectionController.saveId(index);
                                        Get.offAll(()=>HomeScreen());
                                      });
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ]
            ),),
      )
    );
  }
}

class NoSonWidget extends StatelessWidget {
  const NoSonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: "${'noSons'.tr}\n",
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: 'backToLoginPage'.tr,
                  style: const TextStyle(decoration: TextDecoration.underline, ),
                recognizer: TapGestureRecognizer()..onTap = () => Get.offAll(LoginScreen()),

              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChildCard extends StatelessWidget {
  final String name;
  final String image;
  final Function() onTap;
  const ChildCard({Key? key, required this.name,
    required this.image,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardsRadius), //<-- SEE HERE
      ),
     child: InkWell(
       borderRadius: BorderRadius.circular(cardsRadius),
       onTap: (){
         onTap();
       },
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CircleAvatar(backgroundColor:Color(0xFFF8F8F8),
           radius: 40,child: Image.network(image),),
           SizedBox(height: 2.0.hp),
           Text(name,style: TextStyle(
             fontSize: 12.0.sp,
             color: Colors.black
           ),),
         ],
       ),
     ),
    );
  }
}

