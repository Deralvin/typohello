library typohello;
import 'package:http/http.dart' as http;
import 'package:typohello/model/Movies.dart';
/// A Calculator.
class TypoHello {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  String namaData(){
    return "hello papa";
  }

  String content(){
    return "ini content";
  }

  Future<Movies> getData(String applicationID)async{
    final client =  http.Client();
    try{
      final url =Uri.parse( "https://api.themoviedb.org/3/movie/550?api_key=${applicationID}");
        print(url);
      final response = await client.get(url);
      print(moviesFromJson(response.body));
      final movies = moviesFromJson(response.body);
      print("this is a movie ${movies.title}");
      return moviesFromJson(response.body);
    }catch(e){
      rethrow;
    }
  }

}
