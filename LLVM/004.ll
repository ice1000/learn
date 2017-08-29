; ModuleID = '004.cpp'
source_filename = "004.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32, i32, i32 }

; Function Attrs: noinline nounwind uwtable
define { i64, i32 } @_Z2ggv() #0 {
  %1 = alloca %struct.A, align 4
  %2 = alloca { i64, i32 }, align 8
  %3 = bitcast { i64, i32 }* %2 to i8*
  %4 = bitcast %struct.A* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 12, i32 4, i1 false)
  %5 = load { i64, i32 }, { i64, i32 }* %2, align 8
  ret { i64, i32 } %5
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.A, align 4
  %3 = alloca { i64, i32 }, align 8
  store i32 0, i32* %1, align 4
  %4 = call { i64, i32 } @_Z2ggv()
  store { i64, i32 } %4, { i64, i32 }* %3, align 8
  %5 = bitcast { i64, i32 }* %3 to i8*
  %6 = bitcast %struct.A* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %5, i64 12, i32 4, i1 false)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0-1ubuntu1~16.04.2 (tags/RELEASE_400/rc1)"}
