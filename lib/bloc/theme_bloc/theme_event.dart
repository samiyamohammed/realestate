sealed class ToggleThemeEvent {}
class ToggleLightTheme extends ToggleThemeEvent {}
class ToggleDarkTheme extends ToggleThemeEvent {}
class LoadThemeEvent extends ToggleThemeEvent {}
