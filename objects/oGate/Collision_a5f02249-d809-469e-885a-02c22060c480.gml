/// @description Insert description here
// You can write your code in this editor

if (oPlayer.has_key = true)
{
	if (global.level < 5)
	{
		global.level++
		global.player_health = oPlayer.player_health
		room_goto(rDungeon)
	}
	else
	{
		room_goto(rVictory)
	}
}
else
{
	// trigger the you need the key text/animation
}