/// @description Initialize the object

move_speed = 32
aggroed = false

oHealth = noone
drop_list = noone // array of item ids
drop_chance = noone // chance that the monster drops anything

scrCreateTurn(id, -1)

event_user(0) // define any child specific variables here

// oHealth should be a number greater than 0
if (!is_real(oHealth) or oHealth <= 0)
{
	show_error("oHealth not set properly.", true)
}

// drop_list should be an array (of numbers)
if (typeof(drop_list) != "array")
{
	show_error("drop_list not set properly.", true)
}

// drop_chance should be a real number between (inclusive) 0 and 100.
if (!is_real(drop_chance) or drop_chance < 0 or drop_chance > 100)
{
	show_error("drop_chance not properly set.", true)
}
