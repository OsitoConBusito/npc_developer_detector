import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:npc_developer_detector/gen/strings.g.dart';
import 'package:npc_developer_detector/models/models.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Result ViewModel State
class ResultViewState {
  const ResultViewState({this.isSharing = false, this.error});

  final bool isSharing;
  final String? error;

  ResultViewState copyWith({bool? isSharing, String? error}) {
    return ResultViewState(
      isSharing: isSharing ?? this.isSharing,
      error: error,
    );
  }
}

/// Result ViewModel
class ResultViewModel extends StateNotifier<ResultViewState> {
  ResultViewModel() : super(const ResultViewState());

  final _screenshotController = ScreenshotController();

  ScreenshotController get screenshotController => _screenshotController;

  /// Share result with image
  Future<void> shareResult({
    required QuizResult result,
    required Widget storyCard,
    required BuildContext context,
  }) async {
    state = state.copyWith(isSharing: true);

    try {
      final t = Translations.of(context);
      final image = await _screenshotController.captureFromLongWidget(
        storyCard,
        delay: const Duration(milliseconds: 100),
        pixelRatio: 3,
      );

      await Share.shareXFiles([
        XFile.fromData(image, mimeType: 'image/png', name: 'npc-result.png'),
      ], text: t.share.shareMessage(score: result.score.toString()));

      state = state.copyWith(isSharing: false);
    } catch (e) {
      state = state.copyWith(isSharing: false, error: e.toString());
      // Fallback to text-only share
      await _shareTextOnly(result, context);
    }
  }

  /// Share text only (fallback)
  Future<void> _shareTextOnly(QuizResult result, BuildContext context) async {
    try {
      final t = Translations.of(context);
      await Share.share(t.share.shareMessage(score: result.score.toString()));
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Open course URL
  Future<void> openCourse() async {
    try {
      final uri = Uri.parse('https://www.skool.com/6figureengineer/about');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

/// Result ViewModel Provider
final resultViewModelProvider =
    StateNotifierProvider<ResultViewModel, ResultViewState>(
      (ref) => ResultViewModel(),
    );
