import 'package:flutter/material.dart';

class SteperWidget extends StatefulWidget {
  const SteperWidget({Key? key}) : super(key: key);

  @override
  _SteperWidgetState createState() => _SteperWidgetState();
}

class _SteperWidgetState extends State<SteperWidget> {
  int currentStep = 1;
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
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              child: Theme(
                data: ThemeData(
                    accentColor: Colors.orange,
                    primarySwatch: Colors.green,
                    colorScheme:
                        const ColorScheme.light(primary: Colors.green)),
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
                  controlsBuilder: (BuildContext context,
                      {VoidCallback? onStepContinue,
                      VoidCallback? onStepCancel}) {
                    return Row(
                      children: const <Widget>[SizedBox()],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
            content: const Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: Text(
                  "successfully created yor online store",
                  style: TextStyle(color: Colors.green),
                ))),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text('Add Your Product'),
            subtitle: const Text(
                "Add your first product by adding the product name and picture"),
            content: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
                onPressed: () {
                  onStepContinue();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: const Text("add your product",
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
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdPage()));
              },
              child: const Text("share your brand",
                  style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ];

  void onStepContinue() {
    final isLastStep = currentStep == getSteps().length - 1;

    if (isLastStep) {
      setState(() {
        isCompleted = true;
      });
    } else {
      setState(() => currentStep += 1);
    }
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Next", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Next", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("THIRD PAGE"),
      ),
    );
  }
}
