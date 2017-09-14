; ModuleID = '005.cpp'
source_filename = "005.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 10, i32* %2, align 4
  br label %3

; <label>:3:                                      ; preds = %0
  %4 = load i32, i32* %2, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %2, align 4
  %6 = icmp sgt i32 %4, 0
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %3
  br label %8

; <label>:8:                                      ; preds = %7, %3
  br label %9

; <label>:9:                                      ; preds = %13, %8
  %10 = load i32, i32* %2, align 4
  %11 = add nsw i32 %10, -1
  store i32 %11, i32* %2, align 4
  %12 = icmp sgt i32 %10, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %9
  br label %9

; <label>:14:                                     ; preds = %9
  br label %15

; <label>:15:                                     ; preds = %19, %14
  %16 = load i32, i32* %2, align 4
  %17 = add nsw i32 %16, -1
  store i32 %17, i32* %2, align 4
  %18 = icmp sgt i32 %16, 0
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %15
  br label %15

; <label>:20:                                     ; preds = %15
  ret i32 0
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0-1ubuntu1~16.04.2 (tags/RELEASE_400/rc1)"}
