-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2023 at 06:38 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `letstextify`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Recipe_DML` (IN `In_RecipeId` INT, IN `In_RecipeName` VARCHAR(100), IN `In_ROIx` INT, IN `In_ROIy` INT, IN `In_ROIWidth` INT, IN `In_ROIHeight` INT, IN `In_TrainFile` VARCHAR(100), IN `In_Datatype` VARCHAR(100), IN `In_PSMValue` INT, IN `In_OEMValue` INT, IN `In_ScaleFactor` INT, IN `In_Erode` INT, IN `In_Dilate` INT, IN `In_Smooth` INT, IN `In_ThresholdMethod` INT(11), IN `In_ThresholdMin` INT, IN `In_ThresholdMax` INT, IN `In_CharMinWidth` INT, IN `In_CharMinHight` INT, IN `In_CharMaxWidth` INT, IN `In_CharMaxHeight` INT, IN `In_IsWhiteOnBlack` BOOLEAN, IN `In_OperationMode` INT)   BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    START TRANSACTION;

	IF In_OperationMode = 0 THEN
    
INSERT INTO `recipemaster`(
    `RecipeName`,
    `ROIx`,
    `ROIy`,
    `ROIWidth`,
    `ROIHeight`,
    `TrainFile`,
    `Datatype`,
    `PSMValue`,
    `OEMValue`,
    `ScaleFactor`,
    `Erode`,
    `Dilate`,
    `Smooth`,
    `ThresholdMethod`,
    `ThresholdMin`,
    `ThresholdMax`,
    `CharMinWidth`,
    `CharMinHight`,
    `CharMaxWidth`,
    `CharMaxHeight`,
            `IsWhiteOnBlack`
        ) VALUES (
    In_RecipeName,
    In_ROIx,
    In_ROIy,
    In_ROIWidth,
    In_ROIHeight,
    In_TrainFile,
    In_Datatype,
    In_PSMValue,
    In_OEMValue,
    In_ScaleFactor,
    In_Erode,
    In_Dilate,
    In_Smooth,
    In_ThresholdMethod,
    In_ThresholdMin,
    In_ThresholdMax,
    In_CharMinWidth,
    In_CharMinHight,
    In_CharMaxWidth,
    In_CharMaxHeight,
    In_IsWhiteOnBlack
) ;
INSERT INTO audittrail (
    Operation,
    RecipeId,
    AuditMessage
)
VALUES (
    "Insert",
    LAST_INSERT_ID(),
    CONCAT(
        'New Recipe Name: ',
        In_RecipeName,
        '; ',
        'New ROI x: ',
        In_ROIx,
        '; ',
        'New ROI y: ',
        In_ROIy,
        '; ',
        'New ROI Width: ',
        In_ROIWidth,
        '; ',
        'New ROI Height: ',
        In_ROIHeight,
        '; ',
        'New Train File: ',
        In_TrainFile,
        '; ',
        'New Datatype: ',
        In_Datatype,
        '; ',
        'New PSM Value: ',
        In_PSMValue,
        '; ',
        'New OEM Value: ',
        In_OEMValue,
        '; ',
        'New Scale Factor: ',
        In_ScaleFactor,
        '; ',
        'New Erode Value: ',
        In_Erode,
        '; ',
        'New Dilate Value: ',
        In_Dilate,
        '; ',
        'New Smooth Value: ',
        In_Smooth,
        '; ',
        'New Threshold Method: ',
        In_ThresholdMethod,
        '; ',
        'New Threshold Min: ',
        In_ThresholdMin,
        '; ',
        'New Threshold Max: ',
        In_ThresholdMax,
        '; ',
        'New Character Min Width: ',
        In_CharMinWidth,
        '; ',
        'New Character Min Height: ',
        In_CharMinHight,
        '; ',
        'New Character Max Width: ',
        In_CharMaxWidth,
        '; ',
        'New Character Max Height: ',
        In_CharMaxHeight,
        '; ',
        'New Is White On Black: ',
        In_IsWhiteOnBlack,
        ';'
    )
);

    ELSEIF In_OperationMode = 1 THEN
UPDATE
    `recipemaster`
SET
    `RecipeName` = In_RecipeName,
    `ROIx` = In_ROIx,
    `ROIy` = In_ROIy,
    `ROIWidth` = In_ROIWidth,
    `ROIHeight` = In_ROIHeight,
    `TrainFile` = In_TrainFile,
    `Datatype` = In_Datatype,
    `PSMValue` = In_PSMValue,
    `OEMValue` = In_OEMValue,
    `ScaleFactor` = In_ScaleFactor,
    `Erode` = In_Erode,
    `Dilate` = In_Dilate,
    `Smooth` = In_Smooth,
    `ThresholdMethod` = In_ThresholdMethod,
    `ThresholdMin` = In_ThresholdMin,
    `ThresholdMax` = In_ThresholdMax,
    `CharMinWidth` = In_CharMinWidth,
    `CharMinHight` = In_CharMinHight,
    `CharMaxWidth` = In_CharMaxWidth,
    `CharMaxHeight` = In_CharMaxHeight,
    `IsWhiteOnBlack` = In_IsWhiteOnBlack
WHERE
    `RecipeId` LIKE In_RecipeId ;
INSERT INTO audittrail(
    Operation,
    RecipeId,
    AuditMessage
)
VALUES(
    "Update",
    In_RecipeId,
    CONCAT(
        'New Recipe Name: ',
        In_RecipeName,
        '; ',
        'New ROI x: ',
        In_ROIx,
        '; ',
        'New ROI y: ',
        In_ROIy,
        '; ',
        'New ROI Width: ',
        In_ROIWidth,
        '; ',
        'New ROI Height: ',
        In_ROIHeight,
        '; ',
        'New Train File: ',
        In_TrainFile,
        '; ',
        'New Datatype: ',
        In_Datatype,
        '; ',
        'New PSM Value: ',
        In_PSMValue,
        '; ',
        'New OEM Value: ',
        In_OEMValue,
        '; ',
        'New Scale Factor: ',
        In_ScaleFactor,
        '; ',
        'New Erode Value: ',
        In_Erode,
        '; ',
        'New Dilate Value: ',
        In_Dilate,
        '; ',
        'New Smooth Value: ',
        In_Smooth,
        '; ',
        'New Threshold Method: ',
        In_ThresholdMethod,
        '; ',
        'New Threshold Min: ',
        In_ThresholdMin,
        '; ',
        'New Threshold Max: ',
        In_ThresholdMax,
        '; ',
        'New Character Min Width: ',
        In_CharMinWidth,
        '; ',
        'New Character Min Height: ',
        In_CharMinHight,
        '; ',
        'New Character Max Width: ',
        In_CharMaxWidth,
        '; ',
        'New Character Max Height: ',
        In_CharMaxHeight,
        '; ',
        'New Is White On Black: ',
        In_IsWhiteOnBlack,
        ';'
    )
);
ELSEIF In_OperationMode = 2 THEN
UPDATE
    `recipemaster`
SET
    `IsEnabled` = 0
WHERE
    `RecipeId` LIKE In_RecipeId ;
INSERT INTO audittrail(
    Operation,
    RecipeId,
    AuditMessage
)
VALUES(
    "Delete",
    In_RecipeId,
    CONCAT(
        'Deleted Recipe Id: ',
        In_RecipeId,
        ';'
    )
);
END IF ;

IF `_rollback` THEN
ROLLBACK;
    INSERT INTO errorlogmaster (query) VALUES (
        CONCAT(
            'Operation Mode: ', In_OperationMode, '; ',
            'New Recipe Name: ', In_RecipeName, '; ',
            'New ROI x: ', In_ROIx, '; ',
            'New ROI y: ', In_ROIy, '; ',
            'New ROI Width: ', In_ROIWidth, '; ',
            'New ROI Height: ', In_ROIHeight, '; ',
            'New Train File: ', In_TrainFile, '; ',
            'New Datatype: ', In_Datatype, '; ',
            'New PSM Value: ', In_PSMValue, '; ',
            'New OEM Value: ', In_OEMValue, '; ',
            'New Scale Factor: ', In_ScaleFactor, '; ',
            'New Erode Value: ', In_Erode, '; ',
            'New Dilate Value: ', In_Dilate, '; ',
            'New Smooth Value: ', In_Smooth, '; ',
            'New Threshold Method: ', In_ThresholdMethod, '; ',
            'New Threshold Min: ', In_ThresholdMin, '; ',
            'New Threshold Max: ', In_ThresholdMax, '; ',
            'New Character Min Width: ', In_CharMinWidth, '; ',
            'New Character Min Height: ', In_CharMinHight, '; ',
            'New Character Max Width: ', In_CharMaxWidth, '; ',
            'New Character Max Height: ', In_CharMaxHeight, '; ',
            'New Is White On Black: ', In_IsWhiteOnBlack, ';'
        )
    );
    
ELSE
    COMMIT;
END IF;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Recipe_Getdata` (IN `In_RecipeId` INT)   BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    START TRANSACTION;
    
    IF In_RecipeId IS NOT NULL AND In_RecipeId != 0 THEN
        SELECT * FROM `recipemaster` WHERE `RecipeId` = In_RecipeId AND `IsEnabled` = 1;
    ELSE
        SELECT * FROM `recipemaster` WHERE `IsEnabled` = 1;
    END IF;
    
    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `audittrail`
--

CREATE TABLE `audittrail` (
  `AuditId` int(11) NOT NULL,
  `Operation` varchar(100) NOT NULL,
  `RecipeId` int(11) NOT NULL,
  `AuditMessage` varchar(500) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audittrail`
--

INSERT INTO `audittrail` (`AuditId`, `Operation`, `RecipeId`, `AuditMessage`, `Timestamp`) VALUES
(1, 'Update', 10, 'New Recipe Name: test; New ROI x: 2; New ROI y: 96; New ROI Width: 41; New ROI Height: 10; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-16 03:05:10'),
(2, 'Insert', 16, 'New Recipe Name: twer; New ROI x: 4; New ROI y: 53; New ROI Width: 97; New ROI Height: 51; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-16 16:04:25'),
(3, 'Insert', 17, 'New Recipe Name: qwerq\\; New ROI x: 28; New ROI y: 14; New ROI Width: 122; New ROI Height: 106; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-16 16:43:03'),
(7, 'Insert', 18, 'New Recipe Name: afasdfasdf; New ROI x: 28; New ROI y: 14; New ROI Width: 94; New ROI Height: 31; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-16 16:51:06'),
(8, 'Delete', 18, 'Deleted Recipe Id: 18;', '2023-05-16 16:51:24'),
(9, 'Delete', 17, 'Deleted Recipe Id: 17;', '2023-05-17 02:07:50'),
(10, 'Insert', 19, 'New Recipe Name: axdas; New ROI x: 2; New ROI y: 50; New ROI Width: 115; New ROI Height: 28; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 3; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-18 02:49:21'),
(11, 'Update', 9, 'New Recipe Name: ABC; New ROI x: 17; New ROI y: 30; New ROI Width: 34; New ROI Height: 9; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 4; New Erode Value: 1; New Dilate Value: 0; New Smooth Value: 3; New Threshold Method: 0; New Threshold Min: 150; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-18 02:49:58'),
(12, 'Delete', 19, 'Deleted Recipe Id: 19;', '2023-05-18 02:50:03'),
(13, 'Delete', 16, 'Deleted Recipe Id: 16;', '2023-05-18 02:50:05'),
(14, 'Insert', 20, 'New Recipe Name: testt; New ROI x: 1; New ROI y: 27; New ROI Width: 53; New ROI Height: 7; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-19 03:05:46'),
(15, 'Insert', 21, 'New Recipe Name: Testwt; New ROI x: 6; New ROI y: 25; New ROI Width: 66; New ROI Height: 14; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-19 08:09:10'),
(16, 'Insert', 22, 'New Recipe Name: daf; New ROI x: 2; New ROI y: 41; New ROI Width: 116; New ROI Height: 58; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-19 08:27:03'),
(17, 'Insert', 23, 'New Recipe Name: Test Recipe; New ROI x: 11; New ROI y: 95; New ROI Width: 534; New ROI Height: 259; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-19 17:12:50'),
(18, 'Insert', 24, 'New Recipe Name: NewBookPages; New ROI x: 8; New ROI y: 6; New ROI Width: 568; New ROI Height: 368; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 150; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-19 17:30:52'),
(19, 'Insert', 25, 'New Recipe Name: ,n; New ROI x: 31; New ROI y: 10; New ROI Width: 513; New ROI Height: 364; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-20 02:55:03'),
(20, 'Update', 25, 'New Recipe Name: ,n; New ROI x: 31; New ROI y: 10; New ROI Width: 513; New ROI Height: 364; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-20 02:57:11'),
(21, 'Insert', 26, 'New Recipe Name: jkh; New ROI x: 93; New ROI y: 41; New ROI Width: 400; New ROI Height: 300; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-20 02:58:42'),
(22, 'Update', 26, 'New Recipe Name: jkh; New ROI x: 93; New ROI y: 41; New ROI Width: 400; New ROI Height: 300; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-20 03:00:13'),
(23, 'Delete', 1, 'Deleted Recipe Id: 1;', '2023-05-20 05:57:27'),
(24, 'Delete', 2, 'Deleted Recipe Id: 2;', '2023-05-20 05:57:30'),
(25, 'Delete', 3, 'Deleted Recipe Id: 3;', '2023-05-20 05:57:30'),
(26, 'Delete', 5, 'Deleted Recipe Id: 5;', '2023-05-20 05:57:31'),
(27, 'Delete', 8, 'Deleted Recipe Id: 8;', '2023-05-20 05:57:31'),
(28, 'Delete', 9, 'Deleted Recipe Id: 9;', '2023-05-20 05:57:32'),
(29, 'Delete', 10, 'Deleted Recipe Id: 10;', '2023-05-20 05:57:33'),
(30, 'Delete', 20, 'Deleted Recipe Id: 20;', '2023-05-20 05:57:35'),
(31, 'Delete', 21, 'Deleted Recipe Id: 21;', '2023-05-20 05:57:35'),
(32, 'Delete', 25, 'Deleted Recipe Id: 25;', '2023-05-20 05:57:43'),
(33, 'Delete', 26, 'Deleted Recipe Id: 26;', '2023-05-20 05:57:46'),
(34, 'Delete', 22, 'Deleted Recipe Id: 22;', '2023-05-20 05:57:48'),
(35, 'Insert', 27, 'New Recipe Name: test2; New ROI x: 18; New ROI y: 10; New ROI Width: 549; New ROI Height: 358; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 3; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 150; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-20 08:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `errorlogmaster`
--

CREATE TABLE `errorlogmaster` (
  `ErrorLogID` int(11) NOT NULL,
  `Query` varchar(500) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `errorlogmaster`
--

INSERT INTO `errorlogmaster` (`ErrorLogID`, `Query`, `Timestamp`) VALUES
(3, 'Operation Mode: 0; New Recipe Name: retqwe; New ROI x: 28; New ROI y: 14; New ROI Width: 94; New ROI Height: 31; New Train File: eng; New Datatype: ASCII; New PSM Value: 3; New OEM Value: 3; New Scale Factor: 0; New Erode Value: 0; New Dilate Value: 0; New Smooth Value: 0; New Threshold Method: 0; New Threshold Min: 100; New Threshold Max: 255; New Character Min Width: 5; New Character Min Height: 15; New Character Max Width: 5; New Character Max Height: 15; New Is White On Black: 0;', '2023-05-16 16:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `recipemaster`
--

CREATE TABLE `recipemaster` (
  `RecipeId` int(11) NOT NULL,
  `RecipeName` varchar(100) NOT NULL,
  `ROIx` int(11) NOT NULL,
  `ROIy` int(11) NOT NULL,
  `ROIWidth` int(11) NOT NULL,
  `ROIHeight` int(11) NOT NULL,
  `TrainFile` varchar(100) NOT NULL,
  `Datatype` varchar(100) NOT NULL,
  `PSMValue` int(11) NOT NULL,
  `OEMValue` int(11) NOT NULL,
  `ScaleFactor` int(11) NOT NULL,
  `Erode` int(11) NOT NULL,
  `Dilate` int(11) NOT NULL,
  `Smooth` int(11) NOT NULL,
  `ThresholdMethod` int(11) NOT NULL,
  `ThresholdMin` int(11) NOT NULL,
  `ThresholdMax` int(11) NOT NULL,
  `CharMinWidth` int(11) NOT NULL,
  `CharMinHight` int(11) NOT NULL,
  `CharMaxWidth` int(11) NOT NULL,
  `CharMaxHeight` int(11) NOT NULL,
  `IsWhiteOnBlack` tinyint(1) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IsEnabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipemaster`
--

INSERT INTO `recipemaster` (`RecipeId`, `RecipeName`, `ROIx`, `ROIy`, `ROIWidth`, `ROIHeight`, `TrainFile`, `Datatype`, `PSMValue`, `OEMValue`, `ScaleFactor`, `Erode`, `Dilate`, `Smooth`, `ThresholdMethod`, `ThresholdMin`, `ThresholdMax`, `CharMinWidth`, `CharMinHight`, `CharMaxWidth`, `CharMaxHeight`, `IsWhiteOnBlack`, `CreatedDate`, `UpdatedDate`, `IsEnabled`) VALUES
(1, 'dfgsd', 57, 80, 181, 47, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 1, 100, 255, 5, 15, 5, 15, 0, '2023-04-26 03:17:45', '2023-05-20 05:57:27', 0),
(2, 'sdfgsdfg', 7, 166, 131, 19, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 1, 100, 255, 5, 15, 5, 15, 0, '2023-04-26 03:23:55', '2023-05-20 05:57:30', 0),
(3, 'M,M,', 347, 25, 123, 24, 'eng', 'ASCII', 3, 3, 3, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-04 19:59:25', '2023-05-20 05:57:30', 0),
(4, '', 349, 26, 153, 21, 'eng', 'ASCII', 3, 3, 3, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-04 20:06:18', '2023-05-05 03:28:58', 0),
(5, 'dhfgh', 156, 92, 35, 19, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-04 20:12:20', '2023-05-20 05:57:31', 0),
(6, '', 347, 25, 132, 21, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-04 20:15:04', '2023-05-05 07:04:05', 0),
(7, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-04 20:46:56', '2023-05-05 03:28:50', 0),
(8, 'TMP', 377, 291, 152, 35, 'eng', 'ASCII', 8, 3, 3, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-05 03:39:05', '2023-05-20 05:57:31', 0),
(9, 'ABC', 17, 30, 34, 9, 'eng', 'ASCII', 3, 3, 4, 1, 0, 3, 0, 150, 255, 5, 15, 5, 15, 0, '2023-05-05 03:51:32', '2023-05-20 05:57:32', 0),
(10, 'test', 2, 96, 41, 10, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-05 04:48:37', '2023-05-20 05:57:33', 0),
(16, 'twer', 4, 53, 97, 51, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-16 16:04:25', '2023-05-18 02:50:05', 0),
(17, 'qwerq\\', 28, 14, 122, 106, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-16 16:43:03', '2023-05-17 02:07:50', 0),
(18, 'afasdfasdf', 28, 14, 94, 31, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-16 16:51:06', '2023-05-16 16:51:24', 0),
(19, 'axdas', 2, 50, 115, 28, 'eng', 'ASCII', 3, 3, 3, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-18 02:49:21', '2023-05-18 02:50:03', 0),
(20, 'testt', 1, 27, 53, 7, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-19 03:05:46', '2023-05-20 05:57:35', 0),
(21, 'Testwt', 6, 25, 66, 14, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-19 08:09:10', '2023-05-20 05:57:35', 0),
(22, 'daf', 2, 41, 116, 58, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-19 08:27:03', '2023-05-20 05:57:48', 0),
(23, 'Test Recipe', 11, 95, 534, 259, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-19 17:12:50', '2023-05-19 17:12:50', 1),
(24, 'NewBookPages', 8, 6, 568, 368, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 150, 255, 5, 15, 5, 15, 0, '2023-05-19 17:30:52', '2023-05-19 17:30:52', 1),
(25, ',n', 31, 10, 513, 364, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-20 02:55:03', '2023-05-20 05:57:43', 0),
(26, 'jkh', 93, 41, 400, 300, 'eng', 'ASCII', 3, 3, 0, 0, 0, 0, 0, 100, 255, 5, 15, 5, 15, 0, '2023-05-20 02:58:42', '2023-05-20 05:57:46', 0),
(27, 'test2', 18, 10, 549, 358, 'eng', 'ASCII', 3, 3, 3, 0, 0, 0, 0, 150, 255, 5, 15, 5, 15, 0, '2023-05-20 08:11:18', '2023-05-20 08:11:18', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audittrail`
--
ALTER TABLE `audittrail`
  ADD PRIMARY KEY (`AuditId`);

--
-- Indexes for table `errorlogmaster`
--
ALTER TABLE `errorlogmaster`
  ADD PRIMARY KEY (`ErrorLogID`);

--
-- Indexes for table `recipemaster`
--
ALTER TABLE `recipemaster`
  ADD PRIMARY KEY (`RecipeId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audittrail`
--
ALTER TABLE `audittrail`
  MODIFY `AuditId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `errorlogmaster`
--
ALTER TABLE `errorlogmaster`
  MODIFY `ErrorLogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipemaster`
--
ALTER TABLE `recipemaster`
  MODIFY `RecipeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
