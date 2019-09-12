library(RODBC)
my <- odbcConnect("mysql", uid="root", pwd="root1234");
sqlQuery(my, "show databases");

### 02 DB사용 및 테이블 검색
sqlQuery(my, "use mysql;")
sqlQuery(my, "show tables;")

### 03 데이터 선택(select)
sqlQuery(my, "select * from db;")

### 04 DB 생성 및 삭제
sqlQuery(my, "DROP DATABASE `DB01`;");
sqlQuery(my, "show databases")
sql = paste("CREATE DATABASE `DB01` CHARACTER SET utf8 COLLATE utf8_general_ci;")
sqlQuery(my, sql);
sqlQuery(my, "show databases");

### 05 테이블 생성
sql = "use `db01`";
sqlQuery(my, "show databases");
sqlQuery(my, sql)
R_sql <- sqlQuery(my,"
        CREATE TABLE  `iris_tbl`  (
            Sepal_length FLOAT(3),
            Sepal_Width FLOAT(3),
            Petal_length FLOAT(3),
            Petal_Width FLOAT(3),
            Species VARCHAR(20)
        );
")
sqlQuery(my, "use db01;")
sqlQuery(my, "show tables;")


### 06 여러줄 SQL 명령 실행
exeQuery <- function(query) {
  res <- c()
  for (i in 1:length(query)) {
    # print(query[i])
    tmp <- sqlQuery(my,query[i])
    res <- list(res, tmp)
  }
  return (res)
}


v <- c(
  "INSERT INTO iris_tbl VALUES ( 4.7,3.2,1.3,0.2 ,'setosa');",
  "INSERT INTO iris_tbl VALUES ( 4.7,3.2,1.3,0.2 ,'setosa');",
  "INSERT INTO iris_tbl VALUES ( 4.5,3.2,1.3,0.2 ,'setosa');",
  "INSERT INTO iris_tbl VALUES ( 4.2,3.2,1.3,0.2 ,'versicolor');",
  "INSERT INTO iris_tbl VALUES ( 4.1,3.2,1.3,0.2 ,'versicolor');",
  "INSERT INTO iris_tbl VALUES ( 3.7,3.2,1.3,0.2 ,'virginica');",
  "INSERT INTO iris_tbl VALUES ( 3.7,3.2,1.3,0.2 ,'virginica');",
  "INSERT INTO iris_tbl VALUES ( 4.7,3.2,1.3,0.2 ,'virginica');",
  "select * from iris_tbl;")
exeQuery(v)

### 07 실습해 보기
#  (1) Titanic 데이터 셋의 테이블(titanic)을 만들어 보자.
#  컬럼명 : pclass, embarked, Age, survived 
#  (2) 데이터를 5개 넣고 이를 확인해 보자. 
