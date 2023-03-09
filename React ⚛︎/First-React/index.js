const image =(
    <div>
        <img src="./src/image.png" alt="image" width="200px" />
    </div>
)

ReactDOM.render(image, document.getElementById('img'));

const heading = (
    <div>
        <h1> Node JS</h1>
    </div>
)

ReactDOM.render(heading, document.getElementById('heading'));

const paragraphs = (
    <div>
        <p> Node.js is a very powerful JavaScript-based platform built on Google Chrome's JavaScript V8 Engine: </p>
        <ul>
            <li>  It is used to develop I/O intensive web applications like video streaming sites, single-page applications, and other web applications.</li>
            <br></br>
            <li> Node.js is open source, completely free, and used by thousands of developers around the world.
</li>
        </ul>
    </div>
)

ReactDOM.render(paragraphs, document.getElementById('paragraph'));