// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthController, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(
            () => super.isFormValid,
            name: '_AuthController.isFormValid',
          ))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(
            () => super.hasError,
            name: '_AuthController.hasError',
          ))
          .value;

  late final _$isLoadingAtom = Atom(
    name: '_AuthController.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoggedInAtom = Atom(
    name: '_AuthController.isLoggedIn',
    context: context,
  );

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$tokenAtom = Atom(
    name: '_AuthController.token',
    context: context,
  );

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_AuthController.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$emailAtom = Atom(
    name: '_AuthController.email',
    context: context,
  );

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom = Atom(
    name: '_AuthController.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isRememberMeAtom = Atom(
    name: '_AuthController.isRememberMe',
    context: context,
  );

  @override
  bool get isRememberMe {
    _$isRememberMeAtom.reportRead();
    return super.isRememberMe;
  }

  @override
  set isRememberMe(bool value) {
    _$isRememberMeAtom.reportWrite(value, super.isRememberMe, () {
      super.isRememberMe = value;
    });
  }

  late final _$userInfoAtom = Atom(
    name: '_AuthController.userInfo',
    context: context,
  );

  @override
  Map<String, dynamic>? get userInfo {
    _$userInfoAtom.reportRead();
    return super.userInfo;
  }

  @override
  set userInfo(Map<String, dynamic>? value) {
    _$userInfoAtom.reportWrite(value, super.userInfo, () {
      super.userInfo = value;
    });
  }

  late final _$loginAsyncAction = AsyncAction(
    '_AuthController.login',
    context: context,
  );

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$registerAsyncAction = AsyncAction(
    '_AuthController.register',
    context: context,
  );

  @override
  Future<bool> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) {
    return _$registerAsyncAction.run(
      () => super.register(name, email, password, confirmPassword),
    );
  }

  late final _$logoutAsyncAction = AsyncAction(
    '_AuthController.logout',
    context: context,
  );

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$forgotPasswordAsyncAction = AsyncAction(
    '_AuthController.forgotPassword',
    context: context,
  );

  @override
  Future<bool> forgotPassword(String email) {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword(email));
  }

  late final _$resetPasswordAsyncAction = AsyncAction(
    '_AuthController.resetPassword',
    context: context,
  );

  @override
  Future<bool> resetPassword(String token, String newPassword) {
    return _$resetPasswordAsyncAction.run(
      () => super.resetPassword(token, newPassword),
    );
  }

  late final _$_AuthControllerActionController = ActionController(
    name: '_AuthController',
    context: context,
  );

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
      name: '_AuthController.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
      name: '_AuthController.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRememberMe(bool value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
      name: '_AuthController.setRememberMe',
    );
    try {
      return super.setRememberMe(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
      name: '_AuthController.setLoading',
    );
    try {
      return super.setLoading(value);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String? error) {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
      name: '_AuthController.setError',
    );
    try {
      return super.setError(error);
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
      name: '_AuthController.clearError',
    );
    try {
      return super.clearError();
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadSavedCredentials() {
    final _$actionInfo = _$_AuthControllerActionController.startAction(
      name: '_AuthController.loadSavedCredentials',
    );
    try {
      return super.loadSavedCredentials();
    } finally {
      _$_AuthControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
token: ${token},
errorMessage: ${errorMessage},
email: ${email},
password: ${password},
isRememberMe: ${isRememberMe},
userInfo: ${userInfo},
isFormValid: ${isFormValid},
hasError: ${hasError}
    ''';
  }
}
