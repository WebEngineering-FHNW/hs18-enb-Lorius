<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <script>
        let editor;
        let tools;
        let postButton;

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
            if (postButton == null) {
                postButton = document.getElementById('post-button');
            }

            const createMsg = '<g:message code="index.createPost" />';
            const saveMsg = '<g:message code="index.savePost" />';

            if (postButton.innerText === createMsg) {
                postButton.innerText = saveMsg;
            } else if (postButton.innerText === saveMsg) {
                postButton.innerText = createMsg;
            }
        }

        function toggleFormat(name) {
            if (typeof name === 'string') {
                document.execCommand(name);
                const img = document.getElementById('format-' + nameToTag(name) + '-img');
                img.classList.toggle('active');
            }
            editor.focus();
        }

        function nameToTag(name) {
            switch (name) {
                case 'bold':
                    return 'B';
            }
        }

        function updateToolbar() {
            if (editor == null || tools == null) {
                editor = document.getElementById('post-editor');
                tools = document.getElementById('toolbar').getElementsByTagName('img');
            }
            const activeTools = [];
            let pe = getSelection().anchorNode.parentElement;
            while (pe.id != editor.id) {
                activeTools.push(pe.tagName);
                pe = pe.parentElement;
            }
            for (let i = 0; i < tools.length; i++){
                let contained = false;

                for (let j = 0; j < activeTools.length; j++) {
                    if (tools[i].id === 'format-' + activeTools[j] + '-img') {
                        contained = true;
                    }
                }

                const displayedIncorrectly = (contained && !tools[i].classList.contains('active')) || (!contained && tools[i].classList.contains('active'));
                if (displayedIncorrectly) {
                    tools[i].classList.toggle('active');
                }
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
            <g:img id="format-B-img" class="toolbtn" src="icons/round-format_bold-24px.svg" onclick="toggleFormat('bold');" />
        </div>
        <div id="post-editor" contenteditable="true" onclick="updateToolbar()" onmousedown="updateToolbar()" onselect="updateToolbar()" onkeydown="updateToolbar()" onkeypress="updateToolbar()">
            <b>test</b>
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
