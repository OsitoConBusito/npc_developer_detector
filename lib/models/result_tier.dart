import 'package:flutter/material.dart';
import 'package:npc_developer_detector/ds/ds.dart';

enum ResultTier {
  npc(color: NpcColors.coral, minScore: 61),
  borderline(color: NpcColors.yellow, minScore: 31),
  dangerous(color: NpcColors.turquoise, minScore: 0);

  const ResultTier({required this.color, required this.minScore});

  final Color color;
  final int minScore;

  List<BoxShadow> get glow {
    switch (this) {
      case ResultTier.npc:
        return NpcShadows.glowRed();
      case ResultTier.borderline:
        return NpcShadows.glowYellow();
      case ResultTier.dangerous:
        return NpcShadows.glowGreen();
    }
  }

  static ResultTier fromScore(int score) {
    if (score >= npc.minScore) {
      return npc;
    }
    if (score >= borderline.minScore) {
      return borderline;
    }
    return dangerous;
  }
}
