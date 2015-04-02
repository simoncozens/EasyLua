

my_object = ObjCTest("alloc")("init")


function SetTestValue(val)
    ObjCTest("setLastTestState:", val)
end


function TestGettingBool()
    local val = ObjCTest("returnBoolValue:", true)
    if val == false then
        SetTestValue(false)
        return
    end

    val = ObjCTest("returnBoolValue:", false)
    if val == true then
        SetTestValue(false)
        return
    end

    local val = ObjCTest("returnBoolValueAsNSNumber:", true)
    if val == false then
        SetTestValue(false)
        return
    end

    val = ObjCTest("returnBoolValueAsNSNumber:", false)
    if val == true then
        SetTestValue(false)
        return
    end

    SetTestValue(true)
end

function TestBoolTypes()

    local val = ObjCTest("returnBoolValue:", true)
    if type(val) ~= 'boolean' then
        print('failed bool type')
        print(type(val))
        SetTestValue(false)
        return
    end

    val = ObjCTest("returnBoolValueAsNSNumber:", true)
    if type(val) ~= 'boolean' then
        print('failed NSNumebr type')
        print(type(val))
        SetTestValue(false)
        return
    end
    print('success')
    SetTestValue(true)
end


function TestStrings()
    local val = ObjCTest("returnStringValue:", "TestString")
    if val ~= "TestString" then
        print('failed string')
        print(type(val))
        print(val)
        SetTestValue(false)
        return
    end

    SetTestValue(true)
end


function TestVoidFunction(in_string, in_number, in_bool)

end

function TestNumberFunction(in_string, in_number, in_bool)
    return in_number
end

function TestBoolFunction(in_string, in_number, in_bool)
    return in_bool
end

function TestStringFunction(in_string, in_number, in_bool)
    return in_string
end

