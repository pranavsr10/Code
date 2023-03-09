function Navbar() {
    return (
        <div>
            <nav>
                {/* <img src="./src/image.png" alt="image" width="200px" /> */}
                <a className="logo"><i class='bx bxl-nodejs'></i><span>Node JS</span></a>
                <ul className="navbar">
                    <li>Home</li>
                    <li></li>
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
            <ul className="nav-items">
                <li> It is used to develop I/O intensive web applications like video streaming sites, single-page applications, and other web applications.</li>
                <br></br>
                <li> Node.js is open source, completely free, and used by thousands of developers around the world.</li>
            </ul>
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
            <meta charset="utf-8" />
            <title>Node JS</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            {/* <link rel="icon" href="./src/favicon.png" /> */}
        </div>
    )
}

ReactDOM.render(<Favicons />, document.getElementById('faviconing'));

ReactDOM.render(<Everything />, document.getElementById('main'));