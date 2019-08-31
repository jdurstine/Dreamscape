/// @description create and return a variably sized array

var _list = ds_list_create()

for (var i = 0; i < argument_count; i++)
{
	ds_list_set(_list, i, argument[i])
}

return _list