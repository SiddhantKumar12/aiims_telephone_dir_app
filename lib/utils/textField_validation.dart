class MyValidationCheck {
  static Function employeeIdValidator() {
    return (String? value) {
      RegExp regex = RegExp(r'^[A-Z]\d{7}$');
      if (value == null || value.isEmpty) {
        return "Employee ID is required";
      } else if (!value.startsWith(RegExp(r'[A-Z]'))) {
        return "Employee ID must start with an alphabet";
      } else if (!regex.hasMatch(value)) {
        return "Put 7 digits (e.g., E0000000)";
      }
      return null;
    };
  }
}
