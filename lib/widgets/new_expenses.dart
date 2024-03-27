import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  NewExpenses({super.key});
  @override
  State<NewExpenses> createState() {
    return _NewExpenses();
  }
}

class _NewExpenses extends State<NewExpenses> {

  // var _enteredTitle = '';

  // void saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  var _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
           TextField(
            // onChanged: saveTitleInput, Следит за обновлением формы
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {
                print(_titleController.text);
              }, child: Text("Save Title")),
            ],
          )
        ],
      ),
    );
  }
}
