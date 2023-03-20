// class User{
//     username: string
//     // #password: string
//     private password: string
//     readonly site: string = "https://github.com"
//     constructor(username: string, password: string) {
//         this.username = username;
//         this.password = password;
//     }
// }

class User{
    private count = 1
    readonly site: string = "http://github.com"
    constructor(
      public username: string,
      public password: string
    ){

    }

    private DeleteSomething() {
      console.log("Something deleted")
    }
    get UserCount(){
      return this.count
    }
    set UserCount(num){
      this.UserCount = num
    }
}

class SubUser extends User{
  isAnother = true;
  
}

const MyUser = new User('knightfall', 'passwd');
// const MyUser = new User('knightfall', 'passwd');
// MyUser.site = 'http://127.0.0.1:8000';
// MyUser.password

console.log(MyUser); 
