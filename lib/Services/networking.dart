import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  final String url;

  NetworkHelper(this.url);

  //grabs data from URL and decodes it into a json object
  Future getData() async{
    http.Response response = await http.get(url);
   

    if(response.statusCode == 200)
      try{
        var decodedData = jsonDecode(response.body);
        return decodedData;   
      } catch(e){
        print(e);
      }


  }

}