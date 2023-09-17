// Get the "Add Item" button and the search elements
var addItemButton = document.getElementById('additem_button');
var searchInput = document.getElementById('searchInput');
var searchButton = document.getElementById('searchButton');
let noResultImage =  document.getElementById("results");



// Hide the search input initially
searchInput.style.display = 'none';

// Add click event listener to the search button
searchButton.addEventListener('click', function () {
  // Toggle the visibility of the elements
  if (searchInput.style.display === 'none') {
    searchInput.style.display = 'block';
    
    addItemButton.style.display = 'none';
  } else {
    searchInput.style.display = 'none';
    addItemButton.style.display = 'block';
     
    location.reload();
  }
});


// Get the table body element
let tableBody = document.getElementById('tableBody');


// Add event listener to the search input
searchInput.addEventListener('input', function () {
  let searchValue = searchInput.value.toLowerCase();
  let rows = tableBody.getElementsByTagName('tr');
  let matchFound = false;
  for (let i = 0; i < rows.length; i++) {
    let cells = rows[i].getElementsByTagName('td');
    let rowMatchFound = false;

    for (let j = 0; j < cells.length; j++) {
      let cellText = cells[j].textContent.toLowerCase();

      // Check if the cell text starts with the search value
      if (cellText.startsWith(searchValue)) {
        rowMatchFound = true;
        break;
      }
    }

    // Show/hide the row based on the match
    if (rowMatchFound) {
      rows[i].style.display = '';
      matchFound = true; 
    } else {
      rows[i].style.display = 'none';
    }
  }

  // Show/hide the no result image and change the background color
  if (matchFound) {
    noResultImage.style.display = 'none';
    tableBody.style.backgroundColor = ''; 
  } else {
    noResultImage.style.display = 'block';
    tableBody.style.backgroundColor = 'rgba(235, 231, 228, 255)';
  }
});
