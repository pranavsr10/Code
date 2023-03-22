import styles from './App.module.css';


function App() {
  return (
    <div className={styles.App}>
      <div className={styles.textcolor}>
      {/* <h1>Hello</h1> */}
      <Print name="knightfall" desc="Hi there!" number={3786458}/>
      <Print name="Darkest Knight" desc="Hello there" number={3786458}/>
      </div>
    </div>
  );
}

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
