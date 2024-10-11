function encrypt(phrase, key) {
	var encryptedphrase = "";
	var encryptedletter = "";
	var i;
	for (i=0; i<string_length(phrase); i++) {
		encryptedletter = chr(real(phrase[i])+real(key[i%string_length(key)]));
		encryptedphrase += encryptedletter;
	}
	return encryptedphrase;
}

function decrypt(encryptedphrase, key) {
	var phrase = "";
	var decryptedletter = "";
	var i;
	for (i=0; i<string_length(phrase); i++) {
		decryptedletter = chr(real(phrase[i])+real(key[i%string_length(key)]));
		phrase += decryptedletter;
	}
	return phrase;
}

