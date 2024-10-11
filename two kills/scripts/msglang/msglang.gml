function msglang(english, japanese=[txt()], language=global.lang) {
	return array_insert_array_parse(argument[language-1]);
	/*switch language {
		case LANGUAGE.ENGLISH:
			return array_insert_array_parse(english);
			break;
		case LANGUAGE.JAPANESE:
			return array_insert_array_parse(japanese);
			break;
		default:
			return [txt()];
			break;
	}*/
}
global.lang = LANGUAGE.ENGLISH;

enum LANGUAGE {
	NULL,
	ENGLISH,
	JAPANESE,
}