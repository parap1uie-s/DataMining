/**
 *  * Licensed to the Apache Software Foundation (ASF) under one
 *   * or more contributor license agreements.  See the NOTICE file
 *    * distributed with this work for additional information
 *     * regarding copyright ownership.  The ASF licenses this file
 *      * to you under the Apache License, Version 2.0 (the
 *       * "License"); you may not use this file except in compliance
 *        * with the License.  You may obtain a copy of the License at
 *         *
 *          *     http://www.apache.org/licenses/LICENSE-2.0
 *           *
 *            * Unless required by applicable law or agreed to in writing, software
 *             * distributed under the License is distributed on an "AS IS" BASIS,
 *              * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *               * See the License for the specific language governing permissions and
 *                * limitations under the License.
 *                 */
// package com.picc.test; 
 
import java.io.IOException;
import java.util.StringTokenizer;
import java.util.ArrayList; 
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;
 
public class PrimeDivisor {
 
  public static class TokenizerMapper 
       extends Mapper<Object, Text, Text, IntWritable>{
 
    private final static IntWritable one = new IntWritable(1);
 
    public void map(Object key, Text value, Context context
                    ) throws IOException, InterruptedException {
      Text word = new Text();
      int num = 0;
      List<Integer> list = new ArrayList<Integer>();
      //将value按分隔符分割
      StringTokenizer itr = new StringTokenizer(value.toString());

      while (itr.hasMoreTokens()) {
        num = Integer.parseInt(itr.nextToken());
        list = DecompositionPrime(num);
        for(int i = 0; i < list.size(); i++){
            word.set(String.valueOf(list.get(i)));
            IntWritable n = new IntWritable(num);
            context.write(word, n);
        }
      }
    }

    private static List<Integer> DecompositionPrime(int num){
      List<Integer> list = new ArrayList<Integer>();
      int i=0;
      int k=num;

      while(true){
        for(i=2;i<=k;i++){
          if(k%i==0){
            //i即为素因子
            if(!list.contains(i)) list.add(i);
            k=k/i;
            break;
          }
        }
        if(k==1)
          break;
      }
      return list;
    }
  }
 
  public static class IntSumReducer 
       extends Reducer<Text,IntWritable,Text,IntWritable> {
    private IntWritable result = new IntWritable();
 
    public void reduce(Text key, Iterable<IntWritable> values, 
                       Context context
                       ) throws IOException, InterruptedException {
      int sum = 0;
      for (IntWritable val : values) {
        sum += val.get();
      }
      result.set(sum);
      context.write(key, result);
    }
  }
 
  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
    if (otherArgs.length != 2) {
      System.err.println("Usage: wordcount <in> <out>");
      System.exit(2);
    }
    Job job = new Job(conf, "word count");
    job.setJarByClass(PrimeDivisor.class);
    job.setMapperClass(TokenizerMapper.class);
    job.setCombinerClass(IntSumReducer.class);
    job.setReducerClass(IntSumReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    FileInputFormat.addInputPath(job, new Path(otherArgs[0]));
    FileOutputFormat.setOutputPath(job, new Path(otherArgs[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
