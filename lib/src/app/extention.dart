

// ignore_for_file: unnecessary_null_comparison

// extension on String
extension NonNullString on String {
  String orEmpthy() {
    if (this == null) {
      return "";
    } else {
      return this;
    }
  }
}

// extension on integer
extension NonNullInteger on int {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this;
    }
  }
}

