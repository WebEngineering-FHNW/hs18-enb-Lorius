<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:javascript>
        function init() {
            // Initialisation of global variables
            window.postButton = document.getElementById('post-button');
            window.editor = document.getElementById('post-editor');
            window.tools = document.getElementById('toolbar').getElementsByTagName('img');
            window.main = document.getElementById('main');
            window.fontNamePicker = document.getElementById('font-name-picker');
            window.fontSizePicker = document.getElementById('font-size-picker');

            // Adding Listeners
            // This first listener makes sure that only the active tools are displayed as such.
            document.addEventListener("selectionchange", function() {
                updateToolbar();
            });

            // These two listeners make sure that changes in the dropdowns' selections (for font-family and font-size) actually affect the editor contents.
            fontNamePicker.addEventListener("change", function() {
                const fontName = fontNamePicker.options[fontNamePicker.selectedIndex].value;
                document.execCommand('fontName', true, fontName);
            });
            fontSizePicker.addEventListener("change", function() {
                const fontSize = fontSizePicker.options[fontSizePicker.selectedIndex].value;
                document.execCommand('fontSize', true, fontSize);
            });
        }

        // This functions just handles everything that must happen when the create/savae post button is pressed.
        function postAction() {
            toggleInvisibility('new-post');
            togglePostButtonText();
            savePost()
            window.editor.focus();
        }

        // This form fills out and submits a dummy form to get the contents of the new post to the controller and then the database.
        function savePost() {
            const post = editor.innerHTML.toString();
            if (post != '') {
                const postContent = editor.innerHTML;
                document.getElementById('post-form-input').setAttribute('value', postContent);
                document.getElementById('post-form-submit').click();
            }
        }

        // Insanely useful function
        function toggleInvisibility(id) {
            if (typeof id === 'string') {
                document.getElementById(id).classList.toggle('invisible');
            }
        }

        // Only just toggles the text of the "create/save post" button.
        function togglePostButtonText() {
            const createMsg = '<g:message code="index.createPost" />';
            const saveMsg = '<g:message code="index.savePost" />';

            if (window.postButton.innerText === createMsg) {
                window.postButton.innerText = saveMsg;
            } else if (window.postButton.innerText === saveMsg) {
                window.postButton.innerText = createMsg;
            }
        }

        // This method executes almost all the execCommand commands
        function toggleFormat(name) {
            if (typeof name === 'string') {
                document.execCommand(name);
                const img = document.getElementById('format-' + name + '-img');
                img.classList.toggle('active');
            }
            window.editor.focus();
        }

        // This function makes sure, that all the tool images are appropriately highlighted.
        function updateToolbar() {
            const regexPattern = new RegExp('format-(.*)-img');
            for (let i = 0; i < window.tools.length; i++){
                const tool = window.tools[i].id.replace(regexPattern, '$1');
                const active = document.queryCommandState(tool);

                const displayedIncorrectly = (active && !window.tools[i].classList.contains('active')) || (!active && window.tools[i].classList.contains('active'));
                if (displayedIncorrectly) {
                    window.tools[i].classList.toggle('active');
                }
            }
        }

        // This function is responsible for inserting Hyper Links. Of course, it has basic input validation.
        function insertLink() {
            const sLnk = prompt('<g:message code="index.writeURL" />','http:\/\/');
            if (sLnk && sLnk!='' && sLnk!='http://') {
                document.execCommand('createlink',true, sLnk);
            }
        }
    </g:javascript>
</head>
<body>
<div id="main">
    <div id="new-post" class="invisible">
        <div id="toolbar">
            <!-- These are all the tools that I made available. They are presented as clickable images -->
            <!-- These are also all the dependencies or external artefacts that I use -->
            <!-- Look here for exec commands: https://developer.mozilla.org/en-US/docs/Web/API/Document/execCommand -->
            <!-- EXTERNAL: The svg graphics are from material.io/tools/icons -->
            <div id="font-tool-group" class="tool-group">
                <g:select id="font-name-picker" name="font.name" from="${['Arial', 'Roboto', 'Times New Roman']}" />
                <g:select id="font-size-picker" name="font.size" from="${1..7}" value="3" />
            </div>
            <div id="basic-format-tool-group" class="tool-group">
                <g:img id="format-bold-img" class="toolbtn" src="icons/baseline-format_bold-24px.svg" title="bold" onclick="toggleFormat('bold');" />
                <g:img id="format-italic-img" class="toolbtn" src="icons/baseline-format_italic-24px.svg" title="italic" onclick="toggleFormat('italic');" />
                <g:img id="format-underlined-img" class="toolbtn" src="icons/baseline-format_underlined-24px.svg" title="underline" onclick="toggleFormat('underlined');" />
                <g:img id="format-insertUnorderedList-img" class="toolbtn" src="icons/baseline-format_list_bulleted-24px.svg" title="unordered list" onclick="toggleFormat('insertUnorderedList');" />
                <g:img id="format-insertOrderedList-img" class="toolbtn" src="icons/baseline-format_list_numbered-24px.svg" title="ordered list" onclick="toggleFormat('insertOrderedList');" />
            </div>
            <div id="advanced-format-tool-group" class="tool-group">
                <g:img id="format-justifyLeft-img" class="toolbtn" src="icons/baseline-format_align_left-24px.svg" title="justify left" onclick="toggleFormat('justifyLeft');" />
                <g:img id="format-justifyCenter-img" class="toolbtn" src="icons/baseline-format_align_center-24px.svg" title="justify center" onclick="toggleFormat('justifyCenter');" />
                <g:img id="format-justifyRight-img" class="toolbtn" src="icons/baseline-format_align_right-24px.svg" title="justify right" onclick="toggleFormat('justifyRight');" />
                <g:img id="format-justifyFull-img" class="toolbtn" src="icons/baseline-format_align_justify-24px.svg" title="justify full" onclick="toggleFormat('justifyFull');" />
                <g:img id="format-indent-img" class="toolbtn" src="icons/baseline-format_indent_increase-24px.svg" title="indent" onclick="toggleFormat('indent');" />
                <g:img id="format-outdent-img" class="toolbtn" src="icons/baseline-format_indent_decrease-24px.svg" title="outdent" onclick="toggleFormat('outdent');" />
            </div>
            <div id="misc-tool-group" class="tool-group">
                <g:img id="link-btn" class="toolbtn" src="icons/baseline-insert_link-24px.svg" onclick="insertLink()" />
            </div>
        </div>

        <!-- This is the dive that the user gets to edit. -->
        <div id="post-editor-container">
            <div id="post-editor" contenteditable="true"></div>
        </div>

        <!-- This is basically a dummy form that I fill out and submit via some javascript code. -->
        <g:form name="newPost" class="invisible" action="savePost">
            <input id="post-form-input" class="invisible" type="text" name="content">
            <input id="post-form-submit" class="invisible" type="submit" name="submit">
        </g:form>
    </div>

    <!-- This is the area in which the the blog posts are displayed -->
    <!-- I use the raw() method to make sure the html really is displayed as html and not as text -->
    <div id="post-display-area">
        <g:each var="post" in="${posts}">
            <div id="post-${post.id}">
                ${raw(post.content)}
            </div>
        </g:each>
    </div>
</div>

<!-- Here is the mostly empty sidebar -->
<div id="side-bar">
    <button id="post-button" onclick="postAction()">
        <g:message code="index.createPost" />
    </button>
</div>

<!-- I use the init() function call here because the DOM is finally loaded at this point which allows me to make variables in the window object and thereby avoid code duplication -->
<script>
    init();
</script>
</body>
</html>
