// const names: string[] = [];
const names: Array<string> = [];

names.push("a");
console.log(names); 

type Owntypes = {
    name: string;
    id: number;
}

const OwnArray: Array<Owntypes> = []
OwnArray.push({name: "b", id: 1})
console.log(OwnArray)