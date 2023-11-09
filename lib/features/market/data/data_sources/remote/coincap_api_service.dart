import 'package:flutter_template_insideapp/features/market/data/models/asset.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
part 'coincap_api_service.g.dart';

@RestApi(baseUrl:coincapAPIBaseURL)
abstract class CoincapApiService {
  factory CoincapApiService(Dio dio) = _CoincapApiService;
  
  @GET('/assets')
  Future<HttpResponse<List<AssetModel>>> getAssets(
    /*if needed we can pass some parameter by doing it :
    { 
      @Query("apiKey") String ? apiKey
    }
    */
  );
}