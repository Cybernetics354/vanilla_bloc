import 'package:flutter/material.dart';
import 'package:vanilla_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:vanilla_bloc/bloc/counter_bloc/counter_event.dart';

class HomeMainView extends StatefulWidget {
  @override
  _HomeMainViewState createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  // Contruct CounterBloc nya
  final CounterBloc _counterBloc = new CounterBloc();

  // Buat TextControllernya
  final TextEditingController _countController = new TextEditingController();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vanilla Bloc"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gunakan StreamBuilder buat ngelisten stream
            StreamBuilder<int>(
              stream: _counterBloc.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                // Usahakan cegah kemungkinan terburuknya dengan mengecek ConnectionStatenya terlebih dahulu
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Text(snapshot.data.toString(), style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),);
                }
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60.0,
              child: TextFormField(
                controller: _countController,
                decoration: InputDecoration(
                  labelText: "Masukkan Nilainya"
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    // Masukkan DecrementEvent di eventListen
                    if(_countController.text == "" || _countController.text == null) {
                      _counterBloc.eventListen.add(DecrementEvent());
                    } else {
                      _counterBloc.eventListen.add(DecrementEvent(
                        count: int.parse(_countController.text)
                      ));
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Masukkan IncrementEvent di eventListen
                    if(_countController.text == "" || _countController.text == null) {
                      _counterBloc.eventListen.add(IncrementEvent());
                    } else {
                      _counterBloc.eventListen.add(IncrementEvent(
                        count: int.parse(_countController.text)
                      ));
                    }
                  },
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}