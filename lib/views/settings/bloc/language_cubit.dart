import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
      : super(
          LanguageState(
            locale: Locale(
              PlatformDispatcher.instance.locale.languageCode,
            ),
          ),
        );

  void loadSavedLanguage() async {
    emit(
      LanguageState(
        locale: Locale(
          PlatformDispatcher.instance.locale.languageCode,
        ),
      ),
    );
  }

  void changeLanguage(Locale locale) async {
    await Future<void>.delayed(
      const Duration(milliseconds: 1500),
    );
    emit(
      LanguageState(locale: locale),
    );
  }
}
