; ModuleID = '003.cpp'
source_filename = "003.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.anon = type { i32 }

@qaq = global i32 666, align 4

; Function Attrs: noinline norecurse uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %class.anon, align 4
  %4 = alloca %class.anon, align 4
  store i32 0, i32* %1, align 4
  store i32 233, i32* %2, align 4
  %5 = getelementptr inbounds %class.anon, %class.anon* %3, i32 0, i32 0
  %6 = load i32, i32* %2, align 4
  store i32 %6, i32* %5, align 4
  %7 = bitcast %class.anon* %4 to i8*
  %8 = bitcast %class.anon* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 4, i32 4, i1 false)
  %9 = getelementptr inbounds %class.anon, %class.anon* %4, i32 0, i32 0
  %10 = load i32, i32* %9, align 4
  %11 = call i32 @"_Z1aIZ4mainE3$_0EiT_"(i32 %10)
  ret i32 0
}

; Function Attrs: noinline uwtable
define internal i32 @"_Z1aIZ4mainE3$_0EiT_"(i32) #1 {
  %2 = alloca %class.anon, align 4
  %3 = getelementptr inbounds %class.anon, %class.anon* %2, i32 0, i32 0
  store i32 %0, i32* %3, align 4
  %4 = call i32 @"_ZZ4mainENK3$_0clEi"(%class.anon* %2, i32 233)
  ret i32 %4
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @"_ZZ4mainENK3$_0clEi"(%class.anon*, i32) #3 align 2 {
  %3 = alloca %class.anon*, align 8
  %4 = alloca i32, align 4
  store %class.anon* %0, %class.anon** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %class.anon*, %class.anon** %3, align 8
  %6 = load i32, i32* %4, align 4
  %7 = getelementptr inbounds %class.anon, %class.anon* %5, i32 0, i32 0
  %8 = load i32, i32* %7, align 4
  %9 = load i32, i32* @qaq, align 4
  %10 = mul nsw i32 %8, %9
  %11 = add nsw i32 %6, %10
  ret i32 %11
}

attributes #0 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0-1ubuntu1~16.04.2 (tags/RELEASE_400/rc1)"}
