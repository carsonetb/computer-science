

const code_editors = document.querySelectorAll("#code_editor");


code_editors.forEach(element => {
    var element = element.querySelector("#textbox")
    if (element) { 
        element.addEventListener("keydown", function(e) {
            var custom_css = this.getAttribute("custom_css")
            if (custom_css) {
                set_css(custom_css)
            }
            
            if (e.key == "Tab") {
                e.preventDefault();

                var start = this.selectionStart;
                var end = this.selectionEnd;

                this.value = this.value.substring(0, start) + "\t" + this.value.substring(end);
            
                this.selectionStart = this.selectionEnd = start + 1;
            }
            if (e.key == "Enter") {
                e.preventDefault();

                var to_selection = this.value.substring(0, this.selectionStart);
                var from_selection = this.value.substring(this.selectionEnd);
                var line_number = to_selection.split("\n").length;
                var line = this.value.split("\n")[line_number - 1];
                var tabs = 0;
                for (i = 0; i < line.length; i++) {
                    if (line[i] == "\t") {
                        tabs++;
                    }
                    else {
                        break;
                    }
                }
                if (line.trim().endsWith(">") && !to_selection.split("<").reverse()[0].includes("/")) {
                    tabs += 1;
                }
                to_cursor = to_selection + "\n" + "\t".repeat(tabs);
                this.value = to_cursor + (from_selection.startsWith("<") ? "\n" + "\t".repeat(Math.max(tabs - 1, 0)) : "") + from_selection
                this.selectionStart = to_cursor.length
                this.selectionEnd = to_cursor.length
            }
            if (e.key == ">") {
                var to_selection = this.value.substring(0, this.selectionStart);
                var from_selection = this.value.substring(this.selectionEnd);
                var line_number = to_selection.split("\n").length;
                var line = this.value.split("\n")[line_number - 1];

                var num_less = 0;
                var num_greater = 0;
                for (i = 0; i < line.length; i++) {
                    if (line[i] == "<") {
                        num_less++;
                    }
                    if (line[i] == ">") {
                        num_greater++;
                    }
                }

                if (line.split("<").reverse()[0].includes("/") || num_greater >= num_less) {
                    return;
                }

                extra = "</" + to_selection.split("<").reverse()[0] + ">";
                this.value = to_selection + extra + from_selection;
                this.selectionStart = to_selection.length;
                this.selectionEnd = to_selection.length;
            }
})}})

code_editors.forEach(element => {element.querySelector("#textbox").addEventListener("input", function(e) {
    parent = this.parentNode
    if (e.target.value.includes("<script>")) {
        e.target.value = ""
        alert("You can't have scripts! I will now happily delete all your work");
        return;
    }
    else {
        parent.querySelector("#htmlhere").innerHTML = "<div class=\"fakebody\">" + e.target.value + "</div>"
    }
})})

code_editors.forEach(element => {
    var box = element.querySelector("#cssbox")
    if (box) {
        box.addEventListener("input", css_pressed)
    }
})

function css_pressed(e) { 
    parent = this.parentNode
    var unsanitized = parent.querySelector("#css_box").value
    set_css(unsanitized);

    var custom_html = this.getAttribute("custom_html")
    if (custom_html) {
        parent.querySelector("#htmlhere").innerHTML = custom_html
    }
}

function set_css(unsanitized) {
    var css = "#htmlhere {width: 50%; padding: 20px; background-color: white; color: black; font-family: serif} #htmlhere h1 {text-align: left}"
    for (i = 0; i < unsanitized.split("}").length - 1; i++) {
        css += "#htmlhere " + unsanitized.split("}")[i] + ""
    }
    console.log(css)
    document.getElementById("custom-style").textContent = css

}