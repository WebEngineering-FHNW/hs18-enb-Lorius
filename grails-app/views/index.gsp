<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <script>

        function postAction() {
            toggleInvisibility('new-post');
            togglePostButtonText();
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
    </script>
</head>
<body onload="initVariabbles();">
<div id="main">
    <div id="new-post" class="invisible">
        <div id="toolbar">
            <!-- Look here for exec commands: https://developer.mozilla.org/en-US/docs/Web/API/Document/execCommand -->
            <!-- EXTERNAL: The svg graphic is from material.io/tools/icons -->
            <g:img id="format-bold-img" class="toolbtn" src="icons/round-format_bold-24px.svg" onclick="toggleFormat('bold');" />
        </div>
        <div id="post-editor" contenteditable="true">
            <b>test</b>
        </div>
    </div>
</div>
<div id="side-bar">
    <button id="post-button" onclick="postAction()">
        <g:message code="index.createPost" />
    </button>
</div>
<script>
    // Initialisation of global variables
    window.postButton = document.getElementById('post-button');
    window.editor = document.getElementById('post-editor');
    window.tools = document.getElementById('toolbar').getElementsByTagName('img');

    // Adding Listeners
    document.addEventListener("selectionchange", function() {
        updateToolbar();
    });
</script>
</body>
</html>
