type state = Idle | Loading | Success | Failure 

@react.component
let make = () => {
  let (count, setCount) = React.useState(() => 0)

  let (apiState, setApiState) = React.useState(() => Idle)

  let text = switch apiState {
    | Idle => "Idle"
    | Success => "Success"
    | Loading => "Loading"
    | Failure => "Failure"
  }

  let onApiCall = _ => {
    setApiState(_ => 
        switch apiState {
          | Idle => Loading
          | Loading => Success
          | Success => Failure
          | Failure => Idle
        }
    )
  }

  let message = {
    let part1 = "Hello"
    let part2 = "World"
    `${part1} ${part2}`
  }

  let (arr, setArr) = React.useState(() => [])

  let (val, setVal) = React.useState(() => "")

  let onInputChange = (e) => {
    let target = JsxEvent.Form.target(e)
    let value: string = target["value"]
    setVal(_ => value)
  }

  let onButtonClick = _ => {
    setArr(prev => prev->Belt.Array.concat([{
      "id": prev->Belt.Array.length->Int.toString,
      "value": val
    }]))
    setVal(_ => "")
  }

  <div className="pt-10 max-w-[640px] m-auto">
    <div className="flex flex-col items-stretch gap-6">
      <Stack className="bg-red-300">
        <p>{count->Int.toString->React.string}</p>
        <Button onClick={_ => setCount(prev => prev + 1)}>{"Increment"->React.string}</Button>
      </Stack>
      <hr />
      <p>{text->React.string}</p>
      <Stack>
        <Button onClick={onApiCall}>{"Fetch"->React.string}</Button>
        <p className="font-bold">{message->React.string}</p>
      </Stack>
      <hr/>
      <div className="bg-blue-300 p-4">
        <Stack>
          <Stack>
            <input inputMode="text" value={val} onChange={onInputChange} className="border border-gray-300 rounded-md p-2" />
            <Button onClick={onButtonClick}>{"submit"->React.string}</Button>
            <hr/>
          </Stack>
          {arr->Belt.Array.mapWithIndex((index, item) => {
            <p key={index->Int.toString}>{item["value"]->React.string}</p>
          })->React.array}
        </Stack>
      </div>
    </div>
  </div>
}