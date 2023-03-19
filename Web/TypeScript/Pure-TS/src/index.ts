class User{
    username: string
    password: string
    readonly site: string = "https://github.com"
    constructor(username: string, password: string) {
        this.username = username;
        this.password = password;
    }
}

const MyUser = new User('knightfall', 'passwd');
// MyUser.site = 'http://127.0.0.1:8000';
console.log(MyUser); 