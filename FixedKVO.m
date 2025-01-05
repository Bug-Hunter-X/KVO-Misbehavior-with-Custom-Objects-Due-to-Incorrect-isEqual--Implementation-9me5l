To fix this, you need to correctly override the `isEqual:` method in your custom class.  This method should compare all relevant properties of the object. Here's an example:

```objectivec
#import "MyCustomObject.h"

@implementation MyCustomObject

- (BOOL)isEqual:(id)object {
    if (self == object) return YES;
    if (![object isKindOfClass:[MyCustomObject class]]) return NO;
    MyCustomObject *other = (MyCustomObject *)object;
    return [self.property1 isEqual:other.property1] && [self.property2 isEqual:other.property2]; //Compare all relevant properties
}

- (NSUInteger)hash {
    return [self.property1 hash] ^ [self.property2 hash]; // Update hash based on compared properties
}

@end
```

Remember to also implement `hash` correctly to maintain consistency with `isEqual:`.