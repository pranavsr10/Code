<h1>
    Auto Form Validation
</h1>
<p>
    Auto form Validation allows you to validate html form using html dataset attributes instead of writing javascript.
    This plugin depends on <a href="https://github.com/validatorjs/validator.js">validator.js</a> plugin to check the type of the value (email, password, url, base64...)
</p>
<h1>
    Installation
</h1>
<p>
    Include scripts
</p>

```
<script src="validator.min.js"></script>
<script src="form_rules.js"></script>
<script src="auto_form_validation.js"></script>
```
<h1>
    Usage
</h1>
<p>
    Add <code>data-type</code> attributes to specify the rule of the input and <code>data-type-message</code> to show a
    message if the input is not valid.
    To validate the form on submit call the <code>isValidForm("#formId")</code> function
</p>

```
<form id="form">
    <div>
        <label>Optional</label>
        <input type="text">
    </div>
    <div>
        <label>Text</label>
        <input data-type="text" data-type-message="Required" type="text">
    </div>
    <div>
        <label>Email</label>
        <input data-type="email" data-type-message="Email Format" type="text">
    </div>
    <div>
        <label>Password</label>
        <input data-type="password" data-type-message="Password Format" type="password">
    </div>
    <div>
        <label>Number</label>
        <input data-type="number" data-type-message="Number Format" type="text">
    </div>

    <div>
        <label>Select</label>
        <select data-type="text" data-type-message="Select Option">
            <option value=""></option>
            <option value="1">one</option>
        </select>
    </div>
    <div>
        <label>Checkbox</label>
        <input data-type="checkbox" data-type-message="Check Required" type="checkbox">
    </div>

    <div>
        <label>Radio</label>
        <div data-type="radio" data-type-message="Choose Option" style="flex-direction: row;align-items: center;">
            <input type="radio" name="nb" value="one">one
            <input type="radio" name="nb" value="two">two
        </div>

    </div>
    <div>
        <label>File</label>
        <input data-type="text" data-type-message="File required" type="file">
    </div>
    <button id="jsSubmit">submit</button>
</form>

<script>
    document.querySelector("#jsSubmit").addEventListener("click", function (e) {
        e.preventDefault();
        var result = isValidForm("#form");
        alert(result);
    });
</script>
```
<h1>
    Adding new rule
</h1>
<p>
    This plugin contains many rules like <code>email</code> <code>numeric</code> <code>password</code> ..., but if you
    want, you can add more rules in the <code>form_rules.js</code> file.
    Check <a href="https://github.com/validatorjs/validator.js">validator.js</a> for rules as this plugin uses <a href="https://github.com/validatorjs/validator.js">validator.js</a> to check the type of the value.
</p>

```
var formRules = {
...
newRule: function (value) {
return value=="newRule";
}
};
```
<h1>
    Styling
</h1>
<p>
    Invalid input will have attribute <code>data-invalid-input</code> and it's message will have attribute
    <code>data-invalid-message</code>
</p>

```
<style>
    [data-invalid-input] {
        border: 1px solid #f93154;
    }

    [data-invalid-message] {
        color: #f93154;
        font-weight: bold;
        display: block;
        margin-bottom: 10px;
        font-style: italic;
        font-size: 0.8rem;
    }
</style>
```
