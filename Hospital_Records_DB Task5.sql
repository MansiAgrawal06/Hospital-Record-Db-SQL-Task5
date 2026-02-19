CREATE DATABASE Hospital_Records_DB;
USE Hospital_Records_DB;

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    salary DECIMAL(10,2),
    experience_years INT
);

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    city VARCHAR(100),
    age INT
);

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    fees DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    diagnosis VARCHAR(255),
    prescription TEXT,
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) 
    REFERENCES Appointments(appointment_id)
    ON DELETE CASCADE
);

CREATE TABLE Bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    bill_date DATE,
    FOREIGN KEY (patient_id) 
    REFERENCES Patients(patient_id)
    ON DELETE CASCADE
);

-- Doctors
INSERT INTO Doctors (name, specialization, salary, experience_years)
VALUES
('Dr. Sharma', 'Cardiologist', 80000, 10),
('Dr. Mehta', 'Neurologist', 90000, 12),
('Dr. Khan', 'Orthopedic', 70000, 8),
('Dr. Verma', 'Dermatologist', 65000, 6),
('Dr. Patel', 'Pediatrician', 72000, 9),
('Dr. Roy', 'General Physician', 60000, 5),
('Dr. Iyer', 'Cardiologist', 95000, 15),
('Dr. Thomas', 'Neurologist', 88000, 11),
('Dr. Gupta', 'Orthopedic', 75000, 7),
('Dr. Nair', 'ENT Specialist', 68000, 6);

-- Patients
INSERT INTO Patients (name, gender, city, age)
VALUES
('Riya', 'Female', 'Delhi', 22),
('Aman', 'Male', 'Aligarh', 25),
('Sara', 'Female', 'Delhi', 20),
('Karan', 'Male', 'Mumbai', 30),
('Neha', 'Female', 'Lucknow', 27),
('Arjun', 'Male', 'Delhi', 35),
('Pooja', 'Female', 'Noida', 24),
('Rahul', 'Male', 'Jaipur', 28),
('Ananya', 'Female', 'Delhi', 19),
('Vikram', 'Male', 'Agra', 40);


-- Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, fees)
VALUES
(1, 1, '2026-02-10', 1500),
(2, 2, '2026-02-11', 2000),
(3, 1, '2026-02-12', 1500),
(4, 3, '2026-02-13', 1200),
(5, 4, '2026-02-14', 1000),
(6, 5, '2026-02-15', 1300),
(7, 6, '2026-02-16', 1100),
(8, 7, '2026-02-17', 1400),
(9, 8, '2026-02-18', 1500),
(10, 9, '2026-02-19', 1600);

-- Treatments
INSERT INTO Treatments (appointment_id, diagnosis, prescription, treatment_cost)
VALUES
(1, 'Heart Checkup', 'Blood test + ECG', 2000),
(2, 'Migraine', 'Painkillers for 5 days', 1500),
(3, 'Bone Fracture', 'X-Ray + Cast', 3000),
(4, 'Skin Allergy', 'Antibiotics for 7 days', 1200),
(5, 'Child Fever', 'Syrup + Rest', 1000),
(6, 'General Checkup', 'Vitamin Supplements', 800),
(7, 'Back Pain', 'Physiotherapy', 1800);

-- Bills
INSERT INTO Bills (patient_id, total_amount, payment_method, payment_status, bill_date)
VALUES
(1, 2000, 'Cash', 'Paid', '2026-02-10'),
(2, 1500, 'UPI', 'Paid', '2026-02-11'),
(3, 3000, 'Card', 'Pending', '2026-02-12'),
(4, 1200, 'Cash', 'Paid', '2026-02-13'),
(5, 1000, 'UPI', 'Paid', '2026-02-14'),
(6, 800, 'Card', 'Pending', '2026-02-15'),
(7, 1800, 'Cash', 'Paid', '2026-02-16');

-- JOINS

-- INNER JOIN
SELECT 
    Patients.name,
    Doctors.name,
    Appointments.appointment_date
FROM Appointments
INNER JOIN Patients 
    ON Appointments.patient_id = Patients.patient_id
INNER JOIN Doctors 
    ON Appointments.doctor_id = Doctors.doctor_id;
    
    -- LEFT JOIN
    SELECT 
    Patients.name,
    Appointments.appointment_date
FROM Patients
LEFT JOIN Appointments
    ON Patients.patient_id = Appointments.patient_id;
    
    -- RIGHT JOIN
    SELECT 
    Doctors.name,
    Appointments.appointment_date
FROM Patients
RIGHT JOIN Appointments
    ON Patients.patient_id = Appointments.patient_id
RIGHT JOIN Doctors
    ON Appointments.doctor_id = Doctors.doctor_id;
    
    -- FULL JOIN
    SELECT 
    Patients.name,
    Doctors.name
FROM Patients
LEFT JOIN Appointments
    ON Patients.patient_id = Appointments.patient_id
LEFT JOIN Doctors
    ON Appointments.doctor_id = Doctors.doctor_id

UNION

SELECT 
    Patients.name,
    Doctors.name
FROM Patients
RIGHT JOIN Appointments
    ON Patients.patient_id = Appointments.patient_id
RIGHT JOIN Doctors
    ON Appointments.doctor_id = Doctors.doctor_id;



