using System;

namespace ConsoleApplication
{
  class Program
  {
    private static void P(string s)
    {
      Console.WriteLine(s);
      Console.ReadKey();
    }
    static void Main(string[] args)
    {
      var ass = 0;
      for (; ass < 10; ass++)
      {
        P("ass = " + ass);
      }
      P("来自CTO的建议：");
      P("建议一：开源除了内核之外的全部源代码");
      P("建议二：绝对不能依赖于流氓式的广告");
      P("建议三：满足Android用户们的情怀，iOS和Android要区分开，Android就好好采用Material Design");
      P("建议四：尽量减少合作，大腿抱多了不好");
    }
  }
}