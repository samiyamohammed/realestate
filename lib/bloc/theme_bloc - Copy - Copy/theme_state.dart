part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState()
      : super(
          ThemeData(
            colorScheme: ColorScheme.light(
                surface: Color.fromARGB(1, 91, 53, 175),
                primary: Colors.grey.shade500,
                secondary: Colors.grey.shade100,
                tertiary: Colors.white,
                inversePrimary: Colors.grey.shade700),
            textTheme: TextTheme(
              bodyLarge: TextStyle(),
            ),
          ),
        );
}

class DarkThemeState extends ThemeState {
  DarkThemeState()
      : super(
          ThemeData(
            colorScheme: ColorScheme.dark(
              surface: const Color.fromARGB(255, 20, 20, 20),
              primary: const Color.fromARGB(255, 122, 122, 122),
              secondary: const Color.fromARGB(255, 30, 30, 30),
              tertiary: Color.fromARGB(255, 47, 47, 47),
              inversePrimary: Colors.grey.shade300,
            ),
          ),
        );
}
