# hiberus_ttf

Prueba técnica de flutter de Hiberus

## dependencias

- cupertino_icons: ^1.0.2
- email_validator: '^2.0.0'
- dio: ^4.0.6
- infinite_scroll_pagination: ^3.1.0
- flutter_cache_store: ^0.8.1

## tareas opcionales

|¿Completado? | Tarea |
|-------------|-------|
| Sí | Deliver the app to a Git repository, so wecan see the history of what you have done.|
| Sí |Implement  the  interface,  as  much  as  possible,  using Material  Designcomponents  and styles.|
| Sí |Use variables to define sizes and styles in separate files.|
| | Support language localization.|
| Sí | Implement the screens in different classes.|
| Sí | Make it support screen rotation.|
| | Implements landscape mode, so you can see the list and the detail of the selected item at the same time.|
| Sí | Use  some  library  to  help  you  create  the  REST  API  client  and  make  the  call  to  the  web service.|
| | It captures  possible  connection  and  data  deserialization  errors  and  informs  the  user accordingly.|
| Sí | Add  separation  of  concepts  by  dividing  your  application  into  several  parts  (presentation, domain and network).|
| | Uses reactive programming|
| | You  can  use  ViewModel  toserve  the  data  to  the  interface,  if  appropriate  for  your implementation.|
| Sí | Implements API pagination with infinite scroll.|
| | Caches images to improve the user experience.|
| | Cache  the  webservice  data  so  as  not  to  make  a  new  network  request  each  time  you navigateto screen 2.|
| | Add some unit and/or interface tests.|

## Notas

La clase ```HiberusTtfHttpOverrides``` se crea para  superar un problema con un error de certificado al consultar la API de MTG

```DART
class HiberusTtfHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
```

En main.dart se instancia así:

```DART
HttpOverrides.global = HiberusTtfHttpOverrides();
```
