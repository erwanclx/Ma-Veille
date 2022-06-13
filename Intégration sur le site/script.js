  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.8.3/firebase-app.js";
  import { getFirestore, collection, getDocs } from "https://www.gstatic.com/firebasejs/9.8.3/firebase-firestore.js";
  const firebaseConfig = {
    apiKey: "",
    authDomain: "",
    projectId: "",
    storageBucket: "",
    messagingSenderId: "",
    appId: ""
  };
  
  firebase.initializeApp(firebaseConfig);
  const db = firebase.firestore();
  
  let items = [];
  
  db.collection("Article").get().then((querySnapshot) => {
      querySnapshot.forEach((doc) => {
          console.log(doc.id);
          console.log(typeof(doc.data()));
  
          items.push({
                  id: doc.id,
                  date: doc.data().date,
                  artname: doc.data().name,
                  source: doc.data().source,
                  text: doc.data().text,
                  url: doc.data().url,
                  url_origin: doc.data().url_origin,
                  img_link: doc.data().img_link
              });
      })

      createArticle(items);
  });
  
  function createArticle(items) {
    document.getElementById('loading').remove()
    items.forEach((item) => {
    var container = document.getElementById('contain-art');
  
                 const article = document.createElement("div");
                  article.className = "article skeleton-anim";
                  article.innerHTML = `
                  <p class="date">Le ${item.date}</p>
                  <div class="hidden-content">
                      <h4>${item.artname}</h4>
                      <p>Source : <a href="${item.url_origin}/" target="_blank">${item.source}</a></p>
                      <p>${item.text}</p>
                      <a href="${item.url}" target="_blank"><i class="far fa-arrow-alt-circle-right article-go"></i></a>
                      <div class="note"><i class="fas fa-solid fa-star"></i><i class="fas fa-solid fa-star"></i><i class="fas fa-solid fa-star"></i><i class="fas fa-solid fa-star"></i><i class="far fa-regular fa-star"></i></div>
                  </div>
                  `;
                  console.log(item.id)
                  container.appendChild(article);
                  document.querySelector('.article:nth-of-type('+ item.id +')').style.backgroundImage = "url('"+ item.img_link +"')"
                  
                })
  }