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
            document.addEventListener("selectionchange", function() {
                updateToolbar();
            });
            fontNamePicker.addEventListener("change", function() {
                const fontName = fontNamePicker.options[fontNamePicker.selectedIndex].value;
                document.execCommand('fontName', true, fontName);
            });
            fontSizePicker.addEventListener("change", function() {
                const fontSize = fontSizePicker.options[fontSizePicker.selectedIndex].value;
                document.execCommand('fontSize', true, fontSize);
            });
        }

        function postAction() {
            toggleInvisibility('new-post');
            togglePostButtonText();
            savePost()
        }

        function savePost() {
            const post = editor.innerHTML.toString();
            if (post != '') {
                const postContent = editor.innerHTML;
                document.getElementById('post-form-input').setAttribute('value', postContent);
                document.getElementById('post-form-submit').click();
            }
        }

        function toggleInvisibility(id) {
            if (typeof id === 'string') {
                document.getElementById(id).classList.toggle('invisible');
            }
        }

        function togglePostButtonText() {
            const createMsg = '<g:message code="index.createPost" />';
            const saveMsg = '<g:message code="index.savePost" />';

            if (window.postButton.innerText === createMsg) {
                window.postButton.innerText = saveMsg;
            } else if (window.postButton.innerText === saveMsg) {
                window.postButton.innerText = createMsg;
            }
        }

        function toggleFormat(name) {
            if (typeof name === 'string') {
                document.execCommand(name);
                const img = document.getElementById('format-' + name + '-img');
                img.classList.toggle('active');
            }
            window.editor.focus();
        }

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

        function insertLink() {
            const sLnk = prompt('<g:message code="index.writeURL" />','http:\/\/');
            if (sLnk && sLnk!='' && sLnk!='http://') {
                document.execCommand('createlink',true, sLnk);
            }
        }
    </g:javascript>
</head>
<body onload="initVariabbles();">
<div id="main">
    <div id="new-post" class="invisible">
        <div id="toolbar">
            <!-- Look here for exec commands: https://developer.mozilla.org/en-US/docs/Web/API/Document/execCommand -->
            <!-- EXTERNAL: The svg graphic is from material.io/tools/icons -->
            <g:select id="font-name-picker" name="font.name" from="${['Arial', 'Roboto', 'Times New Roman']}" />
            <g:select id="font-size-picker" name="font.size" from="${1..7}" value="3" />
            <g:img id="format-bold-img" class="toolbtn" src="icons/baseline-format_bold-24px.svg" onclick="toggleFormat('bold');" />
            <g:img id="format-italic-img" class="toolbtn" src="icons/baseline-format_italic-24px.svg" onclick="toggleFormat('italic');" />
            <g:img id="format-underlined-img" class="toolbtn" src="icons/baseline-format_underlined-24px.svg" onclick="toggleFormat('underlined');" />
            <g:img id="format-indent-img" class="toolbtn" src="icons/baseline-format_indent_increase-24px.svg" onclick="toggleFormat('indent');" />
            <g:img id="format-outdent-img" class="toolbtn" src="icons/baseline-format_indent_decrease-24px.svg" onclick="toggleFormat('outdent');" />
            <g:img id="format-insertUnorderedList-img" class="toolbtn" src="icons/baseline-format_list_bulleted-24px.svg" onclick="toggleFormat('insertUnorderedList');" />
            <g:img id="format-insertOrderedList-img" class="toolbtn" src="icons/baseline-format_list_numbered-24px.svg" onclick="toggleFormat('insertOrderedList');" />
            <g:img id="format-justifyLeft-img" class="toolbtn" src="icons/baseline-format_align_left-24px.svg" onclick="toggleFormat('justifyLeft');" />
            <g:img id="format-justifyCenter-img" class="toolbtn" src="icons/baseline-format_align_center-24px.svg" onclick="toggleFormat('justifyCenter');" />
            <g:img id="format-justifyRight-img" class="toolbtn" src="icons/baseline-format_align_right-24px.svg" onclick="toggleFormat('justifyRight');" />
            <g:img id="format-justifyFull-img" class="toolbtn" src="icons/baseline-format_align_justify-24px.svg" onclick="toggleFormat('justifyFull');" />
            <g:img id="link-btn" class="toolbtn" src="icons/baseline-insert_link-24px.svg" onclick="insertLink()" />
        </div>
        <div id="post-editor-container">
            <div id="post-editor" contenteditable="true"></div>
        </div>
        <g:form name="newPost" class="invisible" action="savePost">
            <input id="post-form-input" class="invisible" type="text" name="content">
            <input id="post-form-submit" class="invisible" type="submit" name="submit">
        </g:form>
    </div>
    <div id="post-display-area">
        <g:each var="post" in="${posts}">
            <div id="post-${post.id}">
                ${raw(post.content)}
            </div>
        </g:each>
    </div>
</div>
<div id="side-bar">
    <button id="post-button" onclick="postAction()">
        <g:message code="index.createPost" />
    </button>
</div>
<script>
    init();
</script>
</body>
</html>
