declare i32 @puts(i8*) #1
@.str0=private unnamed_addr constant [14 x i8] c"boy\20next\20door\00", align 1
@glob0=global i32 1, align 4
@glob1=global i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str0, i32 0, i32 0), align 8
define i32 @main() #0 {
  %var1 = alloca i8*, align 8
  store i8* getelementptr inbounds ([14 x i8],[14 x i8]* @.str0,i32 0,i32 0),i8** %var1,align 8
	call 
  ret i32 0
}
attributes #0 = { noinline norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
