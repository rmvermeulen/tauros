import "./main.css";
import { Elm } from "./Main.elm";
import * as serviceWorker from "./serviceWorker";

const tauri = window.__TAURI__;
setTimeout(() => {
  console.log("Sending a message from the client!");
  tauri
    .promisified({
      cmd: "doSomething",
      count: 2,
      payload: { num: 12, text: "lorem ipsum" },
    })
    .then((response) => console.log(`response: ${response}`))
    .catch(console.error);
}, 2000);
Elm.Main.init({
  node: document.getElementById("root"),
});

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
