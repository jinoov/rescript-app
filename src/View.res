type user = {
    name: string,
    age: int,
    hobbies?: array<string>,
}

/** 힌들리 밀러 미쳤다.... */
@react.component
let make = (~user: user) => {
    let onClick = _ => {
        Js.log("Hello World")
    }

    let formattedHobbies = {
        let hobbies = switch user.hobbies {
            | Some(hobbies) => hobbies
            | None => [] 
        }

        hobbies->Belt.Array.map(hobby => {
            let hobby = hobby->String.toUpperCase
            hobby
        })
    }

    <div>
        <p>{"Hello World"->React.string}</p>
        <div>
            <p>{user.name->React.string}</p>
            <p>{user.age->Int.toString->React.string}</p>
        </div>
        <button onClick={onClick}>{"Click me"->React.string}</button>
        <div>
        {formattedHobbies->Belt.Array.map(hobby => <p>{hobby->React.string}</p>)->React.array} 
        </div>
    </div>
}