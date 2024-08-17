# basic News App

This is a simple news app made with Flutter

### Using:

- Dio package
- webview flutter
- cubit
- shared_preferences
- conditional builder null safety
- intl
- flutter launcher icons
  
## Preview 
| Politics News Screen | Business News Screen | Sports News Screen | Search Screen | Webview |
|  ---  |  ---  |  --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/a8ef87fc-3475-4339-87bc-0b085cd304ab" height=400 width=200> | <img src="https://github.com/user-attachments/assets/61dd1e2f-c40e-4897-bb6a-fc8a470d271f" height=400 width=200> | <img src="https://github.com/user-attachments/assets/1d66bc8f-92e1-490d-a41b-aa732ad64289" height=400 width=200> | <img src="https://github.com/user-attachments/assets/d088cbf8-9361-446e-b420-d07ab7158254" height=400 width=200> | <img src="https://github.com/user-attachments/assets/76e3004a-2f8f-4ff1-b547-8b4dbeadb194" height=400 width=200> |


## Dio Snippets
- #### Dio helper class
```dart
class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
    ));
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
```

- #### Get articles data API call function 
```dart
  void getPolitics() {
    emit(PoliticsLoadingState());
    DioHelper.getData(url: 'v2/top-headlins', query: {
      'country': 'us',
      'category': 'politics',
      'apikey': 'API_KEY',
    }).then((value) {
      politics = value.data['articles'];
      emit(PoliticsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PoliticsErrorState(error.toString()));
    });
  }
```





