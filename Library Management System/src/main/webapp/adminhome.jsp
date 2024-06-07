<%@ page import = "java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
    .content-container{
        display: flex;
        flex-direction: column;
    }

      .entry-data-input {
        width: 75%;
        border-radius: 15px;
        background-color: #f2f2f2;
        margin: auto;
        padding: 40px;
        display: flex; /* Set display to flex */
        justify-content: center; /* Align items horizontally */
    }

    .entry-data-box {
        display: flex; /* Set display to flex */
        flex-direction: row; /* Set flex direction to row */
        gap: 20px;
        align-items: center; /* Align items vertically */
    }

    .entry-data-box label,
    .entry-data-box input,
    .entry-data-box button {
        margin: 0; 
    }

    .entry-data-input input{
        border-radius: 5px;
        display: inline;
        padding: 10px 30px ;
        width: 270px;
        font-size: 16px;
        background-color: #fffff;
        border: none;
        color: rgb(0, 0, 0);
        outline-style: none;
    }

    .entry-data-input input:hover{
        background-color: rgb(251, 251, 251) ;
    }

    .entry-data-input button{
        padding: 10px 15px;
        width: 180px;
        background-color: yellowgreen;
        border-radius: 5px;
        font-size: 16px;
        font-weight: 600;
        color: white;
        border: none;
    }

    .entry-data-input button:hover{
        background-color:  rgb(128,156,19);
        color: white;
        cursor: pointer;
    }
</style>
</head>
<script src="https://cdn.tailwindcss.com"></script>
<body>

<jsp:include page="includes/adminsidebar.jsp" />
  
  <html lang="en"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <script src="https://cdn.tailwindcss.com"></script>
    <title>AdminPage</title>
<style>/* ! tailwindcss v3.4.3 | MIT License | https://tailwindcss.com */*,::after,::before{box-sizing:border-box;border-width:0;border-style:solid;border-color:#e5e7eb}::after,::before{--tw-content:''}:host,html{line-height:1.5;-webkit-text-size-adjust:100%;-moz-tab-size:4;tab-size:4;font-family:ui-sans-serif, system-ui, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";font-feature-settings:normal;font-variation-settings:normal;-webkit-tap-highlight-color:transparent}body{margin:0;line-height:inherit}hr{height:0;color:inherit;border-top-width:1px}abbr:where([title]){-webkit-text-decoration:underline dotted;text-decoration:underline dotted}h1,h2,h3,h4,h5,h6{font-size:inherit;font-weight:inherit}a{color:inherit;text-decoration:inherit}b,strong{font-weight:bolder}code,kbd,pre,samp{font-family:ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;font-feature-settings:normal;font-variation-settings:normal;font-size:1em}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sub{bottom:-.25em}sup{top:-.5em}table{text-indent:0;border-color:inherit;border-collapse:collapse}button,input,optgroup,select,textarea{font-family:inherit;font-feature-settings:inherit;font-variation-settings:inherit;font-size:100%;font-weight:inherit;line-height:inherit;letter-spacing:inherit;color:inherit;margin:0;padding:0}button,select{text-transform:none}button,input:where([type=button]),input:where([type=reset]),input:where([type=submit]){-webkit-appearance:button;background-color:transparent;background-image:none}:-moz-focusring{outline:auto}:-moz-ui-invalid{box-shadow:none}progress{vertical-align:baseline}::-webkit-inner-spin-button,::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}summary{display:list-item}blockquote,dd,dl,figure,h1,h2,h3,h4,h5,h6,hr,p,pre{margin:0}fieldset{margin:0;padding:0}legend{padding:0}menu,ol,ul{list-style:none;margin:0;padding:0}dialog{padding:0}textarea{resize:vertical}input::placeholder,textarea::placeholder{opacity:1;color:#9ca3af}[role=button],button{cursor:pointer}:disabled{cursor:default}audio,canvas,embed,iframe,img,object,svg,video{display:block;vertical-align:middle}img,video{max-width:100%;height:auto}[hidden]{display:none}*, ::before, ::after{--tw-border-spacing-x:0;--tw-border-spacing-y:0;--tw-translate-x:0;--tw-translate-y:0;--tw-rotate:0;--tw-skew-x:0;--tw-skew-y:0;--tw-scale-x:1;--tw-scale-y:1;--tw-pan-x: ;--tw-pan-y: ;--tw-pinch-zoom: ;--tw-scroll-snap-strictness:proximity;--tw-gradient-from-position: ;--tw-gradient-via-position: ;--tw-gradient-to-position: ;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: ;--tw-numeric-spacing: ;--tw-numeric-fraction: ;--tw-ring-inset: ;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-color:rgb(59 130 246 / 0.5);--tw-ring-offset-shadow:0 0 #0000;--tw-ring-shadow:0 0 #0000;--tw-shadow:0 0 #0000;--tw-shadow-colored:0 0 #0000;--tw-blur: ;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: ;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: ;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: ;--tw-backdrop-brightness: ;--tw-backdrop-contrast: ;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: ;--tw-backdrop-invert: ;--tw-backdrop-opacity: ;--tw-backdrop-saturate: ;--tw-backdrop-sepia: ;--tw-contain-size: ;--tw-contain-layout: ;--tw-contain-paint: ;--tw-contain-style: }::backdrop{--tw-border-spacing-x:0;--tw-border-spacing-y:0;--tw-translate-x:0;--tw-translate-y:0;--tw-rotate:0;--tw-skew-x:0;--tw-skew-y:0;--tw-scale-x:1;--tw-scale-y:1;--tw-pan-x: ;--tw-pan-y: ;--tw-pinch-zoom: ;--tw-scroll-snap-strictness:proximity;--tw-gradient-from-position: ;--tw-gradient-via-position: ;--tw-gradient-to-position: ;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: ;--tw-numeric-spacing: ;--tw-numeric-fraction: ;--tw-ring-inset: ;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-color:rgb(59 130 246 / 0.5);--tw-ring-offset-shadow:0 0 #0000;--tw-ring-shadow:0 0 #0000;--tw-shadow:0 0 #0000;--tw-shadow-colored:0 0 #0000;--tw-blur: ;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: ;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: ;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: ;--tw-backdrop-brightness: ;--tw-backdrop-contrast: ;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: ;--tw-backdrop-invert: ;--tw-backdrop-opacity: ;--tw-backdrop-saturate: ;--tw-backdrop-sepia: ;--tw-contain-size: ;--tw-contain-layout: ;--tw-contain-paint: ;--tw-contain-style: }.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0, 0, 0, 0);white-space:nowrap;border-width:0}.fixed{position:fixed}.left-0{left:0px}.top-0{top:0px}.z-40{z-index:40}.mb-4{margin-bottom:1rem}.ms-3{margin-inline-start:0.75rem}.mt-2{margin-top:0.5rem}.flex{display:flex}.inline-flex{display:inline-flex}.grid{display:grid}.h-28{height:7rem}.h-5{height:1.25rem}.h-6{height:1.5rem}.h-full{height:100%}.h-screen{height:100vh}.w-5{width:1.25rem}.w-6{width:1.5rem}.w-64{width:16rem}.flex-1{flex:1 1 0%}.-translate-x-full{--tw-translate-x:-100%;transform:translate(var(--tw-translate-x), var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y))}.grid-cols-2{grid-template-columns:repeat(2, minmax(0, 1fr))}.grid-cols-3{grid-template-columns:repeat(3, minmax(0, 1fr))}.items-center{align-items:center}.justify-center{justify-content:center}.gap-4{gap:1rem}.space-y-2 > :not([hidden]) ~ :not([hidden]){--tw-space-y-reverse:0;margin-top:calc(0.5rem * calc(1 - var(--tw-space-y-reverse)));margin-bottom:calc(0.5rem * var(--tw-space-y-reverse))}.overflow-y-auto{overflow-y:auto}.whitespace-nowrap{white-space:nowrap}.rounded{border-radius:0.25rem}.rounded-lg{border-radius:0.5rem}.border-2{border-width:2px}.border-dashed{border-style:dashed}.border-gray-200{--tw-border-opacity:1;border-color:rgb(229 231 235 / var(--tw-border-opacity))}.bg-gray-100{--tw-bg-opacity:1;background-color:rgb(243 244 246 / var(--tw-bg-opacity))}.bg-gray-50{--tw-bg-opacity:1;background-color:rgb(249 250 251 / var(--tw-bg-opacity))}.p-2{padding:0.5rem}.p-4{padding:1rem}.px-3{padding-left:0.75rem;padding-right:0.75rem}.py-4{padding-top:1rem;padding-bottom:1rem}.font-sans{font-family:ui-sans-serif, system-ui, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"}.text-2xl{font-size:1.5rem;line-height:2rem}.text-3xl{font-size:1.875rem;line-height:2.25rem}.text-sm{font-size:0.875rem;line-height:1.25rem}.font-medium{font-weight:500}.text-gray-300{--tw-text-opacity:1;color:rgb(209 213 219 / var(--tw-text-opacity))}.text-gray-400{--tw-text-opacity:1;color:rgb(156 163 175 / var(--tw-text-opacity))}.text-gray-500{--tw-text-opacity:1;color:rgb(107 114 128 / var(--tw-text-opacity))}.text-gray-900{--tw-text-opacity:1;color:rgb(17 24 39 / var(--tw-text-opacity))}.transition{transition-property:color, background-color, border-color, fill, stroke, opacity, box-shadow, transform, filter, -webkit-text-decoration-color, -webkit-backdrop-filter;transition-property:color, background-color, border-color, text-decoration-color, fill, stroke, opacity, box-shadow, transform, filter, backdrop-filter;transition-property:color, background-color, border-color, text-decoration-color, fill, stroke, opacity, box-shadow, transform, filter, backdrop-filter, -webkit-text-decoration-color, -webkit-backdrop-filter;transition-timing-function:cubic-bezier(0.4, 0, 0.2, 1);transition-duration:150ms}.transition-transform{transition-property:transform;transition-timing-function:cubic-bezier(0.4, 0, 0.2, 1);transition-duration:150ms}.duration-75{transition-duration:75ms}.hover\:bg-gray-100:hover{--tw-bg-opacity:1;background-color:rgb(243 244 246 / var(--tw-bg-opacity))}.focus\:outline-none:focus{outline:2px solid transparent;outline-offset:2px}.focus\:ring-2:focus{--tw-ring-offset-shadow:var(--tw-ring-inset) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);--tw-ring-shadow:var(--tw-ring-inset) 0 0 0 calc(2px + var(--tw-ring-offset-width)) var(--tw-ring-color);box-shadow:var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow, 0 0 #0000)}.focus\:ring-gray-200:focus{--tw-ring-opacity:1;--tw-ring-color:rgb(229 231 235 / var(--tw-ring-opacity))}.group:hover .group-hover\:text-gray-900{--tw-text-opacity:1;color:rgb(17 24 39 / var(--tw-text-opacity))}@media (min-width: 640px){.sm\:ml-64{margin-left:16rem}.sm\:hidden{display:none}.sm\:translate-x-0{--tw-translate-x:0px;transform:translate(var(--tw-translate-x), var(--tw-translate-y)) rotate(var(--tw-rotate)) skewX(var(--tw-skew-x)) skewY(var(--tw-skew-y)) scaleX(var(--tw-scale-x)) scaleY(var(--tw-scale-y))}}@media (prefers-color-scheme: dark){.dark\:border-gray-700{--tw-border-opacity:1;border-color:rgb(55 65 81 / var(--tw-border-opacity))}.dark\:bg-gray-800{--tw-bg-opacity:1;background-color:rgb(31 41 55 / var(--tw-bg-opacity))}.dark\:text-gray-400{--tw-text-opacity:1;color:rgb(156 163 175 / var(--tw-text-opacity))}.dark\:text-gray-500{--tw-text-opacity:1;color:rgb(107 114 128 / var(--tw-text-opacity))}.dark\:text-white{--tw-text-opacity:1;color:rgb(255 255 255 / var(--tw-text-opacity))}.dark\:hover\:bg-gray-700:hover{--tw-bg-opacity:1;background-color:rgb(55 65 81 / var(--tw-bg-opacity))}.dark\:focus\:ring-gray-600:focus{--tw-ring-opacity:1;--tw-ring-color:rgb(75 85 99 / var(--tw-ring-opacity))}.group:hover .dark\:group-hover\:text-white{--tw-text-opacity:1;color:rgb(255 255 255 / var(--tw-text-opacity))}}</style></head>
<body>
	<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String admin = (String)session.getAttribute("admin");
		if(admin == null){ %>
			<script>document.location = './login.jsp';</script>
		<% }%>
    <%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "");
	Statement st = con.createStatement();
	String sql;
	ResultSet rs;
	sql = "SELECT count(*) AS no_of_students from students";
	rs = st.executeQuery(sql);
	rs.next();
	String no_of_students = rs.getString("no_of_students");
	sql = "SELECT count(*) AS no_of_books from books";
	rs = st.executeQuery(sql);
	rs.next();
	String no_of_books = rs.getString("no_of_books");
	sql = "SELECT count(*) AS no_of_readers from readers";
	rs = st.executeQuery(sql);
	rs.next();
	String no_of_readers = rs.getString("no_of_readers");
	sql = "SELECT count(*) AS no_of_overduebooks from issue WHERE curdate() > DATE_ADD(issue_date, INTERVAL 14 DAY) AND return_date IS NULL";
	rs = st.executeQuery(sql);
	rs.next();
	String no_of_overduebooks = rs.getString("no_of_overduebooks");
    %>
<button data-drawer-target="default-sidebar" data-drawer-toggle="default-sidebar" aria-controls="default-sidebar" type="button" class="inline-flex items-center p-2 mt-2 ms-3 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
    <span class="sr-only">Open sidebar</span>
    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
    <path clip-rule="evenodd" fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
    </svg>
 </button>
 
 <div class="p-4 sm:ml-64 mt-20">
    <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">
       <div class="grid grid-cols-2 gap-4 mb-4">
          <div class="flex items-center justify-center h-28 width-full rounded bg-gray-50 dark:bg-gray-800 hover:scale-105">
             <p class="text-2xl text-gray-400 dark:text-gray-500 text-center">
             		<%= no_of_students %> <br>
                <span class="text-center">Students</span>             	
             </p>
          </div>
          <div class="flex items-center justify-center h-28 rounded bg-gray-50 dark:bg-gray-800 hover:scale-105">
             <p class="text-2xl text-gray-400 dark:text-gray-500 text-center">
             		<%= no_of_books %>
             	<br>
                <span>Books</span>
             </p>
          </div>
          <div class="flex items-center justify-center h-28 rounded bg-gray-50 dark:bg-gray-800 hover:scale-105">
            <p class="text-2xl text-gray-400 dark:text-gray-500 text-center">
             		<%= no_of_readers %>
             	<br>
               <span class="text-center">Students Inside Library</span>
            </p>
         </div>
          <div class="flex items-center justify-center h-28 rounded bg-gray-50 dark:bg-gray-800 hover:scale-105">
             <p class="text-2xl text-gray-400 dark:text-gray-500 text-center">
             		<%= no_of_overduebooks %>
             		<br>
                <span>Overdue Copies</span>
             </p>
             <br>
          </div>
       </div>
    </div>
 </div>
<div class=" overflow-x-auto  mt-4 pt-5 ml-64 ">
    <div class="content-container">
        <div class="entry-data-input">
            <div class="entry-data-box">
            	<form action="UpdateReaders" method="post">
            	<label>Enter Roll Number: </label>
                <input type="number" name="rollno" placeholder="Roll Number">
                <button type="submit">Add Student</button>
                </form>
            </div>
        </div>
    </div>
</div>
 <div class="p-4 sm:ml-64 mt-10">
    <div class="border-2 rounded-lg dark:border-gray-700">
        <div class="bg-gray-100">
            <p class="text-3xl font-sans flex items-center justify-center p-4">Students Inside Library</p>
        </div>
        <div class="grid grid-cols-3 text-gray-700 mb-4 border-b p-4">
            <div class="flex items-center justify-center">
                ID
            </div>
            <div class="flex items-center justify-center">
                Name
            </div>
            <div class="flex items-center justify-center">Time CheckedIn</div>
        </div>
        <%
        	sql = "SELECT s.rollno, CONCAT(s.firstname, ' ', s.lastname) AS name, entry_time FROM students s, readers r WHERE s.rollno=r.rollno;";
        	rs = st.executeQuery(sql);
        %>
        <%while(rs.next()){ %>
        <div class="text-center items-center">
            <div class="grid grid-cols-3 p-4 ">
                <div><%= rs.getString("rollno") %></div>
                <div ><%= rs.getString("name") %></div>
                <div><%= rs.getString("entry_time") %></div>
            </div>
           </div>
            <%} %>
    </div>

 </div>

</body></html>

</body>
</html>