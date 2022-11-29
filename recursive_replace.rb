class RecursiveReplace
    def initialize(input)
        @result = input
    end

    def replace(**params)
        replace_params_in_object(@result, params)
    end

    private

    def replace_params_in_object(object, params)
        object.each do |key, value|
            object[key] = replace_value(value, params)
        end
        object
    end

    def replace_params_in_array(object, params)
        object.map { |value| replace_value(value, params) }
    end

    def replace_value(value, params)
        return value % params if value.instance_of?(String)

        return replace_params_in_object(value, params) if value.instance_of?(Hash)

        return replace_params_in_array(value, params) if value.instance_of?(Array)

        value
    end
end
