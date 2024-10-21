class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  String errorMassage;
  dynamic responseData;

  NetworkResponse(
      {required this.isSuccess,
      required this.statusCode,
      this.responseData,
      this.errorMassage = 'Something wrong happened'});
}
