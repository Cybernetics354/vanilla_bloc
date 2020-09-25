import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:vanilla_bloc/bloc/cubit/counter_cubit.dart';
import 'package:vanilla_bloc/views/get_view.dart';
import 'package:vanilla_bloc/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Vanilla bloc",
      // home: BlocProvider(
      //   create: (context) => CounterCubit(),
      //   child: HomeMainView(),
      // )
      home: GetTestingMainView()
    );
  }
}