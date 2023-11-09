import 'package:elkopra/api/api.dart';
import 'package:elkopra/home/model/news_model.dart';

class HomeController {

  void getNews(data) async{
    try {
      final api = Api();
      final res = await api.getNews();
      if (res != null) {
        data = NewsModel.fromJson(res);
      }
    } catch (e) {
      print(e);
    }
  }
}