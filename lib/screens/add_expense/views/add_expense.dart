import 'package:flutter/material.dart';
 class AddExpense extends StatelessWidget {
  const AddExpense({super.key});
  @override
  Widget build(BuildContext){
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus() ,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background
        appBar: AppBar{
          backgroundColor: Theme.of(context).colorScheme.background,
        },//AppBar
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: crossAxisAlignment.center,
          children: [
            Text(
              "Add Expenses",\
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),
            ),
            TextFormField(),
            SizeBox(height: 16,),
            TextFormField(),
            SizeBox(height: 16,),
            TextFormField(),
            SizeBox(height: 16,),
            TextButton(
              onPressed: (){},
              child: Text(
                'Save'
              )//Text
            )// TextButton
          ],
         ),
        ),
      ),
    ); //Scaffold
  }
 }