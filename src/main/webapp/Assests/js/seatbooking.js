const container = document.querySelector(".container");
const seats = document.querySelectorAll(".row .seat:not(.sold)");
const seats_selected = document.querySelectorAll(".row .seat ")
const count = document.getElementById("count");








// Update  count
function updateSelectedCount() {
  const selectedSeats = document.querySelectorAll(".row .seat.selected");

  const seatsIndex = [...selectedSeats].map((seat) => [...seats_selected].indexOf(seat)+1);

  localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));


  count.innerText = seatsIndex;
  
console.log(seatsIndex)
console.log(JSON.parse(localStorage.getItem("selectedSeats")).length)
  
}



// Seat click event
container.addEventListener("click", (e) => {
 
 


  if (
    e.target.classList.contains("seat") &&
    !e.target.classList.contains("sold") 
  ) {
	  removeDisable();
  for(let i=0; i<seats_selected.length; i++){
    if (seats_selected[i].classList.contains("selected")){
      seats_selected[i].classList.remove("selected")
    }
  }
    e.target.classList.toggle("selected");
    updateSelectedCount();
  }
 


  
});

function removeDisable() {
  let element = document.getElementById("confirm");
  element.classList.remove("disable");
}



// Define the index of the seat you want to close (e.g., 4 for the 5th seat)




