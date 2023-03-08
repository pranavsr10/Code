var formRules = {
    text: function (value) {
        return value.trim() != "";
    },
    email: function (value) {
        return validator.isEmail(value);
    },
    number: function (value) {
        return validator.isNumeric(value);
    },
    alpha: function (value) {
        return validator.isAlpha(value);
    },
    password: function (value) {
        return validator.isStrongPassword(value, {
            minLength: 8,
            minLowercase: 1,
            minUppercase: 1,
            minNumbers: 1,
            minSymbols: 1,
            returnScore: false,
            pointsPerUnique: 1,
            pointsPerRepeat: 0.5,
            pointsForContainingLower: 10,
            pointsForContainingUpper: 10,
            pointsForContainingNumber: 10,
            pointsForContainingSymbol: 10
        });
    },
    checkbox: function (value) {
        return value == 1;
    },
    radio: function (value) {
        return value == 1;
    },
    url: function (value) {
        return validator.isURL(value);
    },
    json: function (value) {
        return validator.isJSON(value);
    },
    ip: function (value) {
        return validator.isIP(value);
    },
    date: function (value) {
        return validator.isDate(value);
    },
    base64: function (value) {
        return validator.isBase64(value);
    },
};