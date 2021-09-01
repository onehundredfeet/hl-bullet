/**
* https://github.com/HaxeFoundation/hashlink/wiki/HashLink-native-extension-tutorial
* https://github.com/HaxeFoundation/hashlink/wiki/C-API-Documentation
* ...
* developers: Traista Rafael <traista.rafael@yahoo.com>
*/

#define HL_NAME(n) bullet_##n

#include <hl.h> // Make sure to keep this import order
#include "LinearMath/btVector3.h"

// HashLink only recognizes snake case types
typedef class btVector3 bullet_vector3;

HL_PRIM bullet_vector3 *HL_NAME(new_bullet_vector3)(double x, double y, double z)
{
	bullet_vector3 *hl_instance = (bullet_vector3*)hl_gc_alloc_finalizer(sizeof(bullet_vector3));
	bullet_vector3 instance((btScalar)x, (btScalar)y, (btScalar)z);
	memcpy(hl_instance, &instance, sizeof(bullet_vector3));
	return hl_instance;
}

HL_PRIM double HL_NAME(bullet_vector3_get_x)(bullet_vector3* source)
{
	return (double) source->getX();
}

HL_PRIM double HL_NAME(bullet_vector3_get_y)(bullet_vector3* source)
{
	return (double) source->getY();
}

HL_PRIM double HL_NAME(bullet_vector3_get_z)(bullet_vector3* source)
{
	return (double) source->getZ();
}

HL_PRIM bullet_vector3 *HL_NAME(bullet_vector3_operator_plus)(bullet_vector3* source, bullet_vector3* other)
{
	*source += *other;
	return source;
}

HL_PRIM bullet_vector3 *HL_NAME(bullet_vector3_operator_minus)(bullet_vector3* source, bullet_vector3* other)
{
	*source -= *other;
	return source;
}

HL_PRIM bullet_vector3 *HL_NAME(bullet_vector3_operator_multiply)(bullet_vector3* source, bullet_vector3* other)
{
	*source *= *other;
	return source;
}

HL_PRIM bullet_vector3 *HL_NAME(bullet_vector3_operator_divide)(bullet_vector3* source, double divide)
{
	*source /= (btScalar) divide;
	return source;
}

HL_PRIM double HL_NAME(bullet_vector3_dot)(bullet_vector3* source, bullet_vector3* other)
{
	return (double)source->dot(*other);
}

HL_PRIM double HL_NAME(bullet_vector3_length2)(bullet_vector3* source)
{
	return (double)source->length2();
}

HL_PRIM double HL_NAME(bullet_vector3_length)(bullet_vector3* source)
{
	return (double)source->length();
}

HL_PRIM double HL_NAME(bullet_vector3_norm)(bullet_vector3* source)
{
	return (double)source->norm();
}

HL_PRIM double HL_NAME(bullet_vector3_safe_norm)(bullet_vector3* source)
{
	return (double)source->safeNorm();
}

HL_PRIM double HL_NAME(bullet_vector3_distance2)(bullet_vector3* source, bullet_vector3* other)
{
	return (double)source->distance2(*other);
}

HL_PRIM double HL_NAME(bullet_vector3_distance)(bullet_vector3* source, bullet_vector3* other)
{
	return (double)source->distance(*other);
}

HL_PRIM bullet_vector3 *HL_NAME(bullet_vector3_safe_normalize)(bullet_vector3* source)
{
	return &source->safeNormalize();

}

HL_PRIM bullet_vector3 *HL_NAME(bullet_vector3_normalize)(bullet_vector3* source)
{
	return &source->normalize();
}

HL_PRIM bullet_vector3 *HL_NAME(bullet_vector3_normalized)(bullet_vector3* source)
{
	bullet_vector3 ref = source->normalized();
	bullet_vector3 *hl_instance = (bullet_vector3*)hl_gc_alloc_finalizer(sizeof(bullet_vector3));
	memcpy(hl_instance, &ref, sizeof(bullet_vector3));
	return hl_instance;
}

HL_PRIM bullet_vector3 *HL_NAME(bullet_vector3_rotate)(bullet_vector3* source, bullet_vector3* axis, double angle)
{
	bullet_vector3 ref = source->rotate(*axis, (btScalar)angle);
	bullet_vector3 *hl_instance = (bullet_vector3*)hl_gc_alloc_finalizer(sizeof(bullet_vector3));
	memcpy(hl_instance, &ref, sizeof(bullet_vector3));
	return hl_instance;
}

#define _BULLET_VECTOR3 _ABSTRACT( bullet_vector3 )

DEFINE_PRIM(_BULLET_VECTOR3, new_bullet_vector3, _F64 _F64 _F64);
DEFINE_PRIM(_F64, bullet_vector3_get_x, _BULLET_VECTOR3);
DEFINE_PRIM(_F64, bullet_vector3_get_y, _BULLET_VECTOR3);
DEFINE_PRIM(_F64, bullet_vector3_get_z, _BULLET_VECTOR3);
DEFINE_PRIM(_BULLET_VECTOR3, bullet_vector3_operator_plus, _BULLET_VECTOR3 _BULLET_VECTOR3);
DEFINE_PRIM(_BULLET_VECTOR3, bullet_vector3_operator_minus, _BULLET_VECTOR3 _BULLET_VECTOR3);
DEFINE_PRIM(_BULLET_VECTOR3, bullet_vector3_operator_multiply, _BULLET_VECTOR3 _BULLET_VECTOR3);
DEFINE_PRIM(_BULLET_VECTOR3, bullet_vector3_operator_divide, _BULLET_VECTOR3 _F64);
DEFINE_PRIM(_F64, bullet_vector3_dot, _BULLET_VECTOR3 _BULLET_VECTOR3);
DEFINE_PRIM(_F64, bullet_vector3_length2, _BULLET_VECTOR3);
DEFINE_PRIM(_F64, bullet_vector3_length, _BULLET_VECTOR3);
DEFINE_PRIM(_F64, bullet_vector3_norm, _BULLET_VECTOR3);
DEFINE_PRIM(_F64, bullet_vector3_safe_norm, _BULLET_VECTOR3);
DEFINE_PRIM(_F64, bullet_vector3_distance2, _BULLET_VECTOR3 _BULLET_VECTOR3);
DEFINE_PRIM(_F64, bullet_vector3_distance, _BULLET_VECTOR3 _BULLET_VECTOR3);
DEFINE_PRIM(_BULLET_VECTOR3, bullet_vector3_safe_normalize, _BULLET_VECTOR3);
DEFINE_PRIM(_BULLET_VECTOR3, bullet_vector3_normalize, _BULLET_VECTOR3);
DEFINE_PRIM(_BULLET_VECTOR3, bullet_vector3_normalized, _BULLET_VECTOR3);
DEFINE_PRIM(_BULLET_VECTOR3, bullet_vector3_rotate, _BULLET_VECTOR3 _BULLET_VECTOR3 _F64);

#pragma once
