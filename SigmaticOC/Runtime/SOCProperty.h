#import <Foundation/Foundation.h>


/**
 Basic property type. Primitive, Object, Selector ... etc.
 */
typedef NS_ENUM(NSInteger, SOCPropertyType) {
    SOCPropertyTypePrimitive,
    SOCPropertyTypeStruct,
    SOCPropertyTypeSelector,
    SOCPropertyTypeClass,
    SOCPropertyTypeFunction,
    SOCPropertyTypeObject
};


/**
 Primitive types. Int, Double, Float, etc.
 */
typedef NS_ENUM(NSInteger, SOCPrimitiveType) {
    SOCPrimitiveTypeUnknown,
    SOCPrimitiveTypeChar,
    SOCPrimitiveTypeUChar,
    SOCPrimitiveTypeBool,
    SOCPrimitiveTypeInt,
    SOCPrimitiveTypeUInt,
    SOCPrimitiveTypeLong,
    SOCPrimitiveTypeULong,
    SOCPrimitiveTypeLongLong,
    SOCPrimitiveTypeULongLong,
    SOCPrimitiveTypeDouble,
    SOCPrimitiveTypeFloat,
    SOCPrimitiveTypeShort,
    SOCPrimitiveTypeUShort
};

/**
 The `SOCProperty` class provides a definition for a class property.
 */
@interface SOCProperty : NSObject



///------------------------------------
/// @name Properties
///------------------------------------

/**
 The property type.
 */
@property(nonatomic) SOCPropertyType propertyType;

/**
 The property name as defined after @property ObjectClass *nameOfProperty.
 */
@property(nonatomic) NSString *name;

/**
 The property class if the property type is Object.
 */
@property(nonatomic) Class objectClass;

/**
 The property primitive type if the property type is Primitive.
 */
@property(nonatomic) SOCPrimitiveType primitiveType;

/**
 The property struct type name if the property type is Struct.
 */
@property(nonatomic) NSString *structName;

/**
 The struct definition, an array of Primitive types.
 */
@property(nonatomic) NSArray *structDefinition;

/**
 The list of protocols required by the property in <> tags.
 */
@property(nonatomic) NSArray *protocols;

/**
 If the property is @property(readOnly).
 */
@property(nonatomic) BOOL isReadOnly;

/**
 If the property is @property(copy).
 */
@property(nonatomic) BOOL isCopying;

/**
 If the property is @property(nonatomic).
 */
@property(nonatomic) BOOL isNonatomic;

/**
 If the property is @property(weak).
 */
@property(nonatomic) BOOL isWeak;

/**
 The property iVar name as defined in @synthesize.
 */
@property(nonatomic) NSString *iVarName;

/**
 The property custom getter if any.
 */
@property(nonatomic) NSString *customGetter;

/**
 The property actual getter Selector. Taking into account the default getter or the custom getter.
 */
@property(nonatomic, readonly) SEL getter;

/**
 The property custom setter if any.
 */
@property(nonatomic) NSString *customSetter;

/**
 The property actual setter Selector. Taking into account the default setter or the custom setter.
 */
@property(nonatomic, readonly) SEL setter;

/**
 Which class the property originated from.
 */
@property(nonatomic) Class sourceClass;



///------------------------------------
/// @name Value Get Set
///------------------------------------

/**
 Set a value to an object based on this property.

 @param newValue The new value to set.
 @param object The value receiver.
 @return Whether the value was set.
 */
- (BOOL)setValueTo:(id)newValue onObject:(id)object;

/**
 Get the current value from an object based on this property.

 @param object The value producer.
 @return The value.
 */
- (id)getValueFrom:(id)object;

@end