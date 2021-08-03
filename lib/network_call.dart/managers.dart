import 'package:dio/dio.dart';
import 'package:practice3/models/data_model.dart';
import 'package:practice3/network_call.dart/base_network.dart';
import 'package:practice3/network_call.dart/base_response.dart';


class UsersManager{
    Future<ResponseData> fetchUsers() async {

    Response response;
    try {
      response = await dioClient.ref!
          .get<dynamic>("https://rss-to-json-serverless-api.vercel.app/api?feedURL=https://timesofindia.indiatimes.com/rssfeeds/-2128936835.cms");

      if(response.statusCode == 200) {
        final model =DataModel2.fromJson(response.data);
        //final model = UserData.userDataFromJson(response.data);
        return ResponseData("", ResponseStatus.SUCCESS, data: model);
      } else {
        var message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( err.toString(), ResponseStatus.FAILED);
    }

  }
   
}
UsersManager userManager = UsersManager();
