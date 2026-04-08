///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEs with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsLandingEs landing = _TranslationsLandingEs._(_root);
	@override late final _TranslationsQuizEs quiz = _TranslationsQuizEs._(_root);
	@override late final _TranslationsResultEs result = _TranslationsResultEs._(_root);
	@override late final _TranslationsShareEs share = _TranslationsShareEs._(_root);
}

// Path: landing
class _TranslationsLandingEs implements TranslationsLandingEn {
	_TranslationsLandingEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'eres un developer\nnpc?';
	@override String get subtitle => 'se honesto. esto puede doler.';
	@override String get startButton => 'descubrir';
	@override String get skipButton => 'ya lo se';
}

// Path: quiz
class _TranslationsQuizEs implements TranslationsQuizEn {
	_TranslationsQuizEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String questionOf({required Object current, required Object total}) => 'pregunta ${current} de ${total}';
	@override String get nextButton => 'siguiente';
	@override String get showResult => 'muestrame la verdad';
	@override late final _TranslationsQuizQ1Es q1 = _TranslationsQuizQ1Es._(_root);
	@override late final _TranslationsQuizQ2Es q2 = _TranslationsQuizQ2Es._(_root);
	@override late final _TranslationsQuizQ3Es q3 = _TranslationsQuizQ3Es._(_root);
	@override late final _TranslationsQuizQ4Es q4 = _TranslationsQuizQ4Es._(_root);
	@override late final _TranslationsQuizQ5Es q5 = _TranslationsQuizQ5Es._(_root);
	@override late final _TranslationsQuizQ6Es q6 = _TranslationsQuizQ6Es._(_root);
}

// Path: result
class _TranslationsResultEs implements TranslationsResultEn {
	_TranslationsResultEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'eres';
	@override String get npcLabel => 'developer npc';
	@override String scoreFormat({required Object score}) => '${score}% npc';
	@override late final _TranslationsResultTierNpcEs tierNpc = _TranslationsResultTierNpcEs._(_root);
	@override late final _TranslationsResultTierBorderlineEs tierBorderline = _TranslationsResultTierBorderlineEs._(_root);
	@override late final _TranslationsResultTierDangerousEs tierDangerous = _TranslationsResultTierDangerousEs._(_root);
	@override String get shareButton => 'compartir resultado';
	@override String get retryButton => 'intentar de nuevo';
	@override String get ctaButton => 'conviertete en 6-figure engineer';
	@override String get ctaSubtitle => 'deja de ser un NPC';
}

// Path: share
class _TranslationsShareEs implements TranslationsShareEn {
	_TranslationsShareEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String storyText({required Object score}) => 'soy ${score}% developer npc';
	@override String get storySubtext => 'eres un dev npc? descubrelo:';
	@override String shareMessage({required Object score}) => 'soy ${score}% developer npc. descubre el tuyo:';
}

// Path: quiz.q1
class _TranslationsQuizQ1Es implements TranslationsQuizQ1En {
	_TranslationsQuizQ1Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'cuando tienes un bug,\nque es lo primero que haces?';
	@override String get a => 'copiar el error en stackoverflow';
	@override String get b => 'pegarlo en chatgpt y esperar';
	@override String get c => 'leer el stack trace y debuguear';
	@override String get d => 'console.log por todos lados y rezar';
}

// Path: quiz.q2
class _TranslationsQuizQ2Es implements TranslationsQuizQ2En {
	_TranslationsQuizQ2Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'como empiezas\nun proyecto nuevo?';
	@override String get a => 'buscar un tutorial y seguirlo paso a paso';
	@override String get b => 'clonar un template o boilerplate';
	@override String get c => 'disenar la arquitectura y construir';
	@override String get d => 'pedirle a la AI que genere todo';
}

// Path: quiz.q3
class _TranslationsQuizQ3Es implements TranslationsQuizQ3En {
	_TranslationsQuizQ3Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'cual es tu relacion\ncon herramientas de AI?';
	@override String get a => 'chatgpt escribe la mayoria de mi codigo';
	@override String get b => 'la uso para aprender, pero yo escribo mi codigo';
	@override String get c => 'copilot autocompleta, yo solo presiono tab';
	@override String get d => 'casi no uso herramientas de AI';
}

// Path: quiz.q4
class _TranslationsQuizQ4Es implements TranslationsQuizQ4En {
	_TranslationsQuizQ4Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'como aprendes\ntecnologia nueva?';
	@override String get a => 'maratonear un curso de 10 horas en youtube';
	@override String get b => 'seguir el tutorial de la documentacion oficial';
	@override String get c => 'construir algo real con ella de inmediato';
	@override String get d => 'esperar a que alguien haga un tutorial';
}

// Path: quiz.q5
class _TranslationsQuizQ5Es implements TranslationsQuizQ5En {
	_TranslationsQuizQ5Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'que pasa despues de\nque shipeas una feature?';
	@override String get a => 'paso al siguiente ticket inmediatamente';
	@override String get b => 'posteo sobre ello en redes sociales';
	@override String get c => 'hablo con usuarios y mido el impacto';
	@override String get d => 'no he shipeado nada todavia';
}

// Path: quiz.q6
class _TranslationsQuizQ6Es implements TranslationsQuizQ6En {
	_TranslationsQuizQ6Es._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'que haces los\nfines de semana?';
	@override String get a => 'mas tutoriales y cursos';
	@override String get b => 'scrollear twitter y reddit de devs';
	@override String get c => 'construir side projects y shipearlos';
	@override String get d => 'lo mismo que entre semana, lo que pida el trabajo';
}

// Path: result.tierNpc
class _TranslationsResultTierNpcEs implements TranslationsResultTierNpcEn {
	_TranslationsResultTierNpcEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'DEVELOPER NPC';
	@override List<String> get messages => [
		'no escribes codigo. lo ensamblas.',
		'tu github es un cementerio de repos clonados.',
		'estas a un layoff de vender cursos.',
		'stackoverflow deberia cobrarte renta.',
	];
}

// Path: result.tierBorderline
class _TranslationsResultTierBorderlineEs implements TranslationsResultTierBorderlineEn {
	_TranslationsResultTierBorderlineEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'EN LA LINEA';
	@override List<String> get messages => [
		'tienes potencial. pero te da flojera usarlo.',
		'un pie en el matrix, otro afuera.',
		'podrias ser peligroso, pero eliges la comodidad.',
		'sabes que hacer. simplemente no lo haces.',
	];
}

// Path: result.tierDangerous
class _TranslationsResultTierDangerousEs implements TranslationsResultTierDangerousEn {
	_TranslationsResultTierDangerousEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'PELIGROSO';
	@override List<String> get messages => [
		'realmente construyes cosas. respeto.',
		'eres el dev que no pueden reemplazar con AI.',
		'tu shipeas mientras otros ven tutoriales.',
		'el matrix no tiene poder sobre ti.',
	];
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'landing.title' => 'eres un developer\nnpc?',
			'landing.subtitle' => 'se honesto. esto puede doler.',
			'landing.startButton' => 'descubrir',
			'landing.skipButton' => 'ya lo se',
			'quiz.questionOf' => ({required Object current, required Object total}) => 'pregunta ${current} de ${total}',
			'quiz.nextButton' => 'siguiente',
			'quiz.showResult' => 'muestrame la verdad',
			'quiz.q1.title' => 'cuando tienes un bug,\nque es lo primero que haces?',
			'quiz.q1.a' => 'copiar el error en stackoverflow',
			'quiz.q1.b' => 'pegarlo en chatgpt y esperar',
			'quiz.q1.c' => 'leer el stack trace y debuguear',
			'quiz.q1.d' => 'console.log por todos lados y rezar',
			'quiz.q2.title' => 'como empiezas\nun proyecto nuevo?',
			'quiz.q2.a' => 'buscar un tutorial y seguirlo paso a paso',
			'quiz.q2.b' => 'clonar un template o boilerplate',
			'quiz.q2.c' => 'disenar la arquitectura y construir',
			'quiz.q2.d' => 'pedirle a la AI que genere todo',
			'quiz.q3.title' => 'cual es tu relacion\ncon herramientas de AI?',
			'quiz.q3.a' => 'chatgpt escribe la mayoria de mi codigo',
			'quiz.q3.b' => 'la uso para aprender, pero yo escribo mi codigo',
			'quiz.q3.c' => 'copilot autocompleta, yo solo presiono tab',
			'quiz.q3.d' => 'casi no uso herramientas de AI',
			'quiz.q4.title' => 'como aprendes\ntecnologia nueva?',
			'quiz.q4.a' => 'maratonear un curso de 10 horas en youtube',
			'quiz.q4.b' => 'seguir el tutorial de la documentacion oficial',
			'quiz.q4.c' => 'construir algo real con ella de inmediato',
			'quiz.q4.d' => 'esperar a que alguien haga un tutorial',
			'quiz.q5.title' => 'que pasa despues de\nque shipeas una feature?',
			'quiz.q5.a' => 'paso al siguiente ticket inmediatamente',
			'quiz.q5.b' => 'posteo sobre ello en redes sociales',
			'quiz.q5.c' => 'hablo con usuarios y mido el impacto',
			'quiz.q5.d' => 'no he shipeado nada todavia',
			'quiz.q6.title' => 'que haces los\nfines de semana?',
			'quiz.q6.a' => 'mas tutoriales y cursos',
			'quiz.q6.b' => 'scrollear twitter y reddit de devs',
			'quiz.q6.c' => 'construir side projects y shipearlos',
			'quiz.q6.d' => 'lo mismo que entre semana, lo que pida el trabajo',
			'result.title' => 'eres',
			'result.npcLabel' => 'developer npc',
			'result.scoreFormat' => ({required Object score}) => '${score}% npc',
			'result.tierNpc.label' => 'DEVELOPER NPC',
			'result.tierNpc.messages.0' => 'no escribes codigo. lo ensamblas.',
			'result.tierNpc.messages.1' => 'tu github es un cementerio de repos clonados.',
			'result.tierNpc.messages.2' => 'estas a un layoff de vender cursos.',
			'result.tierNpc.messages.3' => 'stackoverflow deberia cobrarte renta.',
			'result.tierBorderline.label' => 'EN LA LINEA',
			'result.tierBorderline.messages.0' => 'tienes potencial. pero te da flojera usarlo.',
			'result.tierBorderline.messages.1' => 'un pie en el matrix, otro afuera.',
			'result.tierBorderline.messages.2' => 'podrias ser peligroso, pero eliges la comodidad.',
			'result.tierBorderline.messages.3' => 'sabes que hacer. simplemente no lo haces.',
			'result.tierDangerous.label' => 'PELIGROSO',
			'result.tierDangerous.messages.0' => 'realmente construyes cosas. respeto.',
			'result.tierDangerous.messages.1' => 'eres el dev que no pueden reemplazar con AI.',
			'result.tierDangerous.messages.2' => 'tu shipeas mientras otros ven tutoriales.',
			'result.tierDangerous.messages.3' => 'el matrix no tiene poder sobre ti.',
			'result.shareButton' => 'compartir resultado',
			'result.retryButton' => 'intentar de nuevo',
			'result.ctaButton' => 'conviertete en 6-figure engineer',
			'result.ctaSubtitle' => 'deja de ser un NPC',
			'share.storyText' => ({required Object score}) => 'soy ${score}% developer npc',
			'share.storySubtext' => 'eres un dev npc? descubrelo:',
			'share.shareMessage' => ({required Object score}) => 'soy ${score}% developer npc. descubre el tuyo:',
			_ => null,
		};
	}
}
