
import 'package:the_validator/the_validator.dart';

String validateEmail(String val) {
  if (val.isEmpty) {
    return "Email Address cannot be empty";
  } else {
    if (Validator.isEmail(val)) {
      return null;
    } else {
      return "Please enter valid Email Address";
    }
  }
}

String validateDouble(var val){
  if (val.length == 0) {
    return "Field cannot be empty";
  } else {
    if (Validator.isNumber(val)) {
      return null;
    }else{
      return "Invalid field value. Please enter an numeric value";
    }

  }
}

validateDate(DateTime val) {
  if (val == null) {
    return "Date cannot be empty";
  } else {return null;
  }
}

validateTime(DateTime val) {
  if (val == null) {
    return "Time cannot be empty";
  } else {return null;
  }
}

String validateString(String val) {
  if (val.isEmpty) {
    return "Field cannot be empty";
  } else {return null;
  }
}

String validateMsisdn(String val) {
  if (val.isEmpty) {
    return "Phone number cannot be empty";
  } else {return null;
  }
}

String validateCode(String val) {
  if (val.isEmpty) {
    return "Activation code cannot be empty";
  } else {
    if (Validator.isNumber(val)) {
      if (!Validator.minLength(val, 4)) {
        return "Invalid activation code";
      }
      return null;
    } else {
      return "Invalid activation code";
    }
  }
}

String validateOTP(String val) {
  if (val.isEmpty) {
    return "OTP code cannot be empty";
  } if (Validator.isNumber(val)) {
    if (!Validator.minLength(val, 8) || !Validator.maxLength(val, 8)) {
      return "OTP should be 8 characters long.";
    }
    return null;
  } else {
    return "Invalid OTP code";
  }


}

String confirmPassword(String first, second) {
  if (Validator.isEqualTo(first, second)) {
    return null;
  } else {
    return "Password do not match";
  }
}

String validatePassword(String val) {
  final _passwordRegExp = RegExp(
      r'^[A-Za-z\d@$!%*?&]{8,}$'
  );
  if (val.isEmpty) {
    return "Password cannot be empty";
  } return _passwordRegExp.hasMatch(val)
        ? null
        : "Invalid password. Password should be atleast 8 characters with atleast 1 uppercase letter, numbers and special characters.";
}

String validateConfirmPassword(String val, String text) {
  if (val != text) {
    return "Passwords do not match";
  } 

  final _passwordRegExp = RegExp(
      r'^[A-Za-z\d@$!%*?&]{8,}$'
  );
  if (val.isEmpty) {
    return "Password cannot be empty";
  } return _passwordRegExp.hasMatch(val)
        ? null
        : "Invalid password. Password should be atleast 8 characters with atleast 1 uppercase letter, numbers and special characters.";

}
