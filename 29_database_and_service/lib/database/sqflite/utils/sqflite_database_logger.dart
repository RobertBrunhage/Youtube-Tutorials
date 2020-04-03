class SqfliteDatabaseLogger {
  void log(
    String functionName,
    String sql,
    List<Map<String, dynamic>> selectQueryResult,
    int insertAndUpdateQueryResult,
    List<dynamic> params,
  ) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }
}
