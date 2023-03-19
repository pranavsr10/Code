"use strict";
class User {
    constructor(username, password) {
        this.site = "https://github.com";
        this.username = username;
        this.password = password;
    }
}
const MyUser = new User('knightfall', 'passwd');
// MyUser.site = 'http://127.0.0.1:8000';
console.log(MyUser);
