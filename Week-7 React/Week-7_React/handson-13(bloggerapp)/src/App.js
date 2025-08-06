import React, { useState } from "react";
import BookDetails from "./BookDetails";
import BlogDetails from "./BlogDetails";
import CourseDetails from "./CourseDetails";

function App() {
  const [activeSection, setActiveSection] = useState("blog");

  let sectionComponent;

  // Using switch for conditional rendering
  switch (activeSection) {
    case "book":
      sectionComponent = <BookDetails />;
      break;
    case "course":
      sectionComponent = <CourseDetails />;
      break;
    default:
      sectionComponent = <BlogDetails />;
  }

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1> Blogger App</h1>

      <div style={{ marginBottom: "15px" }}>
        <button onClick={() => setActiveSection("book")}>Show Books</button>
        <button onClick={() => setActiveSection("blog")}>Show Blogs</button>
        <button onClick={() => setActiveSection("course")}>Show Courses</button>
      </div>

      {/* Ternary rendering can be used here too */}
      {sectionComponent}
    </div>
  );
}

export default App;
