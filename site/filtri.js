const filtroLingua = document.querySelector("#filtro-lingua");
const filtroRelazione = document.querySelector("#filtro-relazione");
const filtroFonte = document.querySelector("#filtro-fonte");
const voci = document.querySelectorAll(".voce");

function applicaFiltri() {
  const lingua = filtroLingua.value;
  const relazione = filtroRelazione.value;
  const fonte = filtroFonte.value;

  voci.forEach(function (voce) {
    const haRelazione =
      relazione === "" || voce.querySelector(".relazione-" + relazione);
    const testoFonti = voce.querySelector(".fonti").textContent.toLowerCase();
    const haFonte = fonte === "" || testoFonti.includes(fonte);
    voce.hidden = !(haRelazione && haFonte);
  });

  document.querySelectorAll(".lingua-en").forEach(function (elemento) {
    elemento.hidden = lingua === "it";
  });

  document.querySelectorAll(".lingua-it").forEach(function (elemento) {
    elemento.hidden = lingua === "en";
  });

}

filtroLingua.addEventListener("change", applicaFiltri);
filtroRelazione.addEventListener("change", applicaFiltri);
filtroFonte.addEventListener("change", applicaFiltri);

applicaFiltri();
