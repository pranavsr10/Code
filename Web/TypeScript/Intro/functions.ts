function addTwo(num : number) : number { //will return only a number
   return num + 2;
}

let num: number;
num = addTwo(3);

function getUpper(val: string){
    return val.toUpperCase();
}

function Multipleval(name: string , age: number , email: string = 'SOMETHING'){
    return ' "The name is " + name + " , the age is " + age + ", the email is " + email '
}


console.log(Multipleval("knighfall",20)); 
getUpper("Knightfall")
console.log(getUpper("Knightfall"));

const searching = [ "knighfall", "knigh", "Knight", "knigh", "knighkl"]

searching.map(searching => {
    return `While searching , I found ${searching}`
})

function consoleerror(err: string) : void {
    console.log(err);
}

function handlingError(err: string) : never {
    throw new Error(err);
}