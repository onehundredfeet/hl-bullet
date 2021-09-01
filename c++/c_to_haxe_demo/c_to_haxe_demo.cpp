#define HL_NAME(n) simplex_##n

#include <hl.h>

//#include "BulletDynamics/Dynamics/btRigidBody.h"
#include "LinearMath/btVector3.h"

typedef class btVector3 bullet;

//class bullet {
//
//public:
//
//	double a = 0;
//	double b = 0;
//
//	bullet(double _a, double _b) {
//		a = _a;
//		b = _b;
//	};
//
//	double getSum() {
//		return a + b;
//	}
//};


//int getNumber() {
//	return
//}

class hlext_class {
	
public:

	int a = 0;
	int b = 0;

	hlext_class(int _a, int _b) {
		a = _a;
		b = _b;
	};

	int getSum() {
		return a + b;
	}
};



HL_PRIM hlext_class *HL_NAME(request_class)(int _a, int _b) 
{
	hlext_class *instance = (hlext_class*)hl_gc_alloc_finalizer(sizeof(hlext_class));
	instance->a = _a;
	instance->b = _b;
	return instance;
}

HL_PRIM int HL_NAME(get_class_sum)(hlext_class* instance) {
	return instance->getSum();
}



HL_PRIM bullet *HL_NAME(request_bullet)(double _a, double _b, double _c)
{
	bullet *instance = (bullet*)hl_gc_alloc_finalizer(sizeof(bullet));
	bullet rawInstance(_a, _b, _c);
	memcpy(instance, &rawInstance, sizeof(bullet));
	return instance;
}

HL_PRIM double HL_NAME(get_bullet_sum)(bullet* instance) {
	return instance->getX();
}

HL_PRIM bullet *HL_NAME(bullet_operator_plus)(bullet* source, bullet* other)
{
    *source += *other;
    return source;
}

//
//HL_PRIM bullet_vector *HL_NAME(request_bullet_vector)(float a, float b, float c)
//{
//	bullet_vector *instance = (bullet_vector*)hl_gc_alloc_finalizer(sizeof(bullet_vector));
//	instance->a = a;
//	instance->b = b;
//	instance->c = c;
//	return instance;
//	/*hlext_bullet_vector raw(1, 2, 3);
//	memcpy(instance, &raw, sizeof(hlext_bullet_vector));*/
//}
//
//HL_PRIM int HL_NAME(vector_valuex)(bullet_vector *source){
//	return 100;
//}

//HL_PRIM hlext_bullet_vector *HL_NAME(request_bullet_vector_operator_plus)(hlext_bullet_vector* source, hlext_bullet_vector* other)
//{
//	*source += *other;
//	return source;
//}

#define _RESULT_CLASS _ABSTRACT( hlext_class )
#define _BULLET _ABSTRACT( bullet )
//#define _BULLET_VECTOR _ABSTRACT( bullet_vector )

DEFINE_PRIM(_RESULT_CLASS, request_class, _I32 _I32);
DEFINE_PRIM(_I32, get_class_sum, _RESULT_CLASS);

DEFINE_PRIM(_BULLET, request_bullet, _F64 _F64 _F64);
DEFINE_PRIM(_F64, get_bullet_sum, _BULLET);
DEFINE_PRIM(_BULLET, bullet_operator_plus, _BULLET _BULLET);

//DEFINE_PRIM(_BULLET_VECTOR, request_bullet_vector, _F32 _F32 _F32);
//DEFINE_PRIM(_I32, vector_valuex, _BULLET_VECTOR);
//
