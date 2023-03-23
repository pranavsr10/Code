import styles from './App.module.css';


function App() {
  const age = 23;
  const isGreen = false;
  const Condo = true;
  // return <div className={styles.App}>{age >= 0 ? <h1>Valid age</h1> : <h1>Invalid age</h1> }</div>;
  return <div className={styles.App}>
    {age >= 0 ? <h1>Valid Age</h1> : <h1>Invalid Age</h1>}
    <h1 style={{ color: isGreen ? "green" : "red" }}>Hello</h1>
    <h1 style={{color: Condo ? "purple" : "black" }}>Hi</h1>
    {Condo && <button>Hello </button>}
    </div>
  // return (
  //   <div className={styles.App}>
  //     <div className={styles.textcolor}>
  //     {/* <h1>Hello</h1> */}
  //     <Print name="knightfall" desc="Hi there!" number={3786458}/>
  //     <Print name="Darkest Knight" desc="Hello there" number={3786458}/>
  //     </div>
  //   </div>
  // );
}

// const age: number = 23
// age >= 10 ? console.log("This age is under 10 years") : console.log("This age is over 10 years");

const Print = (props) => {
  return (
    <div>
      <h1>Hello</h1>
      <h1>{props.name} !</h1>
      <h1>{props.desc} {props.name} !</h1>
      <h1>{props.number}</h1>
      <br/>
    </div>
  )
}

export default App;
