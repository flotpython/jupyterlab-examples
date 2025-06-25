// ==UserScript==
// @name         JupyterBook2 Teacher Additions
// @description  cheat keyboard shortcut to see corriges
// @namespace    http://info-mines.paris/
// @version      0.1
// @match        *://*/*
// @grant        none
// ==/UserScript==


const cheatCorrige = () => {
    // open a corrige file which is located under
    // the .teacher folder with an extra "corrige-" suffix
    // this assumes the mystmd config has
    // site.options.folder = true
    // in that case the transformation that we need to do is
    // e.g. my-book-nb -> teacher/my-book-corrige-nb
    // (even though the folder is actually .teacher)
    console.log("jbook2 teacher: swap to corrige file")
    const currentLocation = window.location.href
    let newLocation
    if (currentLocation.includes("-corrige")) {
        // undo: go back to the student version
        newLocation = currentLocation.replace(
            /(.*)\/teacher\/([A-Za-z0-9_-]+)-corrige-nb/gm,
            "$1/$2-nb"
        )
    } else {
        newLocation = currentLocation.replace(
            /(.*)\/([A-Za-z0-9_-]+)-nb/gm,
            "$1/teacher/$2-corrige-nb"
        )
    }
    console.log("jbook2 teacher: current", currentLocation, "new", newLocation)
    if (newLocation !== currentLocation) {
        window.location.href = newLocation
    } else {
        console.log("jbook2 teacher: no corrige file found")
        return
    }
}

const init_cheatcodes = () => {

    // jb2 does not yet support url entries
    // https://github.com/jupyter-book/mystmd/issues/1445
    // this part will require tuning once it is the case
    // const urlTocEntriesOpenInNewTab = () => {
    //     console.log("jbook2 teacher: url-typed toc entries open in a separate tab")
    //     document.querySelectorAll("nav a.reference.external")
    //         .forEach(node => node.target = "_blank")
    // }

    // define a keyboard shortcut to open the corrige file
    // want to be able to communicate the use of Ctrl-Shift-?
    // very surprisingly, it is incredibly hard to catch a keyboard shortcut
    // properly i.e. regardless of the keyboard layout
    // given that keypress is deprecated, we are left with keydown
    // as beforeinput does not even trigger in our case (not changing the dom)
    // it turns out that neither the key nor code properties are reliable
    // across qwerty / azerty / layouts - I haven't tried dvorak
    // so here's the trade off that I came up with:
    // the 'key' property seems to always refer to the lowercase character
    // on a  qwerty I have / being the lowercase and ? the uppercase
    // on an azerty I have , being the lowercase and ? the uppercase
    // on a qwerty linux,  ? is the lowercase and / the uppercase
    const lowercases = { '/': true, ',': true, '?': true }
    const cheatCorrigeShortcut = () => {
        console.log("jbook2 teacher: define corrige magic shortcut")
        document.addEventListener("keydown", (event) => {
            if (event.key in lowercases && event.ctrlKey && event.shiftKey) {
                cheatCorrige()
            }
        })
    }

    // inject class corrige when relevant
    const outlineCorrige = () => {
        if (window.location.href.includes("corrige")) {
            document.body.classList.add("corrige")
        } else {
            document.body.classList.remove("corrige")
        }
    }

    // our setup
    // urlTocEntriesOpenInNewTab()
    outlineCorrige()
    cheatCorrigeShortcut()
}

init_cheatcodes()
