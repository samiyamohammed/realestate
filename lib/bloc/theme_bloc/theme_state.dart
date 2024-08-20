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
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              // surface: Color.fromARGB(1, 91, 53, 175),
              primary: const Color.fromARGB(255, 255, 255, 255),
              secondary: const Color.fromARGB(1, 91, 53, 175),
              tertiary: const Color.fromARGB(1, 91, 53, 175),
              inversePrimary: Colors.grey.shade700,
            ),
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
            useMaterial3: true,
            colorScheme: ColorScheme.dark(
              // surface: const Color.fromARGB(255, 20, 20, 20),
              primary: const Color.fromARGB(1, 18, 18, 18),
              secondary: const Color.fromARGB(1, 48, 42, 42),
              tertiary: Color.fromARGB(1, 29, 27, 32),
              inversePrimary: Colors.grey.shade300,
            ),
          ),
        );
}
