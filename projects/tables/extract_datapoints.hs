-- Read CSV file, split it to tables, extract values from tables
-- "gdp.csv" -> [Table] -> [Value]

type Row = [String]
type Rows = [[String]]
type RowFormat = [Char]

data Table = Table {
    headerRows :: Rows,
    dataRows :: Rows
    }
    deriving (Show)    

data Frequency = Annual | Quarter | Month deriving (Show)   

data Datapoint = Datapoint {
    name :: String,
    unit :: String,
    year :: Int,
    month :: Maybe Int,
    freq :: Frequency,
    value :: Float
    }    
    deriving (Show)

splitRow :: RowFormat -> Row -> [Datapoint]
splitRow "qqqq" row = [p1, p1, p2, p2] where year = head(row)

-- assume all datarows have same number of columns
ncol :: Table -> Int
ncol t = (length $ head (dataRows t)) - 1 

m12 = concat (replicate 12 "m")

colToFormat :: Int -> String
colToFormat n = case n of 
    4 -> "qqqq"
    5 -> "aqqqq"
    12 -> m12
    17 -> "aqqqq" ++ m12

getFormat :: Table -> RowFormat
getFormat t = colToFormat $ ncol t 

getValues :: Table -> [Datapoint]
getValues t = 
    -- todo: Must applly to all rows
    splitter $ head (dataRows t)
    -- partial application, splitter will expect a row as an argument
    where splitter = splitRow (getFormat t)


h1 = [["GDP"], ["% change to year earlier"]]       
d1 = [["2017","100,6","102,5","102,2","100,9"], ["2018","101,3","101,9","101,5",""]]
t1 = Table h1 d1
p1 = Datapoint "GDP" "bln_rub" 2017 Nothing (Annual::Frequency) 60000
p2 = Datapoint {name = "GDP", unit = "bln_rub", year = 2017, month = Nothing, freq = Annual, value = 60000}  
vs = getValues(t1)    
