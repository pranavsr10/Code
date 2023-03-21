interface User {
    usernames: string,
    phoneNumber: number,
    withGoogle?: boolean
    // WithFunction(): string
}

interface User{
    githubtokenid?: string
}

interface Admin extends User{
    role?: "admin"
}


const Knightfall: User = {usernames: 'Knightfall', phoneNumber: 212 , WithFunction: () => {return 'Knightfall'}}

console.log(Knightfall); 

const Knightfall1: Admin = {usernames: 'Knightfall', phoneNumber: 212 , WithFunction: () => {return 'Knightfall'}, role: "admin"}

class someone implements User {
    constructor(
        public usernames: string,
        public phoneNumber: number
        ) {}
}
