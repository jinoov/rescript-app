@react.component
let make = (~children, ~className="") => {
    let appClassName = {
        let defaultClassName = ["flex", "flex-col", "items-stretch", "gap-4"]
        defaultClassName->Belt.Array.concat(className->String.split(" "))->Belt.Array.joinWith(" ")
    }

    <div className={appClassName(a => a)}> // FIXME. 이렇게 콜백 넣어주는게 맞을까
        {children}
    </div>
}