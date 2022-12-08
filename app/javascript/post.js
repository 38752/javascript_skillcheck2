function post (){
  const submit_btn = document.getElementById("submit_btn");
  submit_btn.addEventListener('click', (e) => {
    e.preventDefault();
    const formData = new FormData(document.getElementById("new_article"));
    // new FormData(***)と***は別物！XHRで送るのはnew...の方
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/articles", true);
    XHR.responseType = "json";
    XHR.send(formData);

    XHR.onload = () => {
      const contents_area = document.getElementById("contents_area")
      const item = XHR.response.article;
      const html = `
        <div class="article">
          ${item.text}
        </div>
      `
      contents_area.insertAdjacentHTML("afterbegin", html)
      const textarea = document.getElementById("article_text");
      const codearea = document.getElementById("article_code");
      textarea.value = "";
      codearea.value = "";
    };
  });
}

window.addEventListener('load', post);