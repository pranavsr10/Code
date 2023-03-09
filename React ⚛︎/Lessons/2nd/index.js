function Navbar() {
    return (
        <div>
            <nav>
                <img src="./src/image.png" alt="image" width="200px" />
                <ul>
                    <li>Home |</li>
                    <li>About |</li>
                    <li>Downloads |</li>
                    <li>Docs  |</li>
                    <li>Get Involved  |</li>
                    <li>Security  |</li>
                    <li>Certification  |</li>
                    <li>News  |</li>
                </ul>
                </nav>
        </div>
    )
}



function Everything() {
    return (
        <div>
            <header>
                <Navbar /> 
            </header>
            <h1> Node JS</h1>
            <p> Node.js is a very powerful JavaScript-based platform built on Google Chrome's JavaScript V8 Engine:</p>
            <Olti />
            <Footer />
        </div>
    )
}

function Olti() {
    return (
        <div>
            <ol>
                <li> It is used to develop I/O intensive web applications like video streaming sites, single-page applications, and other web applications.</li>
                <br></br>
                <li> Node.js is open source, completely free, and used by thousands of developers around the world.</li>
            </ol>
        </div>
    )
}

function Footer(){
    return (
        <div>
            <footer>
             <small>© 2023 Knightfall Development , All rights reserved.</small>
            </footer>
        </div>
    )
}

function Favicons() {
    return(
        <div>
            <link rel="icon" href="./src/favicon.png" />
        </div>
    )
}

ReactDOM.render(<Favicons />, document.getElementById('faviconing'));

ReactDOM.render(<Everything />, document.getElementById('main'));