

const code_editors = document.querySelectorAll("#code_editor");

code_editors.forEach(element => {element.querySelector("#textbox").addEventListener("keydown", function(e) {
    
    
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
        if (line.trim().endsWith(">") && !line.split("<").reverse()[0].includes("/")) {
            tabs += 1;
        }
        to_cursor = to_selection + "\n" + "\t".repeat(tabs);
        this.value = to_cursor + (from_selection.startsWith("<") ? "\n" + "\t".repeat(tabs - 1) : "") + from_selection
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
})})

code_editors.forEach(element => {element.querySelector("#textbox").addEventListener("input", function(e) {
    parent = this.parentNode
    parent.querySelector("#htmlhere").innerHTML = "<div class=\"fakebody\">" + e.target.value + "</div>"
})})

code_editors.forEach(element => {element.querySelector("#css_box").addEventListener("input", function(e) {
    css = "#htmlhere {padding: 20px; background-color: white; color: black; font-family: serif} h1 {text-align: left}"
    parent = this.parentNode
    var unsanitized = parent.querySelector("#css_box").value
    for (i = 0; i < unsanitized.split("}").length - 1; i++) {
        css += "#htmlhere " + unsanitized.split("}")[i] + "}"
    }
    document.getElementById("custom-style").textContent = css
})})