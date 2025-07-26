import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_bloc/viewmodels/mytheme_view_model.dart';
import 'package:provider/provider.dart';

class SelectCityWidget extends StatefulWidget {
  const SelectCityWidget({super.key});

  @override
  State<SelectCityWidget> createState() => _SelectCityWidgetStateState();
}

class _SelectCityWidgetStateState extends State<SelectCityWidget> {

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeViewModel>(
      builder: (context, myThemeViewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Select City'),
          backgroundColor: myThemeViewModel.myTheme.theme.primaryColor,
        ),
        body: Form(child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'City Name',
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context, _textController.text);
                _textController.clear();
              },
            ),
          ],
        )),
      ),
    );
  }
}