; ModuleID = '002.cpp'
source_filename = "002.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"ass we can\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @main() {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  store i8* %4, i8** %3, align 8
  ret i32 0
}

