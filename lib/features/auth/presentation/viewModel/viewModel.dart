
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:morethantwo/core/utils/validation/validation.dart';
import 'package:morethantwo/widgets/custom_textfield/custom_textfield.dart';

class AuthViewModel extends ChangeNotifier {

  AuthViewModel() {
    loginEditingController.addListener(() {
      _updateMask();
      _setTextError(loginEditingController.text.isNotEmpty ? loginEditingController.text : null);
    });
  }

  final TextEditingController loginEditingController = TextEditingController();
  final TextEditingController pinCodeEditingController = TextEditingController();

  TextFieldType? typeTextField;
  bool isNumber = false;
  bool isErrorPinCode = false;

  void setIsErrorPinCode(value){
    isErrorPinCode = value;
    notifyListeners();
  }

  final String pinCode = '1234';

  List<TextInputFormatter> inputFormatters = [];

  final emailFormatter = MaskTextInputFormatter(mask: '');
  final phoneFormatter = MaskTextInputFormatter(
      mask: '+1 (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
  );

  void _updateMask() {
    String text = loginEditingController.text;
    if (text.startsWith('+') && inputFormatters.isEmpty) {
      inputFormatters = [phoneFormatter];
    } else if (!text.startsWith('+') && inputFormatters.isNotEmpty) {
      inputFormatters = [];
    }
    notifyListeners();
  }

  @override
  void dispose() {
    loginEditingController.removeListener(_updateMask);
    loginEditingController.dispose();
    pinCodeEditingController.dispose();
    super.dispose();
  }

  void setTypeTextField(value) {
    typeTextField = value;
    if(value == null) {
      loginEditingController.clear();
    }
    notifyListeners();
  }

  String? textError;

  void _setTextError(String? value) {
    textError = (inputFormatters.isEmpty ? TextValidators.emailError(value) : TextValidators.phoneNumberError(value));
    notifyListeners();
  }

}