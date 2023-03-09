// ReactDOM.render(<ul> <li> HI</li> <li> Hello </li> <li> I am </li> </ul>, document.getElementById('root'));


// function Content(){
//     return( 
//         <div>
//         <h1> This is the main content</h1>
//         </div>
//     )
//     }

//     ReactDOM.render(<Content />, document.getElementById('main'));
// ReactDOM.render(<div><h1 className="header"> This is JSK</h1></div>, document.getElementById('main'));


// const me = <div>
//     <h1> Hello</h1>
//     <h2> This is from a constant variable</h2>
// </div>

// ReactDOM.render(me, document.getElementById('route'));
// console.log(me);

// const navbar = (
//     <nav>
//         <h1> Hello</h1>
//         <ul>
//             <li> Contact</li>
//             <li> About us</li>
//             <li> Downloads</li>
//         </ul>
//     </nav>
// )

// ReactDOM.render(navbar, document.getElementById('navbar'));

const withappend = (
    <div> 
        <h1> Hello</h1>
    </div>
)

document.getElementById('root').append(JSON.stringify(withappend));