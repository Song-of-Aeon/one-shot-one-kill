/**
 * Function brass monkey
 * @param {id.instance<isaac>} [target]=global.me that funky monkey
 * @param {array} [exclude]=[] local input struct references
 * @return {none}
 */
function c_inputnull(target=global.me, exclude=[]) {
	var i;
	var inputs = variable_struct_get_names(global.inputs);	
	iterate inputs to {
		if !array_contains(exclude, global.inputs[$inputs[i]]) {
			set_value(target, inputs[i], global.inputs.null);
		}
	}
}