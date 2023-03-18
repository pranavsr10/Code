/* let person = {
    name: 'knightfall',
    age: 20,
    interest: null
}

person.interest = "None";
person['interest'] = "Nothing";
console.log(person.interest);

console.log(person.name); */
//
// const agearray = [32,12,34,56,78,18];
// const result = agearray.filter(thisfunction);
// function thisfunction(agearray) {
//   return age >= 18;
// }

const ognumber = [ 1,2,3,4];
const newnumber = ognumber.map(gomala)
const result = ognumber.filter(filterfunction);
function gomala(argums) {
  return argums * 5;
  
}
function filterfunction(argums) {
  return argums >= 3 ;
}

console.log(newnumber);
console.log(result);
