function toDegrees(angle) {
  return angle * (180 / Math.PI);
}
function toRadians(angle) {
  return angle * (Math.PI / 180);
}
tan=x=>Math.tan(toRadians(x))
sin=x=>Math.sin(toRadians(x))
cos=x=>Math.cos(toRadians(x))
atan=x=>toDegrees(Math.atan(x))
asin=x=>toDegrees(Math.asin(x))
acos=x=>toDegrees(Math.acos(x))
g=9.8
sq=x=>x*x
sqrt=Math.sqrt
