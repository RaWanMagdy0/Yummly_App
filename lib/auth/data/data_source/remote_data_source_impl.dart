import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:yummly_app/auth/data/data_source/remote_data_source.dart';
import 'package:yummly_app/auth/data/models/request_model/reset_password_request_model.dart';
import '../../../core/api/api_result.dart';
import '../../../core/api/execute_api_call.dart';
import '../api/api_manger.dart';
import '../models/request_model/sign_in_request_model.dart';
import '../models/request_model/sign_up_request_model.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthApiManager apiManager;
  FirebaseAuth firebaseAuth;
  GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl(
    this.firebaseAuth,
    this.googleSignIn,
    this.apiManager,
  );

  @override
  Future<Result<String?>> signup(SignUpRequestModel signUpRequestModel) {
    return executeApiCall<String?>(() async {
      final response = await apiManager.signUp(signUpRequestModel);
      return response?.message;
    });
  }

  @override
  Future<Result<String?>> signin(LoginRequestBodyModel signInRequestBody) {
    return executeApiCall<String?>(() async {
      final response = await apiManager.signIn(signInRequestBody);
      return response.message;
    });
  }

  @override
  Future<Result<String?>> forgotPassword({required String email}) {
    return executeApiCall<String?>(() async {
      String? message = await apiManager.forgetPassword({'email': email});
      return message;
    });
  }

  @override
  Future<Result<String?>> verifyResetCode({required requestBody}) {
    return executeApiCall<String?>(() async {
      String? message = await apiManager.verifyResetCode(requestBody);
      return message;
    });
  }

  @override
  Future<Result<String?>> resetPassword(
    ResetPasswordRequestModel resetPassword,
  ) {
    return executeApiCall<String?>(() async {
      String? message = await apiManager.resetPassword(resetPassword);
      return message;
    });
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        if (kDebugMode) {
          print(" User cancelled the sign-in");
        }
        return null;
      }
      if (kDebugMode) {
        print("GoogleSignInAccount retrieved: ${googleSignInAccount.email}");
      }
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      if (kDebugMode) {
        print("Authentication tokens obtained");
      }
      await Future.delayed(Duration(milliseconds: 500));

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await firebaseAuth
          .signInWithCredential(credential)
          .timeout(Duration(seconds: 30));

      if (kDebugMode) {
        print(" Firebase sign-in successful: ${userCredential.user?.email}");
      }
      return userCredential.user;
    } on TimeoutException {
      if (kDebugMode) {
        print(" Firebase sign-in timed out");
      }
      final currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        if (kDebugMode) {
          print(" Using current user: ${currentUser.email}");
        }
        return currentUser;
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(" Error during Google Sign-In: $e");
      }
      if (e.toString().contains('PigeonUserDetails') ||
          e.toString().contains('type cast')) {
        await Future.delayed(Duration(seconds: 2));
        final currentUser = firebaseAuth.currentUser;
        if (currentUser != null) {
          if (kDebugMode) {
            print(" Fallback: Using current user: ${currentUser.email}");
          }
          return currentUser;
        }
      }

      await googleSignIn.signOut();
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }


}
