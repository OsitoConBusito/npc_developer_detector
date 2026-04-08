///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsLandingEn landing = TranslationsLandingEn._(_root);
	late final TranslationsQuizEn quiz = TranslationsQuizEn._(_root);
	late final TranslationsResultEn result = TranslationsResultEn._(_root);
	late final TranslationsShareEn share = TranslationsShareEn._(_root);
}

// Path: landing
class TranslationsLandingEn {
	TranslationsLandingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'are you an npc developer?'
	String get title => 'are you an npc\ndeveloper?';

	/// en: 'be honest. this might hurt.'
	String get subtitle => 'be honest. this might hurt.';

	/// en: 'find out'
	String get startButton => 'find out';

	/// en: 'i already know'
	String get skipButton => 'i already know';
}

// Path: quiz
class TranslationsQuizEn {
	TranslationsQuizEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'question ${current} of ${total}'
	String questionOf({required Object current, required Object total}) => 'question ${current} of ${total}';

	/// en: 'next'
	String get nextButton => 'next';

	/// en: 'show me the truth'
	String get showResult => 'show me the truth';

	late final TranslationsQuizQ1En q1 = TranslationsQuizQ1En._(_root);
	late final TranslationsQuizQ2En q2 = TranslationsQuizQ2En._(_root);
	late final TranslationsQuizQ3En q3 = TranslationsQuizQ3En._(_root);
	late final TranslationsQuizQ4En q4 = TranslationsQuizQ4En._(_root);
	late final TranslationsQuizQ5En q5 = TranslationsQuizQ5En._(_root);
	late final TranslationsQuizQ6En q6 = TranslationsQuizQ6En._(_root);
}

// Path: result
class TranslationsResultEn {
	TranslationsResultEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'you are'
	String get title => 'you are';

	/// en: 'npc developer'
	String get npcLabel => 'npc developer';

	/// en: '${score}% npc'
	String scoreFormat({required Object score}) => '${score}% npc';

	late final TranslationsResultTierNpcEn tierNpc = TranslationsResultTierNpcEn._(_root);
	late final TranslationsResultTierBorderlineEn tierBorderline = TranslationsResultTierBorderlineEn._(_root);
	late final TranslationsResultTierDangerousEn tierDangerous = TranslationsResultTierDangerousEn._(_root);

	/// en: 'share your result'
	String get shareButton => 'share your result';

	/// en: 'take again'
	String get retryButton => 'take again';

	/// en: 'learn to sell yourself better'
	String get ctaButton => 'learn to sell yourself better';
}

// Path: share
class TranslationsShareEn {
	TranslationsShareEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'i'm ${score}% npc developer'
	String storyText({required Object score}) => 'i\'m ${score}% npc developer';

	/// en: 'are you an npc dev? find out:'
	String get storySubtext => 'are you an npc dev? find out:';

	/// en: 'i'm ${score}% npc developer. check yours:'
	String shareMessage({required Object score}) => 'i\'m ${score}% npc developer. check yours:';

	/// en: '> npc_detector --scan'
	String get storyCommand => '> npc_detector --scan';

	/// en: 'npc developer detector'
	String get storyBranding => 'npc developer detector';
}

// Path: quiz.q1
class TranslationsQuizQ1En {
	TranslationsQuizQ1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'when you hit a bug, what's your first move?'
	String get title => 'when you hit a bug,\nwhat\'s your first move?';

	/// en: 'copy the error into stackoverflow'
	String get a => 'copy the error into stackoverflow';

	/// en: 'paste it into chatgpt and wait'
	String get b => 'paste it into chatgpt and wait';

	/// en: 'read the stack trace and debug it'
	String get c => 'read the stack trace and debug it';

	/// en: 'console.log everywhere and pray'
	String get d => 'console.log everywhere and pray';
}

// Path: quiz.q2
class TranslationsQuizQ2En {
	TranslationsQuizQ2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'how do you start a new project?'
	String get title => 'how do you start\na new project?';

	/// en: 'find a tutorial and follow it step by step'
	String get a => 'find a tutorial and follow it step by step';

	/// en: 'clone a template or boilerplate'
	String get b => 'clone a template or boilerplate';

	/// en: 'design the architecture, then build'
	String get c => 'design the architecture, then build';

	/// en: 'ask AI to generate the whole thing'
	String get d => 'ask AI to generate the whole thing';
}

// Path: quiz.q3
class TranslationsQuizQ3En {
	TranslationsQuizQ3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'what's your relationship with AI tools?'
	String get title => 'what\'s your relationship\nwith AI tools?';

	/// en: 'chatgpt writes most of my code'
	String get a => 'chatgpt writes most of my code';

	/// en: 'I use it to learn, but I write my code'
	String get b => 'I use it to learn, but I write my code';

	/// en: 'copilot autocompletes, I just press tab'
	String get c => 'copilot autocompletes, I just press tab';

	/// en: 'I barely use AI tools'
	String get d => 'I barely use AI tools';
}

// Path: quiz.q4
class TranslationsQuizQ4En {
	TranslationsQuizQ4En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'how do you learn new technology?'
	String get title => 'how do you learn\nnew technology?';

	/// en: 'binge a 10-hour youtube course'
	String get a => 'binge a 10-hour youtube course';

	/// en: 'follow the official docs tutorial'
	String get b => 'follow the official docs tutorial';

	/// en: 'build something real with it immediately'
	String get c => 'build something real with it immediately';

	/// en: 'wait until someone makes a tutorial'
	String get d => 'wait until someone makes a tutorial';
}

// Path: quiz.q5
class TranslationsQuizQ5En {
	TranslationsQuizQ5En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'what happens after you ship a feature?'
	String get title => 'what happens after\nyou ship a feature?';

	/// en: 'move to the next ticket immediately'
	String get a => 'move to the next ticket immediately';

	/// en: 'post about it on social media'
	String get b => 'post about it on social media';

	/// en: 'talk to users and measure impact'
	String get c => 'talk to users and measure impact';

	/// en: 'I haven't shipped anything yet'
	String get d => 'I haven\'t shipped anything yet';
}

// Path: quiz.q6
class TranslationsQuizQ6En {
	TranslationsQuizQ6En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'what do you do on weekends?'
	String get title => 'what do you do\non weekends?';

	/// en: 'more tutorials and courses'
	String get a => 'more tutorials and courses';

	/// en: 'scroll dev twitter and reddit'
	String get b => 'scroll dev twitter and reddit';

	/// en: 'build side projects and ship them'
	String get c => 'build side projects and ship them';

	/// en: 'same as weekdays, whatever the job asks'
	String get d => 'same as weekdays, whatever the job asks';
}

// Path: result.tierNpc
class TranslationsResultTierNpcEn {
	TranslationsResultTierNpcEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'NPC DEVELOPER'
	String get label => 'NPC DEVELOPER';

	List<String> get messages => [
		'you don\'t write code. you assemble it.',
		'your github is a graveyard of cloned repos.',
		'you\'re one mass layoff away from selling courses.',
		'stack overflow should charge you rent.',
	];
}

// Path: result.tierBorderline
class TranslationsResultTierBorderlineEn {
	TranslationsResultTierBorderlineEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'BORDERLINE'
	String get label => 'BORDERLINE';

	List<String> get messages => [
		'you have potential. but you\'re lazy about it.',
		'one foot in the matrix, one foot out.',
		'you could be dangerous, but you choose comfort.',
		'you know what to do. you just don\'t do it.',
	];
}

// Path: result.tierDangerous
class TranslationsResultTierDangerousEn {
	TranslationsResultTierDangerousEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'DANGEROUS'
	String get label => 'DANGEROUS';

	List<String> get messages => [
		'you actually build things. respect.',
		'you\'re the dev they can\'t replace with AI.',
		'you ship while others watch tutorials.',
		'the matrix has no power over you.',
	];
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'landing.title' => 'are you an npc\ndeveloper?',
			'landing.subtitle' => 'be honest. this might hurt.',
			'landing.startButton' => 'find out',
			'landing.skipButton' => 'i already know',
			'quiz.questionOf' => ({required Object current, required Object total}) => 'question ${current} of ${total}',
			'quiz.nextButton' => 'next',
			'quiz.showResult' => 'show me the truth',
			'quiz.q1.title' => 'when you hit a bug,\nwhat\'s your first move?',
			'quiz.q1.a' => 'copy the error into stackoverflow',
			'quiz.q1.b' => 'paste it into chatgpt and wait',
			'quiz.q1.c' => 'read the stack trace and debug it',
			'quiz.q1.d' => 'console.log everywhere and pray',
			'quiz.q2.title' => 'how do you start\na new project?',
			'quiz.q2.a' => 'find a tutorial and follow it step by step',
			'quiz.q2.b' => 'clone a template or boilerplate',
			'quiz.q2.c' => 'design the architecture, then build',
			'quiz.q2.d' => 'ask AI to generate the whole thing',
			'quiz.q3.title' => 'what\'s your relationship\nwith AI tools?',
			'quiz.q3.a' => 'chatgpt writes most of my code',
			'quiz.q3.b' => 'I use it to learn, but I write my code',
			'quiz.q3.c' => 'copilot autocompletes, I just press tab',
			'quiz.q3.d' => 'I barely use AI tools',
			'quiz.q4.title' => 'how do you learn\nnew technology?',
			'quiz.q4.a' => 'binge a 10-hour youtube course',
			'quiz.q4.b' => 'follow the official docs tutorial',
			'quiz.q4.c' => 'build something real with it immediately',
			'quiz.q4.d' => 'wait until someone makes a tutorial',
			'quiz.q5.title' => 'what happens after\nyou ship a feature?',
			'quiz.q5.a' => 'move to the next ticket immediately',
			'quiz.q5.b' => 'post about it on social media',
			'quiz.q5.c' => 'talk to users and measure impact',
			'quiz.q5.d' => 'I haven\'t shipped anything yet',
			'quiz.q6.title' => 'what do you do\non weekends?',
			'quiz.q6.a' => 'more tutorials and courses',
			'quiz.q6.b' => 'scroll dev twitter and reddit',
			'quiz.q6.c' => 'build side projects and ship them',
			'quiz.q6.d' => 'same as weekdays, whatever the job asks',
			'result.title' => 'you are',
			'result.npcLabel' => 'npc developer',
			'result.scoreFormat' => ({required Object score}) => '${score}% npc',
			'result.tierNpc.label' => 'NPC DEVELOPER',
			'result.tierNpc.messages.0' => 'you don\'t write code. you assemble it.',
			'result.tierNpc.messages.1' => 'your github is a graveyard of cloned repos.',
			'result.tierNpc.messages.2' => 'you\'re one mass layoff away from selling courses.',
			'result.tierNpc.messages.3' => 'stack overflow should charge you rent.',
			'result.tierBorderline.label' => 'BORDERLINE',
			'result.tierBorderline.messages.0' => 'you have potential. but you\'re lazy about it.',
			'result.tierBorderline.messages.1' => 'one foot in the matrix, one foot out.',
			'result.tierBorderline.messages.2' => 'you could be dangerous, but you choose comfort.',
			'result.tierBorderline.messages.3' => 'you know what to do. you just don\'t do it.',
			'result.tierDangerous.label' => 'DANGEROUS',
			'result.tierDangerous.messages.0' => 'you actually build things. respect.',
			'result.tierDangerous.messages.1' => 'you\'re the dev they can\'t replace with AI.',
			'result.tierDangerous.messages.2' => 'you ship while others watch tutorials.',
			'result.tierDangerous.messages.3' => 'the matrix has no power over you.',
			'result.shareButton' => 'share your result',
			'result.retryButton' => 'take again',
			'result.ctaButton' => 'learn to sell yourself better',
			'share.storyText' => ({required Object score}) => 'i\'m ${score}% npc developer',
			'share.storySubtext' => 'are you an npc dev? find out:',
			'share.shareMessage' => ({required Object score}) => 'i\'m ${score}% npc developer. check yours:',
			'share.storyCommand' => '> npc_detector --scan',
			'share.storyBranding' => 'npc developer detector',
			_ => null,
		};
	}
}
