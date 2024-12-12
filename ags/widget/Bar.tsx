import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"

function Bar(monitor = 0): JSX.Element {
    return <window className="Bar" monitor={monitor}>
        <box>burr</box>
    </window>
}

export default Bar;
