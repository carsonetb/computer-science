
const editor = document.querySelector("#code_editor");
if (document.cookie.split("||||").length == 2) {
    editor.querySelector("#textbox").value = document.cookie.split("||||")[0]
    editor.querySelector("#cssbox").value = document.cookie.split("||||")[1]
}

editor.querySelector("#textbox").addEventListener("keydown", function(e) {
    document.cookie = e.target.value + "||||" + editor.querySelector("#cssbox").value
})

editor.querySelector("#cssbox").addEventListener("keydown", function(e) {
    document.cookie = editor.querySelector("#textbox").value + "||||" + e.target.value
})