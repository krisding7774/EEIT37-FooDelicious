<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <link href="/css/CKEditor.css" rel="stylesheet" />
        <div class="row" id="rowSelect">
            <!--版面配置左方-->
            <div class="col-12 col-md-2"></div>
            <!--版面配置右方-->
            <div class="col-12 col-md-9">
                <h3>文章修改</h3>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">分類</span>
                    <input type="text" class="form-control" readonly aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="" id="classify">
                </div>
                <hr>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-default">標題</span>
                    <input type="text" class="form-control" readonly aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="" id="title">
                </div>
                <hr>
                <div id="editor">
                    <c:forEach var="article" items="${article}">
                        ${article.article}
                    </c:forEach>
                </div>
                <br> <input type='button' value='確認修改' id="submit">
            </div>

        </div>
        <script src="${contextRoot}/js/ckeditor.js"></script>
        <script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
        <script src="${contextRoot}/translations/zh.js"></script>

        <script>
            let shareID;
            //歡樂的CKEditor圖片固定區域
            class MyUploadAdapter {
                constructor(loader) {
                    // The file loader instance to use during the upload.
                    this.loader = loader;
                }

                // Starts the upload process.
                upload() {
                    return this.loader.file
                        .then(file => new Promise((resolve, reject) => {
                            this._initRequest();
                            this._initListeners(resolve, reject, file);
                            this._sendRequest(file);
                        }));
                }

                // Aborts the upload process.
                abort() {
                    if (this.xhr) {
                        this.xhr.abort();
                    }
                }

                // Initializes the XMLHttpRequest object using the URL passed to the constructor.
                _initRequest() {
                        const xhr = this.xhr = new XMLHttpRequest();

                        //前往的區域為 圖片放上去 同時會在跟目錄儲存圖片

                        xhr.open('POST', '/imgArticle', true);

                        xhr.responseType = 'json';

                    }
                    // Initializes XMLHttpRequest listeners.
                _initListeners(resolve, reject, file) {
                    const xhr = this.xhr;
                    const loader = this.loader;
                    const genericErrorText = `Couldn't upload file: ${ file.name }.`;

                    xhr.addEventListener('error', () => reject(genericErrorText));
                    xhr.addEventListener('abort', () => reject());
                    xhr.addEventListener('load', () => {
                        const response = xhr.response;

                        // This example assumes the XHR server's "response" object will come with
                        // an "error" which has its own "message" that can be passed to reject()
                        // in the upload promise.
                        //
                        // Your integration may handle upload errors in a different way so make sure
                        // it is done properly. The reject() function must be called when the upload fails.
                        if (!response || response.error) {
                            return reject(response && response.error ? response.error.message : genericErrorText);
                        }

                        // If the upload is successful, resolve the upload promise with an object containing
                        // at least the "default" URL, pointing to the image on the server.
                        // This URL will be used to display the image in the content. Learn more in the
                        // UploadAdapter#upload documentation.
                        resolve({
                            default: response.url
                        });
                    });

                    // Upload progress when it is supported. The file loader has the #uploadTotal and #uploaded
                    // properties which are used e.g. to display the upload progress bar in the editor
                    // user interface.
                    if (xhr.upload) {
                        xhr.upload.addEventListener('progress', evt => {
                            if (evt.lengthComputable) {
                                loader.uploadTotal = evt.total;
                                loader.uploaded = evt.loaded;
                            }
                        });
                    }
                }

                // Prepares the data and sends the request.
                _sendRequest(file) {
                    // Prepare the form data.
                    const data = new FormData();

                    data.append('upload', file);

                    // Important note: This is the right place to implement security mechanisms
                    // like authentication and CSRF protection. For instance, you can use
                    // XMLHttpRequest.setRequestHeader() to set the request headers containing
                    // the CSRF token generated earlier by your application.

                    // Send the request.
                    console.log("data：" + file)
                    this.xhr.send(data);
                }
            }

            // ...

            function MyCustomUploadAdapterPlugin(editor) {
                editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
                    // Configure the URL to the upload script in your back-end here!
                    return new MyUploadAdapter(loader);
                };
            }

            // ...

            ClassicEditor
                .create(document.querySelector('#editor'), {
                    extraPlugins: [MyCustomUploadAdapterPlugin],
                    language: "zh",
                })
                .then(newEditor => {
                    editor = newEditor;
                })
                .catch(error => {
                    console.log(error)
                });
            //點擊btn事件
            document.querySelector('#submit').addEventListener('click', () => {
                const editorData = editor.getData();

                var postData = {
                    title: $("#titleArea").val(),
                    classify: $("#classify").val(),
                    article: editorData
                };

                $.ajax({
                    url: "/articleUpdate",
                    data: JSON.stringify(postData),
                    type: "PUT",
                    contentType: "application/json;charset=utf-8",
                });

                window.location.href = "/goShareArea";
            });

            //從SQL尋找資料 並且顯示於畫面上 這邊只有顯示title和分類
            $.ajax({
                url: "/responseArticle",
                type: "Get",
                contentType: "application/json;charset=utf-8",
                success: function(data) {
                    console.log(data.article[0].article);
                    $("#classify").val(data.title[0].article_clallify);
                    $("#title").val(data.title[0].article_title);
                    shareID = data.title[0].share_id;
                }
            })
            document.querySelector('#submit').addEventListener('click', () => {
                const editorData = editor.getData();

                var postData = {
                    title: $("#titleArea").val(),
                    classify: $("#classify").val(),
                    article: editorData
                };

                $.ajax({
                    url: "/articleUpdate/" + shareID,
                    type: "PUT",
                    dataType: 'json',
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(postData),
                    success: function() {
                        window.location.href = "/goShareArea"
                    }
                });
            });
        </script>