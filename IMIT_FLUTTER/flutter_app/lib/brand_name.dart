import 'package:flutter/material.dart';
import 'package:flutter_app/second_page.dart';

class BrandName extends StatefulWidget {
  const BrandName({Key? key}) : super(key: key);

  @override
  _BrandNameState createState() => _BrandNameState();
}

class _BrandNameState extends State<BrandName> {
  int currentStep = 0;
  bool isCompleted = false;
  late String buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Moms Kitchen",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Text(
                "You are done with 75% of the registration. Finish the rest"),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Theme(
                  data: ThemeData(
                      accentColor: Colors.orange,
                      primarySwatch: Colors.green,
                      colorScheme: ColorScheme.light(primary: Colors.green)),
                  child: Stepper(
                    type: StepperType.vertical,
                    currentStep: currentStep,
                    steps: getSteps(),
                    onStepCancel: () {
                      currentStep == 0
                          ? null
                          : () => setState(() => currentStep -= 1);
                    },
                    onStepTapped: (step) => setState(() => currentStep = step),

                    controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                      return SizedBox();
                    },

                    // onStepContinue: () {
                    //   final isLastStep = currentStep == getSteps().length - 1;

                    //   if (isLastStep) {
                    //     setState(() {
                    //       isCompleted = true;
                    //     });
                    //   } else {
                    //     setState(() => currentStep += 1);
                    //   }
                    // },

                    // controlsBuilder: (context, {onStepContinue, onStepCancel}) {

                    //   final isLastStep =
                    //               currentStep == getSteps().length - 1;

                    //           if (isLastStep) {
                    //             setState(() {
                    //               isCompleted = true;
                    //             });
                    //           } else {
                    //             setState(() => currentStep += 1);
                    //           }
                    // return Row(
                    //   children: [
                    //     ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           primary: Color(0xFFFFFFFF)),
                    //       onPressed: () {
                    //         final isLastStep =
                    //             currentStep == getSteps().length - 1;

                    //         if (isLastStep) {
                    //           setState(() {
                    //             isCompleted = true;
                    //           });
                    //         } else {
                    //           setState(() => currentStep += 1);
                    //         }

                    //         if (currentStep == getSteps().length - 1) {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => ThirdPage()));
                    //         } else if (currentStep >= 1) {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => SecondPage()));
                    //         } else {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => FirstPage()));
                    //         }
                    //       },
                    //       child: Text(
                    //         currentStep >= 1
                    //             ? "Add your product"
                    //             : "create store",
                    //         style: TextStyle(color: Colors.black),
                    //       ),
                    //     ),
                    //   ],
                    // );
                    // },
                  ),
                ),
              ),
            )
          ],
        ));
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: const Text(
              'Online Store is Created',
            ),
            subtitle: const Text(
                "You successfully created an account in MUMS kitchen"),
            content: Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstPage()));
                },
                child:
                    Text("create store", style: TextStyle(color: Colors.black)),
              ),
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Add Your Product'),
            subtitle: const Text(
                "Add your first product by adding the product name and picture"),
            content: Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text("add your product",
                    style: TextStyle(color: Colors.black)),
              ),
            )),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Share Your Brand',
              style: TextStyle(color: Colors.black)),
          subtitle:
              const Text("Share your brand to your friends via social media"),
          content: Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdPage()));
              },
              child: Text("share your brand",
                  style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ];
}


                              // final isLastStep =
                              //     currentStep == getSteps().length - 1;

                              // if (isLastStep) {
                              //   setState(() {
                              //     isCompleted = true;
                              //   });
                              // } else {
                              //   setState(() => currentStep += 1);
                              // }