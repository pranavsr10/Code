ReactDOM.render(<ul> <li> HI</li> <li> Hello </li> <li> I am </li> </ul>, document.getElementById('root'));


function Content(){
    return( 
        <div>
        <h1> This is the main content</h1>
        </div>
    )
    }

    ReactDOM.render(<Content />, document.getElementById('main'));
ReactDOM.render(<div><h1 className="header"> This is JSK</h1></div>, document.getElementById('main'));
