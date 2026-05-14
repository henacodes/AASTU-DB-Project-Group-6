// ============================================================
// AASTU — University Student Meal Tracking System
// MongoDB Implementation 
// ============================================================

// -------------------------------
// 0. SELECT DATABASE
// -------------------------------
use("meal_tracking_db");
print("Database selected");


// -------------------------------
// 1. DROP OLD COLLECTIONS
// -------------------------------
db.students.drop();
db.meal_sessions.drop();
db.menus.drop();
db.meal_transactions.drop();


// -------------------------------
// 2. CREATE COLLECTIONS
// -------------------------------
db.createCollection("students");
db.createCollection("meal_sessions");
db.createCollection("menus");
db.createCollection("meal_transactions");


// -------------------------------
// 3. INSERT SAMPLE DATA
// -------------------------------

// --- students ---
db.students.insertMany([
  { Student_ID: "STU001", Full_Name: "Abebe Girma", Department: "Software Engineering" },
  { Student_ID: "STU002", Full_Name: "Tigist Haile", Department: "Computer Science" },
  { Student_ID: "STU003", Full_Name: "Yonas Tesfaye", Department: "Electrical Engineering" },
  { Student_ID: "STU004", Full_Name: "Hiwot Bekele", Department: "Civil Engineering" },
  { Student_ID: "STU005", Full_Name: "Dawit Alemu", Department: "Mechanical Engineering" },
  { Student_ID: "STU006", Full_Name: "Selam Tadesse", Department: "Software Engineering" }
]);

// --- meal sessions ---
db.meal_sessions.insertMany([
  { Session_ID: "SES001", Session_Name: "Breakfast", Start_Time: "06:30", End_Time: "09:00" },
  { Session_ID: "SES002", Session_Name: "Lunch",     Start_Time: "12:00", End_Time: "14:30" },
  { Session_ID: "SES003", Session_Name: "Dinner",    Start_Time: "18:00", End_Time: "20:30" }
]);

// --- menus ---
db.menus.insertMany([
  { Menu_ID: "MNU001", Session_ID: "SES001", Menu_Date: "2025-06-01", Food_Items: ["Firfir", "Egg", "Tea"] },
  { Menu_ID: "MNU002", Session_ID: "SES002", Menu_Date: "2025-06-01", Food_Items: ["Shiro", "Injera", "Salad"] },
  { Menu_ID: "MNU003", Session_ID: "SES003", Menu_Date: "2025-06-01", Food_Items: ["Tibs", "Injera", "Juice"] }
]);

// --- meal transactions ---
db.meal_transactions.insertMany([
  { Transaction_ID: "TRX001", Student_ID: "STU001", Session_ID: "SES001", Transaction_Date: "2025-06-01", Status: "Success" },
  { Transaction_ID: "TRX002", Student_ID: "STU002", Session_ID: "SES001", Transaction_Date: "2025-06-01", Status: "Success" },
  { Transaction_ID: "TRX003", Student_ID: "STU001", Session_ID: "SES001", Transaction_Date: "2025-06-02", Status: "Duplicate Attempt" },
  { Transaction_ID: "TRX004", Student_ID: "STU001", Session_ID: "SES002", Transaction_Date: "2025-06-01", Status: "Success" }
]);


// -------------------------------
// 4. BUSINESS RULE INDEX
// -------------------------------
// Prevent a student from eating twice in the same session on the same day
db.meal_transactions.createIndex(
  { Student_ID: 1, Session_ID: 1, Transaction_Date: 1 },
  { unique: true }
);


// -------------------------------
// 5. BASIC READ QUERIES
// -------------------------------

// All students
print("All students");
db.students.find().forEach(printjson);

// All breakfast menus
print("All breakfast menus");
db.menus.find({ Session_ID: "SES001" }).forEach(printjson);

// All successful transactions
print("All successful transactions");
db.meal_transactions.find({ Status: "Success" }).forEach(printjson);

// Transactions for a specific student
print("Transactions for STU001");
db.meal_transactions.find({ Student_ID: "STU001" }).forEach(printjson);


// -------------------------------
// 6. UPDATE QUERIES
// -------------------------------

// Update student department
printjson(db.students.updateOne(
  { Student_ID: "STU003" },
  { $set: { Department: "Software Engineering" } }
));


// -------------------------------
// 7. DELETE QUERIES
// -------------------------------

// Delete a duplicate attempt
printjson(db.meal_transactions.deleteOne({ Transaction_ID: "TRX003" }));


// -------------------------------
// 8. AGGREGATION PIPELINES
// -------------------------------

// A. Count meals per session
print("Count meals per session");
db.meal_transactions.aggregate([
  { $match: { Status: "Success" } },
  { $group: { _id: "$Session_ID", Total: { $sum: 1 } } }
]).forEach(printjson);

// B. Count meals per student
print("Count meals per student");
db.meal_transactions.aggregate([
  { $match: { Status: "Success" } },
  { $group: { _id: "$Student_ID", Meals: { $sum: 1 } } }
]).forEach(printjson);

// C. Join: Show transactions with student names
print("Transactions with student names");
db.meal_transactions.aggregate([
  {
    $lookup: {
      from: "students",
      localField: "Student_ID",
      foreignField: "Student_ID",
      as: "Student_Info"
    }
  },
  { $unwind: "$Student_Info" }
  ]).forEach(printjson);
