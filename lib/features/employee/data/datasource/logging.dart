import 'package:dio/dio.dart';

class DioLogger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("📌 REQUEST → ${options.method} ${options.uri}");
    print("🔹 HEADERS → ${options.headers}");
    if (options.data != null) print("🔸 BODY → ${options.data}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("✅ RESPONSE ← ${response.statusCode} ${response.requestOptions.uri}");
    print("🟢 DATA ← ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("❌ ERROR ← ${err.response?.statusCode} ${err.requestOptions.uri}");
    print("⚠ MESSAGE → ${err.message}");
    print("🟥 ERROR DATA → ${err.response?.data}");
    super.onError(err, handler);
  }
}
