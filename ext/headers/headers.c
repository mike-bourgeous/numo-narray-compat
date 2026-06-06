/*
 * Do-nothing extension to help numo-narray-compat copy headers from
 * numo-narray-alt for numo-narray compatibility.
 */
#include <ruby.h>

void Init_headers(void)
{
	VALUE numo = rb_define_module("Numo");
	VALUE narray = rb_define_class_under(numo, "NArray", rb_cObject);
	VALUE compat = rb_define_module_under(narray, "Compat");

	rb_define_module_under(compat, "Headers");
}
