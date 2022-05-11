import 'package:drift/drift.dart';

/// DriftのDateTimeがズレる不具合の対処用のExtension
/// 修正方法参考
/// https://github.com/simolus3/drift/issues/286#issuecomment-830068149
extension DeepDateTimeExpressions on Expression<DateTime?> {
  Expression<String> get dateLocal {
    return FunctionCallExpression(
      "DATE",
      [
        this,
        const Constant<String>("unixepoch"),
        const Constant<String>("localtime")
      ],
    );
  }
}

extension DeepCompareDateDB on GeneratedColumn<DateTime?> {
  Expression<bool> dateEquals(DateTime value) {
    return dateLocal.equals(value.toIso8601String().substring(0, 10));
  }
}
