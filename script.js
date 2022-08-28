
  window.addEventListener("DOMContentLoaded", function() { 
    window.addEventListener("scroll", function() { 
    if(window.scrollY < 200) {
    document.querySelector("#footer").style.bottom = "-55%"; 
    } else {
          document.querySelector("#footer").style.bottom = "0%"; 
    }
  })
  })