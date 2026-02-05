import 'dart:io';
import 'dart:typed_data';
import 'package:budget/database/supabase_manager.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/globalSnackbar.dart';
import 'package:budget/widgets/openPopup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

Future<String?> getPhotoAndUpload({required ImageSource source}) async {
  dynamic result = await openLoadingPopupTryCatch(() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: source);
    if (photo == null) {
      if (source == ImageSource.camera) throw ("no-photo-taken".tr());
      if (source == ImageSource.gallery) throw ("no-file-selected".tr());
      throw ("error-getting-photo");
    }

    Uint8List fileBytes = await photo.readAsBytes();
    return await uploadFileToStorage(
      fileBytes: fileBytes,
      fileName: photo.name,
    );
  }, onError: (e) {
    openSnackbar(
      SnackbarMessage(
        title: "error-attaching-file".tr(),
        description: e.toString(),
        icon: appStateSettings["outlinedIcons"]
            ? Icons.error_outlined
            : Icons.error_rounded,
      ),
    );
  });
  if (result is String) return result;
  return null;
}

Future<String?> getFileAndUpload() async {
  dynamic result = await openLoadingPopupTryCatch(() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) throw ("no-file-selected".tr());

    Uint8List fileBytes;

    if (kIsWeb) {
      fileBytes = result.files.single.bytes!;
    } else {
      File file = File(result.files.single.path ?? "");
      fileBytes = await file.readAsBytes();
    }

    return await uploadFileToStorage(
      fileBytes: fileBytes,
      fileName: result.files.single.name,
    );
  }, onError: (e) {
    openSnackbar(
      SnackbarMessage(
        title: "error-attaching-file".tr(),
        description: e.toString(),
        icon: appStateSettings["outlinedIcons"]
            ? Icons.error_outlined
            : Icons.error_rounded,
      ),
    );
  });
  if (result is String) return result;
  return null;
}

Future<String?> uploadFileToStorage({
  required Uint8List fileBytes,
  required String fileName,
}) async {
  try {
    String timestamp = DateFormat("yyyy-MM-dd-HHmmss").format(DateTime.now());
    String path = "$timestamp-$fileName";
    
    // Upload to 'attachments' bucket
    await SupabaseManager().client.storage.from('attachments').uploadBinary(
      path,
      fileBytes,
      // fileOptions: FileOptions(upsert: true), // Optional
    );

    // Get public URL
    final String publicUrl = SupabaseManager()
        .client
        .storage
        .from('attachments')
        .getPublicUrl(path);

    return publicUrl;
  } catch (e) {
    print("Error uploading file to Supabase: $e");
    throw e;
  }
}
