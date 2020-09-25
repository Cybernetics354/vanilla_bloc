import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vanilla_bloc/getx/counter_controller.dart';

class GetTestingMainView extends StatefulWidget {
  @override
  _GetTestingMainViewState createState() => _GetTestingMainViewState();
}

class _GetTestingMainViewState extends State<GetTestingMainView> {
  final CounterController _counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_before),
        onPressed: () {
          Get.to(GetSecondScreen());
        }
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text("${_counterController.count.value.count}")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      _counterController.decrement();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _counterController.increment();
                    },
                  )
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetSecondScreen extends StatelessWidget {
  final CounterController _counterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen")
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _counterController.increment();
        }
      ),
      body: Container(
        child: Center(
          child: Obx(() => Text("${_counterController.count.value.count}"))
        )
      )
    );
  }
}