part of 'language_cubit.dart';

class LanguageState extends Equatable {
  const LanguageState({
    required this.locale,
  });

  final Locale locale;

  @override
  List<Object> get props => [locale];
}
