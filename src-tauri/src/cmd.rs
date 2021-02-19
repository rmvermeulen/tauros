use serde::Deserialize;

#[derive(Deserialize)]
#[derive(Debug)]
pub struct DoSomethingPayload {
  text: String,
  num: u64,
}

#[derive(Deserialize)]
#[serde(tag = "cmd", rename_all = "camelCase")]
pub enum Cmd {
  // your custom commands
  // multiple arguments are allowed
  // note that rename_all = "camelCase": you need to use "myCustomCommand" on JS
  DoSomething {
    count: u64,
    payload: DoSomethingPayload,
  },
}
