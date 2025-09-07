class Maths
{
    public static func clamp<T: Comparable>(value: T, minimum: T, maximum: T) -> T
    {
        return value < minimum ? minimum : (value > maximum ? maximum : value);
    }
}