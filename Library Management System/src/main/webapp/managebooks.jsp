<%@ page import = "java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Books</title>
    <style>
    .content-container{
        display: flex;
        flex-direction: column;
    }
    .book-data-input{
        width: 90%;
        border-radius: 15px;
        background-color: #f2f2f2 ;
        margin: auto;
        padding: 40px;
    }

    .book-data-box{
        width: 100%;
        align-items: center;
        justify-content: space-between;
        display: flex;
        flex-direction: column;
    }
    .book-data-field input{
        border-radius: 5px;
        padding: 10px ;
        width: 250px;
        font-size: 16px;
        background-color: #fffff;
        border: none;
        color: rgb(0, 0, 0);
        outline-style: none;
    }

    .book-data-input input:hover{
        background-color: rgb(251, 251, 251) ;
    }

    .book-data-input button{
        padding: 10px 30px;
        width: 270px;
        background-color: yellowgreen;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        color: white;
        border: none;
    }

    .book-data-input button:hover{
        background-color:  rgb(128,156,19);
        color: white;
        cursor: pointer;
    }
    .book-data-field {
    	display: flex;
    	flex-direction: column;
    }
    
    .form-container
    {
    display:flex;
    flex-wrap:wrap;
    gap:10px;
    justify-content:space-between;
    }
    
    .submit-style
    {
    	margin-top: 20px;
    	display:flex;
    	justify-content: center;
    	align-items: center;	
    }
</style>
</head>
<script src="https://cdn.tailwindcss.com"></script>
<body>
<jsp:include page="includes/adminsidebar.jsp" />
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String admin = (String)session.getAttribute("admin");
		if(admin == null){ %>
			<script>document.location = './login.jsp';</script>
		<% }%>
  <div class=" overflow-x-auto  mt-14 pt-5 ml-64 ">
    <div class="content-container">
        <div class="book-data-input">
            <div class="book-data-box">
            	<form action="AddBook" method="post">
            	<div class="form-container">
            		<div class="book-data-field">
            	<label>ISBN</label>
                <input type="number" name="isbn" placeholder="ISBN" required>
                </div>
                <div class="book-data-field">
                <label>Title</label>
                <input type="text" name="title" placeholder="Title" required>
                </div>
                <div class="book-data-field">
                <label>Author</label>
                <input type="text" name="author" placeholder="Author" required>
                </div>
                <div class="book-data-field">
                <label>Publisher</label>
                <input type="text" name="publisher" placeholder="Publisher" required>
                </div>
                <div class="book-data-field">
                <label>Edition</label>
                <input type="text" name="edition" placeholder="Edition" required>
                </div>
                <div class="book-data-field">
                <label>Category</label>
                <input type="text" name="genre" placeholder="Category" required>
                </div>
                <div class="book-data-field">
                <label>No Of Copies</label>
                <input type="number" name="no_of_copies" min="1" placeholder="No of copies" required>
                </div>
            	</div>
            	<div class="submit-style">
            	<button type="submit" class="submit-button">ADD BOOK</button>            	
            	</div>
                </form>
             </div>
        </div>
    </div>
</div>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
        Statement st = con.createStatement();
        String sql = "SELECT * FROM books";
        ResultSet rs = st.executeQuery(sql);
%>
<div class="mt-14 pt-5 ml-64 ">
    <div class="content-container">
        <div class="book-data-input">
        	<div class="text-center text-3xl text-semibold mb-5 italic">
        		Search Book
        	</div>
            <div class="book-data-box">
            	<form method="post">
            	<div class="form-container">
            		<div class="book-data-field">
            	<label>ISBN</label>
                <input type="number" name="isbn" placeholder="ISBN" id="isbn_input">
                </div>
                <div class="book-data-field">
                <label>Title</label>
                <input type="text" name="title" placeholder="Title" id="title_input">
                </div>
                <div class="book-data-field">
                <label>Author</label>
                <input type="text" name="author" placeholder="Author" id="author_input">
                </div>
                <div class="book-data-field">
                <label>Publisher</label>
                <input type="text" name="publisher" placeholder="Publisher" id="publisher_input">
                </div>
                <div class="book-data-field">
                <label>Edition</label>
                <input type="text" name="edition" placeholder="Edition" id="edition_input">
                </div>
                <div class="book-data-field">
                <label>Category</label>
                <input type="text" name="genre" placeholder="Category" id="genre_input">
                </div>                
            	</div>            	
                </form>
             </div>
        </div>
    </div>
</div>
<div class="overflow-x-auto shadow-md sm:rounded-lg mt-14 pt-5 ml-64">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3 text-center">ISBN</th>
                <th scope="col" class="px-6 py-3 text-center">Book Title</th>
                <th scope="col" class="px-6 py-3 text-center">Author</th>
                <th scope="col" class="px-6 py-3 text-center">Publisher</th>
                <th scope="col" class="px-6 py-3 text-center">Edition</th>
                <th scope="col" class="px-6 py-3 text-center">Total Copies</th>
                <th scope="col" class="px-6 py-3 text-center">Available Copies</th>
                <th scope="col" class="px-6 py-3 text-center">Update</th>
                <th scope="col" class="px-6 py-3 text-center">Delete</th>
            </tr>
        </thead>
        <tbody>
            <% while(rs.next()) { %>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 book_details">
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 text-center whitespace-nowrap dark:text-white book_isbn">
                    <%= rs.getString("isbn") %>
                </th>
                <td class="px-6 py-4 text-center book_title">
                    <%= rs.getString("title") %>
                </td>
                <td class="px-6 py-4 text-center book_author">
                    <%= rs.getString("author") %>
                </td>
                <td class="px-6 py-4 text-center book_publisher">
                    <%= rs.getString("publisher") %>
                </td>
                <input type="hidden" value="<%= rs.getString("genre") %>" class="book_genre">
                <td class="px-6 py-4 text-center book_edition">
                    <%= rs.getString("edition") %>
                </td>
                <td class="px-6 py-4 text-center">
                    <%= rs.getString("no_of_copies") %>
                </td>
                <td class="px-6 py-4 text-center">
                    <%= rs.getString("availability") %>
                </td>
                <td class="px-6 py-4 text-center">
                    <a href="./editbooks.jsp?isbn=<%= rs.getString("isbn") %>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                </td>
                <td class="px-6 py-4 text-center">
                     <form action="DeleteBook" method="post">
        				<input type="hidden" name="isbn" value="<%= rs.getString("isbn") %>">
                    	<button type="submit" class="font-medium text-red-600 dark:text-red-500 hover:underline"> Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
        rs.close();
        st.close();
        con.close();
    } catch (ClassNotFoundException | SQLException e) {
        out.println(e.getMessage());
    }
%>
  <script>
  function searchBooks() {
	    const isbnInput = document.getElementById('isbn_input').value.toLowerCase();
	    const titleInput = document.getElementById('title_input').value.toLowerCase();
	    const authorInput = document.getElementById('author_input').value.toLowerCase();
	    const editionInput = document.getElementById('edition_input').value.toLowerCase();
	    const publisherInput = document.getElementById('publisher_input').value.toLowerCase();
	    const genreInput = document.getElementById('genre_input').value.toLowerCase();

	    const bookDetails = document.querySelectorAll('.book_details');

	    bookDetails.forEach((book) => {
	        const isbn = book.querySelector('.book_isbn').textContent.toLowerCase();
	        const title = book.querySelector('.book_title').textContent.toLowerCase();
	        const author = book.querySelector('.book_author').textContent.toLowerCase();
	        const edition = book.querySelector('.book_edition').textContent.toLowerCase();
	        const publisher = book.querySelector('.book_publisher').textContent.toLowerCase();
	        const genre = book.querySelector('.book_genre').textContent.toLowerCase();

	        const isbnMatch = isbn.includes(isbnInput) || !isbnInput;
	        const titleMatch = title.includes(titleInput) || !titleInput;
	        const authorMatch = author.includes(authorInput) || !authorInput;
	        const editionMatch = edition.includes(editionInput) || !editionInput;
	        const publisherMatch = publisher.includes(publisherInput) || !publisherInput;
	        const genreMatch = genre.includes(genreInput) || !genreInput;

	        if (isbnMatch && titleMatch && authorMatch && editionMatch && publisherMatch && genreMatch) {
	            book.style.display = ''; 
	        } else {
	            book.style.display = 'none'; 
	        }
	    });
	}

	document.getElementById('isbn_input').addEventListener('input', searchBooks);
	document.getElementById('title_input').addEventListener('input', searchBooks);
	document.getElementById('author_input').addEventListener('input', searchBooks);
	document.getElementById('edition_input').addEventListener('input', searchBooks);
	document.getElementById('publisher_input').addEventListener('input', searchBooks);
	document.getElementById('genre_input').addEventListener('input', searchBooks);

  </script>
</body>
</html>