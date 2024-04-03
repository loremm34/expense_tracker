import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});
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
  var _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void closeModalSheet(context) {
    Navigator.pop(context);
  }

  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 2000, now.month, now.day);
    showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: '\$',
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Select date"),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.date_range))
                ],
              ))
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: const Text("Save Title")),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    closeModalSheet(context);
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
