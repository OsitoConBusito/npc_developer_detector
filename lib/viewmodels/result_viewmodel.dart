import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:npc_developer_detector/models/models.dart';
import 'package:npc_developer_detector/viewmodels/states/result_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'result_viewmodel.g.dart';

@riverpod
class ResultViewModel extends _$ResultViewModel {
  @override
  ResultViewState build() => const ResultViewState();

  final ScreenshotController _screenshotController = ScreenshotController();

  ScreenshotController get screenshotController => _screenshotController;

  Future<void> shareResult({
    required QuizResult result,
    required Widget storyCard,
    required String shareMessage,
  }) async {
    state = state.copyWith(isSharing: true);

    try {
      final Uint8List image = await _screenshotController.captureFromLongWidget(
        storyCard,
        delay: const Duration(milliseconds: 100),
        pixelRatio: 3,
      );

      await Share.shareXFiles([
        XFile.fromData(image, mimeType: 'image/png', name: 'npc-result.png'),
      ], text: shareMessage);

      state = state.copyWith(isSharing: false);
    } catch (e) {
      state = state.copyWith(isSharing: false, error: e.toString());
      await _shareTextOnly(shareMessage);
    }
  }

  Future<void> _shareTextOnly(String shareMessage) async {
    try {
      await Share.share(shareMessage);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> openCourse() async {
    try {
      final Uri uri = Uri.parse('https://www.skool.com/6figureengineer/about');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
