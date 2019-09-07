/// @function generator_character_lookup(character);
/// @description Returns an object, or undefined, based on the character passed in
/// @param {string} The character to check for
/// @return {real} An object index or _undefined_

switch (argument0) {
    case ("0"):
        return oDungeon_Bar_0		
    case ("1"):
        return oDungeon_Bar_1
    case ("2"):
        return oDungeon_L_2
    case ("3"):
        return oDungeon_L_3
    case ("4"):
        return oDungeon_L_4
    case ("5"):
        return oDungeon_L_5
    case ("6"):
        return oDungeon_U_6
    case ("7"):
        return oDungeon_U_7
    case ("8"):
        return oDungeon_U_8
    case ("9"):
        return oDungeon_U_9
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