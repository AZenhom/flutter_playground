import 'package:flutter/material.dart';

class CreateExpenseSheet extends StatefulWidget {
  const CreateExpenseSheet({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CreateExpenseSheetState();
  }
}

class _CreateExpenseSheetState extends State<CreateExpenseSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Create Expense'));
  }
}
