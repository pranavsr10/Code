function list (){
    <div>
        <ul>
            <li> Use the ol tag to create an ordered list. This tag should contain one or more li tags for each item in the list.</li>
            <li> Use the type attribute to specify the numbering style of the list. For example, type="1" will use Arabic numerals (1, 2, 3), while type="A" will use uppercase letters (A, B, C).</li>
        </ul>
    </div>
}

ReactDOM.render(<list />, document.getElementById('main'));