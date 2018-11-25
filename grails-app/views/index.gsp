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
            const button = document.getElementById('post-button');
            const createMsg = '<g:message code="index.createPost" />';
            const saveMsg = '<g:message code="index.savePost" />';

            if (button.innerText === createMsg) {
                button.innerText = saveMsg;
            } else if (button.innerText === saveMsg) {
                button.innerText = createMsg;
            }
        }

        function toggleFormat(name) {
            if (typeof name === 'string') {
                document.execCommand(name);
                const img = document.getElementById('format-' + name + '-img');
                img.classList.toggle('in-use');
            }
        }
    </script>
</head>
<body>
<div id="main">
    <div id="new-post" class="invisible">
        <div id="toolbar">
            <!-- Look here for exec commands: https://developer.mozilla.org/en-US/docs/Web/API/Document/execCommand -->
            <!-- EXTERNAL: The svg graphic is from material.io/tools/icons -->
            <g:img id="format-bold-img" src="icons/round-format_bold-24px" onclick="toggleFormat('bold');" />
        </div>
        <div id="post-editor" contenteditable="true">
            test
        </div>
    </div>
</div>
<div id="side-bar">
    <button id="post-button" onclick="postAction()">
        <g:message code="index.createPost" />
    </button>
</div>
</body>
</html>
