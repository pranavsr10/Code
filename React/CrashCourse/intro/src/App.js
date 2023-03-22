import './App.css';

function App() {
  return (
    <div className="App">
      <Print name="knightfall" desc="Hi there!" />
      <Print name="Darkest Knight" desc={34} />

    </div>
  );
}

const Print = (props) => {
  return (
    <div>
    <h1>{props.name}</h1>
    <h1>{props.desc}</h1>
    </div>
  );
};

export default App;
