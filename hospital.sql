-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2018 at 06:31 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BILLID` int(11) NOT NULL,
  `AMOUNT` double DEFAULT NULL,
  `PATIENT_PTID` int(11) NOT NULL,
  `PRESCRIPTION_PRESID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BILLID`, `AMOUNT`, `PATIENT_PTID`, `PRESCRIPTION_PRESID`) VALUES
(5000, 25, 99, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `consists_of`
--

CREATE TABLE `consists_of` (
  `PRESCRIPTION_PRESID` int(11) NOT NULL,
  `MEDICINE_MEDID` int(11) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consists_of`
--

INSERT INTO `consists_of` (`PRESCRIPTION_PRESID`, `MEDICINE_MEDID`, `QUANTITY`) VALUES
(458, 1000, 10),
(1021, 1000, 0),
(2000, 1000, 5),
(4656, 1000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `deptt`
--

CREATE TABLE `deptt` (
  `DEPTID` int(11) NOT NULL,
  `DEPTNAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deptt`
--

INSERT INTO `deptt` (`DEPTID`, `DEPTNAME`) VALUES
(1, 'CARDIO'),
(2, 'opdp'),
(3, 'cancer'),
(12, 'staff'),
(13, 'nurses');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DOCID` int(11) NOT NULL,
  `DOCNAME` varchar(50) DEFAULT NULL,
  `DEPT_DEPTID` int(11) NOT NULL,
  `SAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DOCID`, `DOCNAME`, `DEPT_DEPTID`, `SAL`) VALUES
(10, 'ZAIR', 1, 1000),
(45, 'Hassaan', 2, 100000),
(486, 'Ali', 3, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `domestic_staff`
--

CREATE TABLE `domestic_staff` (
  `DSID` int(11) NOT NULL,
  `DSNAME` varchar(50) DEFAULT NULL,
  `DEPT_DEPTID` int(11) NOT NULL,
  `SAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domestic_staff`
--

INSERT INTO `domestic_staff` (`DSID`, `DSNAME`, `DEPT_DEPTID`, `SAL`) VALUES
(789, 'Riaz', 12, 26633),
(4866, 'Amir', 12, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

CREATE TABLE `has` (
  `PHARMACY_PHARID` int(11) NOT NULL,
  `MEDICINE_MEDID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `has`
--

INSERT INTO `has` (`PHARMACY_PHARID`, `MEDICINE_MEDID`) VALUES
(1100, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `MEDID` int(11) NOT NULL,
  `MEDNAME` varchar(50) DEFAULT NULL,
  `PRODUCER` varchar(50) DEFAULT NULL,
  `PRICE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`MEDID`, `MEDNAME`, `PRODUCER`, `PRICE`) VALUES
(0, '', '', 0),
(11, 'sting', 'pepsi', 60),
(56, 'desprine', 'gsk', 10),
(1000, 'AVIL', 'GSK', 5);

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `NURSEID` int(11) NOT NULL,
  `NURNAME` varchar(50) DEFAULT NULL,
  `DEPT_DEPTID` int(11) NOT NULL,
  `SAL` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`NURSEID`, `NURNAME`, `DEPT_DEPTID`, `SAL`) VALUES
(47, 'Hira', 13, 4560),
(48, 'Kiran', 13, 45300);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PTID` int(11) NOT NULL,
  `PTNAME` varchar(50) DEFAULT NULL,
  `HISTORY` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PTID`, `PTNAME`, `HISTORY`) VALUES
(99, 'MAREEZ', 'SOME TEXT'),
(123, 'taha', 'cough'),
(142, 'rija', 'cough');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `PHARID` int(11) NOT NULL,
  `PHARNAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`PHARID`, `PHARNAME`) VALUES
(1100, 'NISAR');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `PRESID` int(11) NOT NULL,
  `PHARMACY_PHARID` int(11) NOT NULL,
  `DOCTOR_DOCID` int(11) NOT NULL,
  `COST` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`PRESID`, `PHARMACY_PHARID`, `DOCTOR_DOCID`, `COST`) VALUES
(53, 1100, 10, 513),
(200, 1100, 10, 500),
(458, 1100, 45, 20),
(1021, 1100, 10, 1230),
(2000, 1100, 10, 900),
(4656, 1100, 45, 5);

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE `research` (
  `RESID` int(11) NOT NULL,
  `RESNAME` varchar(50) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `DEPT_DEPTID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `research`
--

INSERT INTO `research` (`RESID`, `RESNAME`, `START_DATE`, `DEPT_DEPTID`) VALUES
(100, 'GENETICS', '2018-12-03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `researches_on`
--

CREATE TABLE `researches_on` (
  `NO_OF_HRS` int(11) DEFAULT NULL,
  `DOCTOR_DOCID` int(11) NOT NULL,
  `RESEARCH_RESID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `researches_on`
--

INSERT INTO `researches_on` (`NO_OF_HRS`, `DOCTOR_DOCID`, `RESEARCH_RESID`) VALUES
(20, 10, 100);

-- --------------------------------------------------------

--
-- Table structure for table `treat`
--

CREATE TABLE `treat` (
  `PATIENT_PTID` int(11) NOT NULL,
  `DOCTOR_DOCID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treat`
--

INSERT INTO `treat` (`PATIENT_PTID`, `DOCTOR_DOCID`) VALUES
(99, 10),
(99, 45),
(123, 45);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BILLID`),
  ADD KEY `BILL_PATIENT_FK` (`PATIENT_PTID`),
  ADD KEY `BILL_PRESCRIPTION_FK` (`PRESCRIPTION_PRESID`);

--
-- Indexes for table `consists_of`
--
ALTER TABLE `consists_of`
  ADD PRIMARY KEY (`PRESCRIPTION_PRESID`,`MEDICINE_MEDID`),
  ADD KEY `COSISTS_OF_MEDICINE_FK` (`MEDICINE_MEDID`);

--
-- Indexes for table `deptt`
--
ALTER TABLE `deptt`
  ADD PRIMARY KEY (`DEPTID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DOCID`),
  ADD KEY `DOCTOR_DEPT_FK` (`DEPT_DEPTID`);

--
-- Indexes for table `domestic_staff`
--
ALTER TABLE `domestic_staff`
  ADD PRIMARY KEY (`DSID`),
  ADD KEY `DOMESTIC_STAFF_DEPT_FK` (`DEPT_DEPTID`);

--
-- Indexes for table `has`
--
ALTER TABLE `has`
  ADD PRIMARY KEY (`PHARMACY_PHARID`,`MEDICINE_MEDID`),
  ADD KEY `HAS_MEDICINE_FK` (`MEDICINE_MEDID`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`MEDID`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`NURSEID`),
  ADD KEY `NURSE_DEPT_FK` (`DEPT_DEPTID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PTID`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`PHARID`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`PRESID`),
  ADD KEY `PRESCRIPTION_DOCTOR_FK` (`DOCTOR_DOCID`),
  ADD KEY `PRESCRIPTION_PHARMACY_FK` (`PHARMACY_PHARID`);

--
-- Indexes for table `research`
--
ALTER TABLE `research`
  ADD PRIMARY KEY (`RESID`),
  ADD KEY `RESEARCH_DEPT_FK` (`DEPT_DEPTID`);

--
-- Indexes for table `researches_on`
--
ALTER TABLE `researches_on`
  ADD PRIMARY KEY (`DOCTOR_DOCID`,`RESEARCH_RESID`),
  ADD KEY `RESEARCHES_ON_RESEARCH_FK` (`RESEARCH_RESID`);

--
-- Indexes for table `treat`
--
ALTER TABLE `treat`
  ADD PRIMARY KEY (`PATIENT_PTID`,`DOCTOR_DOCID`),
  ADD KEY `TREAT_DOCTOR_FK` (`DOCTOR_DOCID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `BILL_PATIENT_FK` FOREIGN KEY (`PATIENT_PTID`) REFERENCES `patient` (`PTID`),
  ADD CONSTRAINT `BILL_PRESCRIPTION_FK` FOREIGN KEY (`PRESCRIPTION_PRESID`) REFERENCES `prescription` (`PRESID`);

--
-- Constraints for table `consists_of`
--
ALTER TABLE `consists_of`
  ADD CONSTRAINT `COSISTS_OF_MEDICINE_FK` FOREIGN KEY (`MEDICINE_MEDID`) REFERENCES `medicine` (`MEDID`),
  ADD CONSTRAINT `COSISTS_OF_PRESCRIPTION_FK` FOREIGN KEY (`PRESCRIPTION_PRESID`) REFERENCES `prescription` (`PRESID`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `DOCTOR_DEPT_FK` FOREIGN KEY (`DEPT_DEPTID`) REFERENCES `deptt` (`DEPTID`);

--
-- Constraints for table `domestic_staff`
--
ALTER TABLE `domestic_staff`
  ADD CONSTRAINT `DOMESTIC_STAFF_DEPT_FK` FOREIGN KEY (`DEPT_DEPTID`) REFERENCES `deptt` (`DEPTID`);

--
-- Constraints for table `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `HAS_MEDICINE_FK` FOREIGN KEY (`MEDICINE_MEDID`) REFERENCES `medicine` (`MEDID`),
  ADD CONSTRAINT `HAS_PHARMACY_FK` FOREIGN KEY (`PHARMACY_PHARID`) REFERENCES `pharmacy` (`PHARID`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `NURSE_DEPT_FK` FOREIGN KEY (`DEPT_DEPTID`) REFERENCES `deptt` (`DEPTID`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `PRESCRIPTION_DOCTOR_FK` FOREIGN KEY (`DOCTOR_DOCID`) REFERENCES `doctor` (`DOCID`),
  ADD CONSTRAINT `PRESCRIPTION_PHARMACY_FK` FOREIGN KEY (`PHARMACY_PHARID`) REFERENCES `pharmacy` (`PHARID`);

--
-- Constraints for table `research`
--
ALTER TABLE `research`
  ADD CONSTRAINT `RESEARCH_DEPT_FK` FOREIGN KEY (`DEPT_DEPTID`) REFERENCES `deptt` (`DEPTID`);

--
-- Constraints for table `researches_on`
--
ALTER TABLE `researches_on`
  ADD CONSTRAINT `RESEARCHES_ON_DOCTOR_FK` FOREIGN KEY (`DOCTOR_DOCID`) REFERENCES `doctor` (`DOCID`),
  ADD CONSTRAINT `RESEARCHES_ON_RESEARCH_FK` FOREIGN KEY (`RESEARCH_RESID`) REFERENCES `research` (`RESID`);

--
-- Constraints for table `treat`
--
ALTER TABLE `treat`
  ADD CONSTRAINT `TREAT_DOCTOR_FK` FOREIGN KEY (`DOCTOR_DOCID`) REFERENCES `doctor` (`DOCID`),
  ADD CONSTRAINT `TREAT_PATIENT_FK` FOREIGN KEY (`PATIENT_PTID`) REFERENCES `patient` (`PTID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
