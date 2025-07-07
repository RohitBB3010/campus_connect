import 'dart:convert';
import 'dart:math';
import 'package:campus_connect_frontend/home/profile/profile_state.dart';
import 'package:campus_connect_frontend/models/user_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  Future<void> fetchHomePage() async {
    try {
      emit(ProfileLoadingState());

      String email = fb.FirebaseAuth.instance.currentUser!.email!;

      String url = "http://10.0.2.2:8000/home/fetch-home?email=$email";

      final response = await http.get(Uri.parse(url));

      debugPrint("Response body is : ${response.body}");

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      User user = User.fromJson(responseBody['user']);

      PlatformFile? image;

      if (user.imageUrl == null || user.imageUrl!.trim().isEmpty) {
        image = null;
      } else {
        image = await fetchImageFromUrl(user.imageUrl!);
      }

      emit(ProfileLoadedState(
          user: user,
          image: image,
          modEmail: user.emailId,
          modName: user.name));
    } catch (err) {
      emit(ProfileErrorState(error: err.toString()));
    }
  }

  Future<PlatformFile?> fetchImageFromUrl(String imageUrl) async {
    try {
      String url = "http://10.0.2.2:8000/$imageUrl";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return PlatformFile(
          name: imageUrl.split('/').last,
          bytes: response.bodyBytes,
          path: null,
          size: response.bodyBytes.length,
        );
      } else if (response.statusCode == 404) {
        debugPrint('Error: Image not found (404). URL: $url');
      } else {
        debugPrint(
            'Error: Failed to fetch image. Status code: ${response.statusCode}, URL: $url');
      }

      return null;
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> editProfile(String? newName, PlatformFile? image) async {
    try {
      String editUri = "http://10.0.2.2:8000/home/edit-profile";

      Map<String, dynamic> requestBody;
      String email = fb.FirebaseAuth.instance.currentUser!.email!;

      debugPrint(email);
      if (image == null) {
        requestBody = {"name": newName, "setImageNull": true, "email": email};
      } else {
        debugPrint("Here at image not null");
        String imageAddUri =
            "http://10.0.2.2:8000/home/upload_image?id=${(state as ProfileLoadedState).user!.id}&type=user";

        var request = http.MultipartRequest('POST', Uri.parse(imageAddUri));

        request.files.add(await http.MultipartFile.fromPath(
            'image', image.path!,
            contentType: MediaType('image', 'jpeg')));

        var response = await request.send();
        var responseBody = await response.stream.bytesToString();

        if (response.statusCode == 500 || response.statusCode == 400) {
          debugPrint("Response is : $responseBody");
        } else {
          debugPrint("File added successfully");
          debugPrint("File path is : ${jsonDecode(responseBody)['filePath']}");
        }

        requestBody = {"name": newName, "setImageNull": false, "email": email};
      }

      final editResponse = await http.put(Uri.parse(editUri),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody));

      debugPrint(jsonDecode(editResponse.body).toString());
    } catch (err) {
      debugPrint(err.toString());
      //emit(ProfileErrorState(error: err.toString()));
    }
  }

  void nameChanged(String name) {
    emit((state as ProfileLoadedState).copyWith(modName: name));
  }

  void emailChanged(String email) {
    emit((state as ProfileLoadedState).copyWith(modEmail: email));
  }

  void imageChanged(PlatformFile? file) {
    debugPrint("Resourced removed");
    emit((state as ProfileLoadedState).copyWith(image: file));
  }
}
