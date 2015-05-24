# QUIZ 1

```
http://www.statmethods.net/input/missingdata.html
http://swirlstats.com/
```
-
### Question 1
R was developed by statisticians working at:
```
The University of Auckland	Correct	1.00	The R language was developed by Ross Ihaka and Robert Gentleman who were statisticians at the University of Auckland in New Zealand.

```
-
### Question 2
The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?
```
1. The freedom to run the program, for any purpose.	
2. The freedom to improve the program, and release your improvements to the public, so that the whole community benefits.	
3. The freedom to redistribute copies so you can help your neighbor.
4. The freedom to sell the software for any price.	Correct	1.00	This is not part of the free software definition. The free software definition does not mention anything about selling software (although it does not disallow it).

```
-
### Question 3
In R the following are all atomic data types EXCEPT
```
1. integer	
2. logical	
3. numeric	
4. array	Correct	1.00	"array" is not an atomic data type in R.
```
-
### Question 4
If I execute the expression x <- 4L in R, what is the class of the object x as determined by the class() function?
```
1. integer	Correct	1.00	The L suffix creates an integer vector as opposed to a numeric vector.
2. numeric	
3. character	
4. matrix	
```
- 
-

### Question 5
What is the class of the object defined by the expression x <- c(4, 'a', TRUE)?
```
1. logical	
2. character	Correct	1.00	The character class is the lowest common denominator here and so all elements will be coerced into that class.
3. numeric	
4. integer	

Question Explanation
R does automatic coercion of vectors so that all elements of the vector are the same data class.
```
- 
-
### Question 6
If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?
```
1. a 3 by 3 matrix	
2. a vector of length 2	
3. a 3 by 2 numeric matrix	Correct	1.00	The 'cbind' function treats vectors as if they were columns of a matrix. It then takes those vectors and binds them together column-wise to create a matrix.
4. a vector of length 3	
```
-
### Question 7
A key property of vectors in R is that
```
1.elements of a vector can only be character or numeric	

2.elements of a vector can be of different classes	

3.a vector cannot have have attributes like dimensions	

4.elements of a vector all must be of the same class	Correct	1.00	

```
-
### Question 8
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me?
```
1. a numeric vector containing the element 2.	Correct	1.00	

2. a list containing a numeric vector of length 1.

3. a list containing the number 2.	

4. a character vector containing the element "2".	

```
-
### Question 9
Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?
```
1. a warning	
2. an integer vector with the values 3, 5, 5, 7.	Correct	1.00	
3. a numeric vector with the values 3, 5, 3, 4. 
4. an integer vector with the values 3, 5, 3, 4.	
```
-
### Question 10
Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this?
```
1. x[x < 6] <- 0	Correct	1.00	You can create a logical vector with the expression x < 6 and then use the [ operator to subset the original vector x.
2. x[x > 6] <- 0	
3. x[x == 6] <- 0	
4. x[x != 6] <- 0	

```
-
### Question 11
In the dataset provided for this Quiz, what are the column names of the dataset?
```
> dir()
[1] "functions.R"  "hw1_data.csv" "Untitled.R"  
> read.csv("hw1_data.csv")
    Ozone Solar.R Wind Temp Month Day
1      41     190  7.4   67     5   1
2      36     118  8.0   72     5   2
3      12     149 12.6   74     5   3
4      18     313 11.5   62     5   4
5      NA      NA 14.3   56     5   5
6      28      NA 14.9   66     5   6
7      23     299  8.6   65     5   7
8      19      99 13.8   59     5   8
9       8      19 20.1   61     5   9
10     NA     194  8.6   69     5  10
11      7      NA  6.9   74     5  11
12     16     256  9.7   69     5  12
13     11     290  9.2   66     5  13
14     14     274 10.9   68     5  14
15     18      65 13.2   58     5  15
16     14     334 11.5   64     5  16
17     34     307 12.0   66     5  17
18      6      78 18.4   57     5  18
19     30     322 11.5   68     5  19
20     11      44  9.7   62     5  20
21      1       8  9.7   59     5  21
22     11     320 16.6   73     5  22
23      4      25  9.7   61     5  23
24     32      92 12.0   61     5  24
25     NA      66 16.6   57     5  25
26     NA     266 14.9   58     5  26
27     NA      NA  8.0   57     5  27
28     23      13 12.0   67     5  28
29     45     252 14.9   81     5  29
30    115     223  5.7   79     5  30
31     37     279  7.4   76     5  31
32     NA     286  8.6   78     6   1
33     NA     287  9.7   74     6   2
34     NA     242 16.1   67     6   3
35     NA     186  9.2   84     6   4
36     NA     220  8.6   85     6   5
37     NA     264 14.3   79     6   6
38     29     127  9.7   82     6   7
39     NA     273  6.9   87     6   8
40     71     291 13.8   90     6   9
41     39     323 11.5   87     6  10
42     NA     259 10.9   93     6  11
43     NA     250  9.2   92     6  12
44     23     148  8.0   82     6  13
45     NA     332 13.8   80     6  14
46     NA     322 11.5   79     6  15
47     21     191 14.9   77     6  16
48     37     284 20.7   72     6  17
49     20      37  9.2   65     6  18
50     12     120 11.5   73     6  19
51     13     137 10.3   76     6  20
52     NA     150  6.3   77     6  21
53     NA      59  1.7   76     6  22
54     NA      91  4.6   76     6  23
55     NA     250  6.3   76     6  24
56     NA     135  8.0   75     6  25
57     NA     127  8.0   78     6  26
58     NA      47 10.3   73     6  27
59     NA      98 11.5   80     6  28
60     NA      31 14.9   77     6  29
61     NA     138  8.0   83     6  30
62    135     269  4.1   84     7   1
63     49     248  9.2   85     7   2
64     32     236  9.2   81     7   3
65     NA     101 10.9   84     7   4
66     64     175  4.6   83     7   5
67     40     314 10.9   83     7   6
68     77     276  5.1   88     7   7
69     97     267  6.3   92     7   8
70     97     272  5.7   92     7   9
71     85     175  7.4   89     7  10
72     NA     139  8.6   82     7  11
73     10     264 14.3   73     7  12
74     27     175 14.9   81     7  13
75     NA     291 14.9   91     7  14
76      7      48 14.3   80     7  15
77     48     260  6.9   81     7  16
78     35     274 10.3   82     7  17
79     61     285  6.3   84     7  18
80     79     187  5.1   87     7  19
81     63     220 11.5   85     7  20
82     16       7  6.9   74     7  21
83     NA     258  9.7   81     7  22
84     NA     295 11.5   82     7  23
85     80     294  8.6   86     7  24
86    108     223  8.0   85     7  25
87     20      81  8.6   82     7  26
88     52      82 12.0   86     7  27
89     82     213  7.4   88     7  28
90     50     275  7.4   86     7  29
91     64     253  7.4   83     7  30
92     59     254  9.2   81     7  31
93     39      83  6.9   81     8   1
94      9      24 13.8   81     8   2
95     16      77  7.4   82     8   3
96     78      NA  6.9   86     8   4
97     35      NA  7.4   85     8   5
98     66      NA  4.6   87     8   6
99    122     255  4.0   89     8   7
100    89     229 10.3   90     8   8
101   110     207  8.0   90     8   9
102    NA     222  8.6   92     8  10
103    NA     137 11.5   86     8  11
104    44     192 11.5   86     8  12
105    28     273 11.5   82     8  13
106    65     157  9.7   80     8  14
107    NA      64 11.5   79     8  15
108    22      71 10.3   77     8  16
109    59      51  6.3   79     8  17
110    23     115  7.4   76     8  18
111    31     244 10.9   78     8  19
112    44     190 10.3   78     8  20
113    21     259 15.5   77     8  21
114     9      36 14.3   72     8  22
115    NA     255 12.6   75     8  23
116    45     212  9.7   79     8  24
117   168     238  3.4   81     8  25
118    73     215  8.0   86     8  26
119    NA     153  5.7   88     8  27
120    76     203  9.7   97     8  28
121   118     225  2.3   94     8  29
122    84     237  6.3   96     8  30
123    85     188  6.3   94     8  31
124    96     167  6.9   91     9   1
125    78     197  5.1   92     9   2
126    73     183  2.8   93     9   3
127    91     189  4.6   93     9   4
128    47      95  7.4   87     9   5
129    32      92 15.5   84     9   6
130    20     252 10.9   80     9   7
131    23     220 10.3   78     9   8
132    21     230 10.9   75     9   9
133    24     259  9.7   73     9  10
134    44     236 14.9   81     9  11
135    21     259 15.5   76     9  12
136    28     238  6.3   77     9  13
137     9      24 10.9   71     9  14
138    13     112 11.5   71     9  15
139    46     237  6.9   78     9  16
140    18     224 13.8   67     9  17
141    13      27 10.3   76     9  18
142    24     238 10.3   68     9  19
143    16     201  8.0   82     9  20
144    13     238 12.6   64     9  21
145    23      14  9.2   71     9  22
146    36     139 10.3   81     9  23
147     7      49 10.3   69     9  24
148    14      20 16.6   63     9  25
149    30     193  6.9   70     9  26
150    NA     145 13.2   77     9  27
151    14     191 14.3   75     9  28
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30
> myfile=read.csv("hw1_data.csv")
-------------------------------------------------
> colnames(myfile)
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"
   
```
```
1. Ozone, Solar.R, Wind	
2. Ozone, Solar.R, Wind, Temp, Month, Day	Correct	1.00	You can get the column names of a data frame with the `names()' function.
3. 1, 2, 3, 4, 5, 6	
4. Month, Day, Temp, Wind	
```
-
### Question 12
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
```
> myfile[c(1:2),]
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
```
```
1.  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2

Correct	1.00	You can extract the first two rows using the [ operator and an integer sequence to index the rows.

2.  Ozone Solar.R Wind Temp Month Day
1    18     224 13.8   67     9  17
2    NA     258  9.7   81     7  22

3.  Ozone Solar.R Wind Temp Month Day
1     9      24 10.9   71     9  14
2    18     131  8.0   76     9  29

4.  Ozone Solar.R Wind Temp Month Day
1     7      NA  6.9   74     5  11
2    35     274 10.3   82     7  17

```
-
### Question 13
How many observations (i.e. rows) are in this data frame?
```
> dim(myfile)
[1] 153   6
> nrow(myfile)
[1] 153
> ncol(myfile)
[1] 6
```
```
1. 153	Correct	1.00	You can use the `nrow()' function to compute the number of rows in a data frame.
2. 160	
3. 129	
4. 45	
```
### Question 14
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
```
> myfile[c((nrow(myfile)-1):nrow(myfile)),]
    Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30

> myfile[c(nrow(myfile)-1,nrow(myfile)),]
    Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30

> myfile[c(152:153),]
    Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30

```
```
1.    Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30

Correct	1.00	The `tail()' function is an easy way to extract the last few elements of an R object.

2.    Ozone Solar.R Wind Temp Month Day
152    11      44  9.7   62     5  20
153   108     223  8.0   85     7  25

3.    Ozone Solar.R Wind Temp Month Day
152    34     307 12.0   66     5  17
153    13      27 10.3   76     9  18

 4.   Ozone Solar.R Wind Temp Month Day
152    31     244 10.9   78     8  19
153    29     127  9.7   82     6   7

```
-
### Question 15
What is the value of Ozone in the 47th row?
```
> myfile[47,"Ozone"]
[1] 21
```
```
1. 34	
2. 21	Correct	1.00	The single bracket [ operator can be used to extract individual rows of a data frame.
3. 18	
4. 63	
```
### Question 16
How many missing values are in the Ozone column of this data frame?
```
> missing=is.na(myfile[,"Ozone"])
> missing
  [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
 [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [25]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
 [37]  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE
 [49] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [61]  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [73] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [85] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [97] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE
[109] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE
[121] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[133] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[145] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE

> sum(missing==FALSE)
[1] 116
> sum(missing==TRUE)
[1] 37
```
```
1. 9	
2. 78	
3. 43	
4. 37	Correct	1.00	

Question Explanation
The "is.na" function can be used to test for missing values.
```
### Question 17
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
```
> mean(myfile[,"Ozone"], na.rm=TRUE)
[1] 42.12931
Your Answer		Score	Explanation

```
```
1. 18.0	
2. 31.5	
3. 42.1	Correct	1.00
4. 53.2

Question Explanation

The "mean" function can be used to calculate the mean.
```
-
### Question 18
```
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

> R= subset(myfile,myfile[,"Ozone"] >31 & myfile[,"Temp"] >90)
    Ozone Solar.R Wind Temp Month Day
69     97     267  6.3   92     7   8
70     97     272  5.7   92     7   9
120    76     203  9.7   97     8  28
121   118     225  2.3   94     8  29
122    84     237  6.3   96     8  30
123    85     188  6.3   94     8  31
124    96     167  6.9   91     9   1
125    78     197  5.1   92     9   2
126    73     183  2.8   93     9   3
127    91     189  4.6   93     9   4
> R[,"Solar.R"]
 [1] 267 272 203 225 237 188 167 197 183 189
> mean(R[,"Solar.R"])
[1] 212.8
```
```
1. 205.0	
2. 212.8	Correct	1.00	
3. 185.9	
4. 334.0	

Question Explanation
You need to construct a logical vector in R to match the question's requirements. Then use that logical vector to subset the data frame.
```
-
### Question 19
What is the mean of "Temp" when "Month" is equal to 6?
```
> T= subset(myfile,myfile[,"Month"] ==6)
> T
   Ozone Solar.R Wind Temp Month Day
32    NA     286  8.6   78     6   1
33    NA     287  9.7   74     6   2
34    NA     242 16.1   67     6   3
35    NA     186  9.2   84     6   4
36    NA     220  8.6   85     6   5
37    NA     264 14.3   79     6   6
38    29     127  9.7   82     6   7
39    NA     273  6.9   87     6   8
40    71     291 13.8   90     6   9
41    39     323 11.5   87     6  10
42    NA     259 10.9   93     6  11
43    NA     250  9.2   92     6  12
44    23     148  8.0   82     6  13
45    NA     332 13.8   80     6  14
46    NA     322 11.5   79     6  15
47    21     191 14.9   77     6  16
48    37     284 20.7   72     6  17
49    20      37  9.2   65     6  18
50    12     120 11.5   73     6  19
51    13     137 10.3   76     6  20
52    NA     150  6.3   77     6  21
53    NA      59  1.7   76     6  22
54    NA      91  4.6   76     6  23
55    NA     250  6.3   76     6  24
56    NA     135  8.0   75     6  25
57    NA     127  8.0   78     6  26
58    NA      47 10.3   73     6  27
59    NA      98 11.5   80     6  28
60    NA      31 14.9   77     6  29
61    NA     138  8.0   83     6  30
> mean(T[,"Temp"])
[1] 79.1
```
```
1. 90.2	
2. 75.3	
3. 79.1	Correct	1.00	
4. 85.6	
```
-
### Question 20
What was the maximum ozone value in the month of May (i.e. Month = 5)?
```
> max(subset(myfile[["Ozone"]],myfile[,"Month"] == 5), na.rm=TRUE)
[1] 115

> subset(myfile["Ozone"],myfile[,"Month"] == 5)
   Ozone
1     41
2     36
3     12
4     18
5     NA
6     28
7     23
8     19
9      8
10    NA
11     7
12    16
13    11
14    14
15    18
16    14
17    34
18     6
19    30
20    11
21     1
22    11
23     4
24    32
25    NA
26    NA
27    NA
28    23
29    45
30   115
31    37
```
```
1. 18	
2. 97	
3. 100	
4. 115	Correct	1.00
```
-
-
> getwd()
[1] "/Users/Fer"
> myfunction()
Error: could not find function "myfunction"
> dir()
[1] "functions.R" "Untitled.R" 
> source("functions.R")
> myfunction(2)
[1] 1.518162
> myfunction(2:10)
[1]  1.727476  1.910854  4.246869  6.188938  6.888813  7.498723  7.731143
[8] 10.494915  8.336878
> ls()
[1] "myfunction"
> dir()
[1] "functions.R" "Untitled.R" 
> x<-1
> x
[1] 1
> x<-1:20
> x
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
> class(x)
[1] "integer"
> x <-4L
> class(x)
[1] "integer"
> x <- c(4, "a", TRUE)
> class(x)
[1] "character"
> x <- c(1,3, 5)
>  y <- c(3, 2, 10)
> cbind(x, y)
     x  y
[1,] 1  3
[2,] 3  2
[3,] 5 10
> x <- list(2, "a", "b", TRUE)
> class(x[[1]])
[1] "numeric"
> x <- 1:4
> y <- 2:3
> x+y
[1] 3 5 5 7
> dir()
[1] "functions.R"  "hw1_data.csv" "Untitled.R"  
> read.csv("hw1_data.csv")
    Ozone Solar.R Wind Temp Month Day
1      41     190  7.4   67     5   1
2      36     118  8.0   72     5   2
3      12     149 12.6   74     5   3
4      18     313 11.5   62     5   4
5      NA      NA 14.3   56     5   5
6      28      NA 14.9   66     5   6
7      23     299  8.6   65     5   7
8      19      99 13.8   59     5   8
9       8      19 20.1   61     5   9
10     NA     194  8.6   69     5  10
11      7      NA  6.9   74     5  11
12     16     256  9.7   69     5  12
13     11     290  9.2   66     5  13
14     14     274 10.9   68     5  14
15     18      65 13.2   58     5  15
16     14     334 11.5   64     5  16
17     34     307 12.0   66     5  17
18      6      78 18.4   57     5  18
19     30     322 11.5   68     5  19
20     11      44  9.7   62     5  20
21      1       8  9.7   59     5  21
22     11     320 16.6   73     5  22
23      4      25  9.7   61     5  23
24     32      92 12.0   61     5  24
25     NA      66 16.6   57     5  25
26     NA     266 14.9   58     5  26
27     NA      NA  8.0   57     5  27
28     23      13 12.0   67     5  28
29     45     252 14.9   81     5  29
30    115     223  5.7   79     5  30
31     37     279  7.4   76     5  31
32     NA     286  8.6   78     6   1
33     NA     287  9.7   74     6   2
34     NA     242 16.1   67     6   3
35     NA     186  9.2   84     6   4
36     NA     220  8.6   85     6   5
37     NA     264 14.3   79     6   6
38     29     127  9.7   82     6   7
39     NA     273  6.9   87     6   8
40     71     291 13.8   90     6   9
41     39     323 11.5   87     6  10
42     NA     259 10.9   93     6  11
43     NA     250  9.2   92     6  12
44     23     148  8.0   82     6  13
45     NA     332 13.8   80     6  14
46     NA     322 11.5   79     6  15
47     21     191 14.9   77     6  16
48     37     284 20.7   72     6  17
49     20      37  9.2   65     6  18
50     12     120 11.5   73     6  19
51     13     137 10.3   76     6  20
52     NA     150  6.3   77     6  21
53     NA      59  1.7   76     6  22
54     NA      91  4.6   76     6  23
55     NA     250  6.3   76     6  24
56     NA     135  8.0   75     6  25
57     NA     127  8.0   78     6  26
58     NA      47 10.3   73     6  27
59     NA      98 11.5   80     6  28
60     NA      31 14.9   77     6  29
61     NA     138  8.0   83     6  30
62    135     269  4.1   84     7   1
63     49     248  9.2   85     7   2
64     32     236  9.2   81     7   3
65     NA     101 10.9   84     7   4
66     64     175  4.6   83     7   5
67     40     314 10.9   83     7   6
68     77     276  5.1   88     7   7
69     97     267  6.3   92     7   8
70     97     272  5.7   92     7   9
71     85     175  7.4   89     7  10
72     NA     139  8.6   82     7  11
73     10     264 14.3   73     7  12
74     27     175 14.9   81     7  13
75     NA     291 14.9   91     7  14
76      7      48 14.3   80     7  15
77     48     260  6.9   81     7  16
78     35     274 10.3   82     7  17
79     61     285  6.3   84     7  18
80     79     187  5.1   87     7  19
81     63     220 11.5   85     7  20
82     16       7  6.9   74     7  21
83     NA     258  9.7   81     7  22
84     NA     295 11.5   82     7  23
85     80     294  8.6   86     7  24
86    108     223  8.0   85     7  25
87     20      81  8.6   82     7  26
88     52      82 12.0   86     7  27
89     82     213  7.4   88     7  28
90     50     275  7.4   86     7  29
91     64     253  7.4   83     7  30
92     59     254  9.2   81     7  31
93     39      83  6.9   81     8   1
94      9      24 13.8   81     8   2
95     16      77  7.4   82     8   3
96     78      NA  6.9   86     8   4
97     35      NA  7.4   85     8   5
98     66      NA  4.6   87     8   6
99    122     255  4.0   89     8   7
100    89     229 10.3   90     8   8
101   110     207  8.0   90     8   9
102    NA     222  8.6   92     8  10
103    NA     137 11.5   86     8  11
104    44     192 11.5   86     8  12
105    28     273 11.5   82     8  13
106    65     157  9.7   80     8  14
107    NA      64 11.5   79     8  15
108    22      71 10.3   77     8  16
109    59      51  6.3   79     8  17
110    23     115  7.4   76     8  18
111    31     244 10.9   78     8  19
112    44     190 10.3   78     8  20
113    21     259 15.5   77     8  21
114     9      36 14.3   72     8  22
115    NA     255 12.6   75     8  23
116    45     212  9.7   79     8  24
117   168     238  3.4   81     8  25
118    73     215  8.0   86     8  26
119    NA     153  5.7   88     8  27
120    76     203  9.7   97     8  28
121   118     225  2.3   94     8  29
122    84     237  6.3   96     8  30
123    85     188  6.3   94     8  31
124    96     167  6.9   91     9   1
125    78     197  5.1   92     9   2
126    73     183  2.8   93     9   3
127    91     189  4.6   93     9   4
128    47      95  7.4   87     9   5
129    32      92 15.5   84     9   6
130    20     252 10.9   80     9   7
131    23     220 10.3   78     9   8
132    21     230 10.9   75     9   9
133    24     259  9.7   73     9  10
134    44     236 14.9   81     9  11
135    21     259 15.5   76     9  12
136    28     238  6.3   77     9  13
137     9      24 10.9   71     9  14
138    13     112 11.5   71     9  15
139    46     237  6.9   78     9  16
140    18     224 13.8   67     9  17
141    13      27 10.3   76     9  18
142    24     238 10.3   68     9  19
143    16     201  8.0   82     9  20
144    13     238 12.6   64     9  21
145    23      14  9.2   71     9  22
146    36     139 10.3   81     9  23
147     7      49 10.3   69     9  24
148    14      20 16.6   63     9  25
149    30     193  6.9   70     9  26
150    NA     145 13.2   77     9  27
151    14     191 14.3   75     9  28
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30
> myfile=read.csv("hw1_data.csv")
```
