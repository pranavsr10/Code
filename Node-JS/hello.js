const mission = "learning to code";
const processtest = process.argv[2];
if (mission === "learning to code") {
 console.log("I am going to " + mission);
}
else {
 console.log(`I am not going to ${mission} `);
} 
console.log("The arugement passed is " + processtest);