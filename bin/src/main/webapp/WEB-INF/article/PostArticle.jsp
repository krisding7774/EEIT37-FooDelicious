<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


    <link href="/css/CKEditor.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../css/default4.css">
    <!-- 開工啦!!! -->
    <div class="row" id="rowSelect">
        <div div class="col-12 col-md-2"></div>


        <div div class="col-12 col-md-9" >
            <label class="input-group-text mb-3 col-2" for="classify">發表新文章</label>
            <div class="input-group mb-3">
                <label class="input-group-text" for="classify">請選擇分類</label>
                <select class="form-select" id="classify">

              <option >食譜分享</option>
              <option >廚具開箱</option>
            </select>
            </div>
            </select>
            <div style="margin: 10px 0px;">
                <input type="text" class="form-control" placeholder="請輸入文章標題..." aria-label="Recipient's username" id="titleArea">
            </div>
            <div id="editor"></div>
            <input type='button' value='送出' id="submit">


        </div>
    </div>
    <script src="/js/ckeditor.js"></script>
    <script src="/translations/zh.js"></script>

    <script>
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

                    // Note that your request may look different. It is up to you and your editor
                    // integration to choose the right communication channel. This example uses
                    // a POST request with JSON as a data structure but your configuration
                    // could be different.

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

        document.querySelector('#submit').addEventListener('click', () => {
            const editorData = editor.getData();

            var postData = {
                title: $("#titleArea").val(),
                classify: $("#classify").val(),
                article: editorData
            };

            $.ajax({
                url: "/postarticle.controller",
                data: JSON.stringify(postData),
                type: "POST",
                contentType: "application/json;charset=utf-8",
            });

            window.location.href = "/goShareArea";
        });
    </script>