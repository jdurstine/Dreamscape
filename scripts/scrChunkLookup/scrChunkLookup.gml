/// @function generator_character_lookup(character);
/// @description Returns an object, or undefined, based on the character passed in
/// @param {string} The character to check for
/// @return {real} An object index or _undefined_

switch (argument0) {
    case ("X"):
        return oTerrainImp_Rocks;
    case ("."):
		if (random(1) > 0.95)
		{
			return oEnemyBlob
		}
		else
		{
			return undefined
		}
    // no case matches
    default:
        return undefined
}