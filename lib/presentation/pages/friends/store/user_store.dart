import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vdiary_internship/data/models/user/user_model.dart';

part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

  @observable
  ObservableList<UserModel> listUsers = ObservableList<UserModel>();

  @observable
  bool isLoading = false;

  @observable
  String? successMessage;

  @observable
  String? errorMessage;

  @action
  void setSuccessMessage(String? value) => successMessage = value ?? '';

  @action
  void setErrorMessage(String? value) => errorMessage = value ?? '';

  @action
  Future<bool> findAllSuggestion() async {
    try {
      
    } catch (error) {
      debugPrint(error.toString());
    } finally {
      await Future.delayed(Duration(seconds: 2), () {
        isLoading = false;
      });
    }
    return false;
  }

}