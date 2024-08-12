import 'package:api2/Recipes/recipes_model.dart';
import 'package:http/http.dart' as http;
// AppStorage'ı ekleyin

recipesItem() async {
  Uri url = Uri.parse("https://dummyjson.com/recipes");
  var res = await http.get(url);

  try {
    if (res.statusCode == 200) {
      var data = recipesModelFromJson(res.body);
      return data.recipes;
    } else {
      print("Error: ${res.statusCode}");
      return []; // Hata durumunda boş liste döndür
    }
  } catch (e) {
    print(e.toString());
    return []; // Hata durumunda boş liste döndür
  }
}