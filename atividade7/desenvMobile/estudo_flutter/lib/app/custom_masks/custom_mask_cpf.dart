import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomMaskCpf extends MaskTextInputFormatter {

  static String maskCpf = "###.###.###-##";

  CustomMaskCpf({String? initialText}): super(
      mask: maskCpf,
      initialText: initialText
  );

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text != "" || oldValue.text != ""){
      if(oldValue.text.length < newValue.text.length){

      } else{
        if (newValue.text.length <= 14) {
          updateMask(mask: maskCpf);
        }
      }
    }
    return super.formatEditUpdate(oldValue, newValue);
  }

}