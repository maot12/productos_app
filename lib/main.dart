import 'package:flutter/material.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {

  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsService(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName     : (_) => const HomeScreen(),
        LoginScreen.routeName    : (_) => const LoginScreen(),
        ProductScreen.routeName  : (_) => const ProductScreen(),
        RegisterScreen.routeName : (_) => const RegisterScreen(),
        CheckAuthScreen.routeName: (_) => const CheckAuthScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    );
  }
}
