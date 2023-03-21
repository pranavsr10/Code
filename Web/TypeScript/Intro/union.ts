let score: number | string | boolean = 33;
score = true;
console.log(score);


type User = {
    name: string;
    id: string;
}

type Admin = {
    usernames: string;
    id: string;
}

let me: User | Admin = { name: "knightfall", id: "1" };
me = { usernames: "knightfall", id: "1" };

function testingthis(id : string | number | boolean) {
    console.log("found id: " + id);
    if (typeof id === "string") {
        id.toLocaleLowerCase()
    }
    else if (typeof id === "number") {
        id.toExponential
    }
}

testingthis(78);
testingthis(true);
testingthis("Test");


const array1: number[] | string[] = [1, 2, 3, 4, 5];
const array2: (number | string)[] = [1, 2, 3, 4, '5']

let gender: "male" | "female" | "unknown" 
gender = "unknown"
