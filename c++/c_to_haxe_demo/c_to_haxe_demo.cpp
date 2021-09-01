#define HL_NAME(n) simplex_##n

#include <hl.h>

#include "b3Int2.h"

//typedef struct _result hlext_result;

struct hlext_result {
	vbyte *greeting;
	int age;
};

struct hltext_class {
	
public:

	int a = 0;
	int b = 0;

	hltext_class(int _a, int _b) {
		a = _a;
		b = _b;
	};

	int getSum() {
		return a + b;
	}
};

//struct hltext_class {
//	int a = 0;
//	int b = 0; 
//};

HL_PRIM int HL_NAME(get_class_sum)(hltext_class* instance) {
	return instance->getSum();
}

HL_PRIM hltext_class *HL_NAME(request_class)(int _a, int _b) 
{
	hltext_class *instance = (hltext_class*)hl_gc_alloc_finalizer(sizeof(hltext_class));
	instance->a = _a;
	instance->b = _b;
	return instance;
}


HL_PRIM hlext_result *HL_NAME(request_result)(vbyte* name, int birthYear, int currentYear) {

	hlext_result *cr = (hlext_result*)hl_gc_alloc_finalizer(sizeof(hlext_result));

	hl_buffer *b = hl_alloc_buffer();
	hl_buffer_str(b, USTR("Egun on, "));
	hl_buffer_str(b, (uchar*)name);
	hl_buffer_str(b, USTR("!"));

	cr->greeting = (vbyte*)hl_buffer_content(b, NULL);
	cr->age = currentYear - birthYear;

	return cr;
}

HL_PRIM vdynamic *HL_NAME(get_haxe_object)(vbyte* name, int birthYear, int currentYear) {
	hlext_result *cr = HL_NAME(request_result)(name, birthYear, currentYear);

	// allocate new dynamic object
	vdynamic *obj = (vdynamic*)hl_alloc_dynobj();
	// set field called "age" of 'obj' object of type 'int' with the cr->age value
	// hl_hash_gen(hl_to_utf16("age"), true): get the numeric represenation of the field name
	hl_dyn_seti(obj, hl_hash_gen(hl_to_utf16("age"), true), &hlt_i32, cr->age);

	// set field called "name" of 'obj' object of type 'vbyte' with the cr->name value
	// hl_hash_gen(hl_to_utf16("greeting"), true): get the numeric represenation of the field name
	hl_dyn_setp(obj, hl_hash_gen(hl_to_utf16("greeting"), true), &hlt_bytes, cr->greeting);

	return obj;
}

HL_PRIM vbyte *HL_NAME(result_greeting)(hlext_result* cr) {
	return cr->greeting;
}

HL_PRIM int HL_NAME(result_age)(hlext_result* cr) {
	return cr->age;
}


HL_PRIM vbyte* HL_NAME(generate)(int width, int height, int seed)
{
	vbyte* buffer = hl_alloc_bytes(width * height);

	return buffer;
}


HL_PRIM float HL_NAME(multiply)(float width, float height)
{
	float temp = 200;
	temp += width;
	return temp;
}

HL_PRIM vdynamic* HL_NAME(b3MakeInt2_h)(int x, int y)
{
	b3Int2 b3Val = b3MakeInt2(x, y);

	vdynamic* obj = (vdynamic*) hl_alloc_dynobj();   
	hl_dyn_seti(obj, hl_hash_utf8("x"), &hlt_i32, b3Val.x);
	hl_dyn_seti(obj, hl_hash_utf8("y"), &hlt_i32, b3Val.y);
	return obj;
}

#define _RESULT _ABSTRACT( hlext_result )
#define _RESULT_CLASS _ABSTRACT( hlext_class )

DEFINE_PRIM(_BYTES, generate, _I32 _I32 _I32);
DEFINE_PRIM(_F32, multiply, _F32 _F32);
DEFINE_PRIM(_DYN, b3MakeInt2_h, _I32 _I32);

DEFINE_PRIM(_RESULT, request_result, _BYTES _I32 _I32);
DEFINE_PRIM(_DYN, get_haxe_object, _BYTES _I32 _I32);
DEFINE_PRIM(_BYTES, result_greeting, _RESULT);
DEFINE_PRIM(_I32, result_age, _RESULT);

DEFINE_PRIM(_RESULT_CLASS, request_class, _I32 _I32);
DEFINE_PRIM(_I32, get_class_sum, _RESULT_CLASS);
