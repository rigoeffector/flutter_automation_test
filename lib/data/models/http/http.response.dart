class HttpResponse {
  dynamic data;
  int status;
  HttpResponse({this.data, this.status});
  factory HttpResponse.fromJson(Map<String, dynamic> json, int statusCode) =>
      HttpResponse(data: json, status:statusCode,);
}