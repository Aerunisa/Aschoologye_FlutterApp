class Validation {
  String validateIDMateri(String value) {
    if (value.isEmpty) {
      return "ID harus diisi";
    }
    return null;
  }

  String validateUname(String value) {
    if (value.isEmpty) {
      return "Username harus diisi";
    }
    if (value.length < 4) {
      return "Username harus lebih dari 4 karakter";
    }
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return "Email harus diisi";
    }
    if (!value.contains('@' '.com')) {
      return "Email tidak valid";
    }
    return null;
  }

  String validatePass(String value) {
    if (value.isEmpty) {
      return "Password harus diisi";
    }
    if (value.length < 5) {
      return "Password harus lebih dari 5 karakter";
    }
    return null;
  }
}
