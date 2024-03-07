CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

file=`find student-submission -name "ListExamples.java"`

if [[ -f $file ]]
then 
    echo "File found"
else
    echo "File not found"
fi

cp -r lib grading-area
cp TestListExamples.java $file grading-area

cd grading-area

javac -cp $CPATH *.java

if [[ $? -ne 0 ]]
then
    echo "Compilation error"
    exit 1
else
    echo "Successful compilation"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt

grep "OK"  output.txt > grep.txt
if [[ $? -ne 0 ]]
then
    echo "0/1"
else
    echo "1/1"
fi
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
