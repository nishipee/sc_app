document.addEventListener("DOMContentLoaded", function(){
  if ( document.getElementById("item-image")){
    const ImageList = document.getElementById("img-preview")

    const createImageHTML = (blob) => {

      const imageElement = document.createElement("div")
      const blobImage = document.createElement("img")
      blobImage.className = "p-image"
      blobImage.setAttribute("src", blob)

      imageElement.appendChild(blobImage)
      ImageList.appendChild(imageElement)
    }

    document.getElementById("item-image").addEventListener("change", function(e){

      const imageContent = document.querySelector("img.p-image")
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0]
      const blob = window.URL.createObjectURL(file)

      createImageHTML(blob)
    })
  }
})


