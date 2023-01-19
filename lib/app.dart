
import 'package:clothing_store_app/features/registration/presentation/bloc/authorization_bloc_states.dart';
import 'package:clothing_store_app/features/registration/presentation/pages/auth_page/auth_page_model.dart';
import 'package:clothing_store_app/features/registration/presentation/widgets/auth_form/auth_form_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/registration/presentation/pages/auth_page/auth_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/auth': (context) => ChangeNotifierProvider(
            create: (_) => AuthFormWidgetModel(),
            child: const AuthPage()
        ),
      },
      // home: const AuthPage(),
      // builder: (context, appState) {
      //   if(appState is AppStateLoggedOut) {
      //     return const LoginView();
      //   } else if (appState is AppStateLoggedIn) {
      //     return const MainPage();
      //   } else if (appState is AppStateRegistration ) {
      //     return const MainPage();
      //   } else {
      //     return Container();
      //   }
      // },
      initialRoute: '/auth',
    );
  }
}