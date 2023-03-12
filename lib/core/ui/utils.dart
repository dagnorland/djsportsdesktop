T stringToEnum<T>(String value, List<T> enumValues) {
  return enumValues.firstWhere((enumValue) => enumValue.toString() == value);
}

T? nullableStringToEnum<T>(String? value, List<T> enumValues) {
  if (value == null) return null;
  return stringToEnum(value, enumValues);
}
