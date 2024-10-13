// Selecciona el botón de expandir
const expand_btn = document.querySelector(".expand-btn");

// Variable para almacenar el índice activo
let activeIndex;

// Evento para colapsar/expandir el sidebar
expand_btn.addEventListener("click", () => {
  document.body.classList.toggle("collapsed");
});

// Obtén la URL actual
const current = window.location.href;

// Selecciona todos los enlaces del sidebar
const allLinks = document.querySelectorAll(".sidebar-links a");

// Asigna el estado activo al enlace correspondiente basado en la URL actual
allLinks.forEach((elem) => {
  if (elem.href === current) {
    elem.classList.add("active");
  }
});

// Añade evento a cada enlace del sidebar para cambiar el estado activo cuando se hace clic
allLinks.forEach((elem) => {
  elem.addEventListener('click', function() {
    const hrefLinkClick = elem.href;

    allLinks.forEach((link) => {
      if (link.href == hrefLinkClick){
        link.classList.add("active");
      } else {
        link.classList.remove('active');
      }
    });
  });
});


function showPopup() {
            document.getElementById("popupForm").style.display = "block";
        }

        function hidePopup() {
            document.getElementById("popupForm").style.display = "none";
        }