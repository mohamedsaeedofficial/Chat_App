import 'package:flutter/material.dart';

class CustomTextFormFieldEmail extends StatelessWidget {
    CustomTextFormFieldEmail( {super.key , this.onChange, this.hint,});
  final String? hint;
  Function (String)? onChange ;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(value!.isEmpty){
          return 'Field Required' ;
        }
        
      },
      style: const TextStyle(color: Colors.white),
      onChanged: onChange,
      decoration: InputDecoration(
        
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white60),
      ),
    );
  }
}
