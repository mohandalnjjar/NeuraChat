// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Neura Chat`
  String get neuraChat {
    return Intl.message('Neura Chat', name: 'neuraChat', desc: '', args: []);
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Changed Successfully`
  String get changedSuccessfully {
    return Intl.message(
      'Changed Successfully',
      name: 'changedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message('Loading', name: 'loading', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Already Used`
  String get alreadyUsed {
    return Intl.message(
      'Already Used',
      name: 'alreadyUsed',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get checkYourEmail {
    return Intl.message(
      'Check your email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `We will send a reset link`
  String get weWillSendAResetLink {
    return Intl.message(
      'We will send a reset link',
      name: 'weWillSendAResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Continue with google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message('Log In', name: 'login', desc: '', args: []);
  }

  /// `Forgot password?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get Password {
    return Intl.message('password', name: 'Password', desc: '', args: []);
  }

  /// `Sing up`
  String get SingUp {
    return Intl.message('Sing up', name: 'SingUp', desc: '', args: []);
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `User name`
  String get UserName {
    return Intl.message('User name', name: 'UserName', desc: '', args: []);
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `No internet connection. Please check your network settings.`
  String get NoInternetConnectionPleaseCheckYourNetworkSettings {
    return Intl.message(
      'No internet connection. Please check your network settings.',
      name: 'NoInternetConnectionPleaseCheckYourNetworkSettings',
      desc: '',
      args: [],
    );
  }

  /// `Neura`
  String get Neura {
    return Intl.message('Neura', name: 'Neura', desc: '', args: []);
  }

  /// `Ask any question`
  String get AskAnyQuestion {
    return Intl.message(
      'Ask any question',
      name: 'AskAnyQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message('Success', name: 'Success', desc: '', args: []);
  }

  /// `Failed`
  String get Failed {
    return Intl.message('Failed', name: 'Failed', desc: '', args: []);
  }

  // skipped getter for the 'LogOut?' key

  // skipped getter for the 'WhatWouldYouLikeNEURAToKnowAboutYouToOrovideBetterResponses?' key

  /// `Hello, how can I help?`
  String get HelloHowCanIHelp {
    return Intl.message(
      'Hello, how can I help?',
      name: 'HelloHowCanIHelp',
      desc: '',
      args: [],
    );
  }

  /// `Genius Mode`
  String get geniusMode {
    return Intl.message('Genius Mode', name: 'geniusMode', desc: '', args: []);
  }

  /// `Saved Chats`
  String get savedChats {
    return Intl.message('Saved Chats', name: 'savedChats', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `Ask Me Anything`
  String get askMeAnyThing {
    return Intl.message(
      'Ask Me Anything',
      name: 'askMeAnyThing',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message('Generate', name: 'generate', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
