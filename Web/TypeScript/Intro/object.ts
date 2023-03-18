// const User = {
//     name: 'knightfall',
//     OS: 'Linux',
//     Distribution: 'Archlinux'
// }

// function createUser({OS: string, Distribution: string}){}
// createUser({ name: 'suganth', OS: 'Linux', Distribution: 'somos' })

// export {}

// type User = {
//     name: string;
//     OS: string;
//     Distribution: string;
// }

// function createUser({name, OS, Distribution}: User) {}

// createUser({ name: 'suganth', OS: 'Linux', Distribution: 'somos'});

type User = {
    readonly _id : string;
    name: string;
    email: string;
    Phonenumber?: number; //optional
}

type OperatingSystem = {
    OsName: string;
    KernelVersion: string;
}

let knightfall: User = {
    _id : 'knightfall',
    name : 'knightfall',
    email : 'knightfall@123',
    Phonenumber: 1234567890,
}

type Information = User & OperatingSystem & {
    description: string;
}

// knightfall._id = 'knightfall';  // It is readonly
