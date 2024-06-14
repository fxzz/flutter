
import 'package:validators/validators.dart';

String? usernameValidate(String? value) {
  if (value == null || value.isEmpty) {
    return "유저네임에 공백이 들어갈 수 없습니다.";
  } else if (!isAlphanumeric(value)) {
    return "유저네임에 한글이나 특수 문자가 들어갈 수 없습니다.";
  } else if (value.length > 12) {
    return "유저네임의 길이를 초과하였습니다.";
  } else {
    return null;
  }
}

String? passwordValidate(String? value) {
  if (value == null || value.isEmpty) {
    return "패스워드에 공백이 들어갈 수 없습니다.";
  } else if (value.length > 12) {
    return "패스워드의 길이를 초과하였습니다.";
  } else {
    return null;
  }
}

String? emailValidate(String? value) {
  if (value == null || value.isEmpty) {
    return "이메일에 공백이 들어갈 수 없습니다.";
  } else if (!isEmail(value)) {
    return "이메일에 형식에 맞지 않습니다.";
  } else {
    return null;
  }
}

String? titleValidate(String? value) {
  if (value == null || value.isEmpty) {
    return "타이틀에 공백이 들어갈 수 없습니다.";
  } else if (value.length > 30) {
    return "타이틀의 길이를 초과하였습니다. 30자 미만.";
  } else {
    return null;
  }
}

String? contentValidate(String? value) {
  if (value == null || value.isEmpty) {
    return "컨텐츠에 공백이 들어갈 수 없습니다.";
  } else {
    return null;
  }
}