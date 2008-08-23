require 'clip'
Clip
b = AWS::S3::Bucket.find("lost_0h7j8wnge7vbk5vh8682")

#episode1
["Lost/Se 1/ep 1/S1E1- clip3.flv",
"Lost/Se 1/ep 1/S1E1-Clip2.flv",
"Lost/Se 1/ep 1/S1E1-clip1.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "01", index, b, key)
end

=begin

["clips/ep2/s1e2-clip1.flv",
"clips/ep2/s1e2-clip2.flv",
"clips/ep2/s1e2-clip3.flv",
"clips/ep2/s1e2-clip4.flv",
"clips/ep2/s1e2-clip5.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "02", index, b, key)
end


["Lost/Se 1/ep 4/s1e4-c1.flv",
"Lost/Se 1/ep 4/s1e4-c2.flv",
"Lost/Se 1/ep 4/s1e4-c3.flv",
"Lost/Se 1/ep 4/s1e4-c4.flv",
"Lost/Se 1/ep 4/s1e4-c5.flv",
"Lost/Se 1/ep 4/s1e4-c6.flv",
"Lost/Se 1/ep 4/s1e4-clip7.flv",
"Lost/Se 1/ep 4/s1e4-c8.flv",
"Lost/Se 1/ep 4/s1e4-c9.flv",
"Lost/Se 1/ep 4/s1e4-c10.flv",
"Lost/Se 1/ep 4/s1e4-c11.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "04", index, b, key)
end


["Lost/Se 1/ep 5/s1e5-c1.flv",
"Lost/Se 1/ep 5/s1e5-c2.flv",
"Lost/Se 1/ep 5/s1e5-c3.flv",
"Lost/Se 1/ep 5/s1e5-c4.flv",
"Lost/Se 1/ep 5/s1e5-c5.flv",
"Lost/Se 1/ep 5/s1e5-c6.flv",
"Lost/Se 1/ep 5/s1e5-c7.flv",
"Lost/Se 1/ep 5/s1e5-c8.flv",
"Lost/Se 1/ep 5/s1e5-c9.flv",
"Lost/Se 1/ep 5/s1e5-c10.flv",
"Lost/Se 1/ep 5/s1e5-c11.flv",
"Lost/Se 1/ep 5/s1e5-c12.flv",
"Lost/Se 1/ep 5/s1e5-c13.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "05", index, b, key)
end


["Lost/Se 1/ep 6/s1e6-c1.flv",
"Lost/Se 1/ep 6/s1e6-c2.flv",
"Lost/Se 1/ep 6/s1e6-c3.flv",
"Lost/Se 1/ep 6/s1e6-c4.flv",
"Lost/Se 1/ep 6/s1e6-c5.flv",
"Lost/Se 1/ep 6/s1e6-c6.flv",
"Lost/Se 1/ep 6/s1e6-c7.flv",
"Lost/Se 1/ep 6/s1e6-c8.flv",
"Lost/Se 1/ep 6/s1e6-c9.flv",
"Lost/Se 1/ep 6/s1e6-c10.flv",
"Lost/Se 1/ep 6/s1e6-c11.flv",
"Lost/Se 1/ep 6/s1e6-c12.flv",
"Lost/Se 1/ep 6/s1e6-c13.flv",
"Lost/Se 1/ep 6/s1e6-c14.flv",
"Lost/Se 1/ep 6/s1e6-c15.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "06", index, b, key)
end


["Lost/Se 1/ep 7/s1e7-c1.flv",
"Lost/Se 1/ep 7/s1e7-c2.flv",
"Lost/Se 1/ep 7/s1e7-c3.flv",
"Lost/Se 1/ep 7/s1e7-c4.flv",
"Lost/Se 1/ep 7/s1e7-c5.flv",
"Lost/Se 1/ep 7/s1e7-c6.flv",
"Lost/Se 1/ep 7/s1e7-c7.flv",
"Lost/Se 1/ep 7/s1e7-c8.flv",
"Lost/Se 1/ep 7/s1e7-c9.flv",
"Lost/Se 1/ep 7/s1e7-c10.flv",
"Lost/Se 1/ep 7/s1e7-c11.flv",
"Lost/Se 1/ep 7/s1e7-c12.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "07", index, b, key)
end


["Lost/Se 1/ep 8/s1e8-c1.flv",
"Lost/Se 1/ep 8/s1e8-c2.flv",
"Lost/Se 1/ep 8/s1e8-c3.flv",
"Lost/Se 1/ep 8/s1e8-c4.flv",
"Lost/Se 1/ep 8/s1e8-c5.flv",
"Lost/Se 1/ep 8/s1e8-c6.flv",
"Lost/Se 1/ep 8/s1e8-c7.flv",
"Lost/Se 1/ep 8/s1e8-c8.flv",
"Lost/Se 1/ep 8/s1e8-c9.flv",
"Lost/Se 1/ep 8/s1e8-c10.flv",
"Lost/Se 1/ep 8/s1e8-c11.flv",
"Lost/Se 1/ep 8/s1e8-c12.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "08", index, b, key)
end


["Lost/Se 1/ep 9/s1e9-c1.flv",
"Lost/Se 1/ep 9/s1e9-c2.flv",
"Lost/Se 1/ep 9/s1e9-c3.flv",
"Lost/Se 1/ep 9/s1e9-c4.flv",
"Lost/Se 1/ep 9/s1e9-c5.flv",
"Lost/Se 1/ep 9/s1e9-c6.flv",
"Lost/Se 1/ep 9/s1e9-c7.flv",
"Lost/Se 1/ep 9/s1e9-c8.flv",
"Lost/Se 1/ep 9/s1e9-c9.flv",
"Lost/Se 1/ep 9/s1e9-c10.flv",
"Lost/Se 1/ep 9/s1e9-c11.flv",
"Lost/Se 1/ep 9/s1e9-c12.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "09", index, b, key)
end


["Lost/Se 1/ep 10/s1e10-c1.flv",
"Lost/Se 1/ep 10/s1e10-c2.flv",
"Lost/Se 1/ep 10/s1e10-c3.flv",
"Lost/Se 1/ep 10/s1e10-c4.flv",
"Lost/Se 1/ep 10/s1e10-c5.flv",
"Lost/Se 1/ep 10/s1e10-c6.flv",
"Lost/Se 1/ep 10/s1e10-c7.flv",
"Lost/Se 1/ep 10/s1e10-c8.flv",
"Lost/Se 1/ep 10/s1e10-c9.flv",
"Lost/Se 1/ep 10/s1e10-c10.flv",
"Lost/Se 1/ep 10/s1e10-c11.flv",
"Lost/Se 1/ep 10/s1e10-c12.flv",
"Lost/Se 1/ep 10/s1e10-c13.flv",
"Lost/Se 1/ep 10/s1e10-c14.flv",
"Lost/Se 1/ep 10/s1e10-c15.flv",
"s1e10-c16.flv",
"Lost/Se 1/ep 10/s1e10-c17.flv",
"Lost/Se 1/ep 10/s1e10-c18.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "10", index, b, key)
end



["Lost/Se 1/ep11/s1e11-c1.flv",
"Lost/Se 1/ep11/s1e11-c2.flv",
"Lost/Se 1/ep11/s1e11-c3.flv",
"Lost/Se 1/ep11/s1e11-c4.flv",
"Lost/Se 1/ep11/s1e11-c5.flv",
"Lost/Se 1/ep11/s1e11-c6.flv",
"Lost/Se 1/ep11/s1e11-c7.flv",
"Lost/Se 1/ep11/s1e11-c8.flv",
"Lost/Se 1/ep11/s1e11-c9.flv",
"Lost/Se 1/ep11/s1e11-c10.flv",
"Lost/Se 1/ep11/s1e11-c11.flv",
"Lost/Se 1/ep11/s1e11-c12.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "11", index, b, key)
end


["Lost/Se 1/ep12/s1e12-c1.flv",
"Lost/Se 1/ep12/s1e12-c2.flv",
"Lost/Se 1/ep12/s1e12-c3.flv",
"Lost/Se 1/ep12/s1e12-c4.flv",
"Lost/Se 1/ep12/s1e12-c5.flv",
"Lost/Se 1/ep12/s1e12-c6.flv",
"Lost/Se 1/ep12/s1e12-c7.flv",
"Lost/Se 1/ep12/s1e12-c8.flv",
"Lost/Se 1/ep12/s1e12-c9.flv",
"Lost/Se 1/ep11/s1e11-c10.flv",
"Lost/Se 1/ep11/s1e11-c11.flv",
"Lost/Se 1/ep11/s1e11-c12.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "11", index, b, key)
end

["Lost/Se 1/ep 13/s1e13-c1.flv",
"Lost/Se 1/ep 13/s1e13-c2.flv",
"Lost/Se 1/ep 13/s1e13-c3.flv",
"Lost/Se 1/ep 13/s1e13-c4.flv",
"Lost/Se 1/ep 13/s1e13-c5.flv",
"Lost/Se 1/ep 13/s1e13-c6.flv",
"Lost/Se 1/ep 13/s1e13-c7.flv",
"Lost/Se 1/ep 13/s1e13-c8.flv",
"Lost/Se 1/ep 13/s1e13-c9.flv",
"Lost/Se 1/ep 13/s1e13-c10.flv",
"Lost/Se 1/ep 13/s1e13-c11.flv",
"Lost/Se 1/ep 13/s1e13-c12.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "13", index, b, key)
end


["Lost/Se 1/ep 14/s1e14-c1.flv",
"Lost/Se 1/ep 14/s1e14-c2.flv",
"Lost/Se 1/ep 14/s1e14-c3.flv",
"Lost/Se 1/ep 14/s1e14-c4.flv",
"Lost/Se 1/ep 14/s1e14-c5.flv",
"Lost/Se 1/ep 14/s1e14-c6.flv",
"Lost/Se 1/ep 14/s1e14-c7.flv",
"Lost/Se 1/ep 14/s1e14-c8.flv",
"Lost/Se 1/ep 14/s1e14-c9.flv",
"Lost/Se 1/ep 14/s1e14-c10.flv",
"Lost/Se 1/ep 14/s1e14-c11.flv",
"Lost/Se 1/ep 14/s1e14-c12.flv",
"Lost/Se 1/ep 14/s1e14-c13.flv",
"Lost/Se 1/ep 14/s1e14-c14.flv",
"Lost/Se 1/ep 14/s1e14-c15.flv",
"Lost/Se 1/ep 14/s1e14-c16.flv",
"Lost/Se 1/ep 14/s1e14-c17.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "14", index, b, key)
end


["Lost/Se 1/ep 15/s1e15-c1.flv",
"Lost/Se 1/ep 15/s1e15-c2.flv",
"Lost/Se 1/ep 15/s1e15-c3.flv",
"Lost/Se 1/ep 15/s1e15-c4.flv",
"Lost/Se 1/ep 15/s1e15-c5.flv",
"Lost/Se 1/ep 15/s1e15-c6.flv",
"Lost/Se 1/ep 15/s1e15-c7.flv",
"Lost/Se 1/ep 15/s1e15-c8.flv",
"Lost/Se 1/ep 15/s1e15-c9.flv",
"Lost/Se 1/ep 15/s1e15-c10.flv",
"Lost/Se 1/ep 15/s1e15-c11.flv",
"clips/s1e15-c12.flv",
"Lost/Se 1/ep 15/s1e15-c13.flv",
"s1e15-c14.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("01", "15", index, b, key)
end


["Lost/se2/s2e1/s2e1-c1.flv",
"Lost/se2/s2e1/s2e1-c2.flv",
"Lost/se2/s2e1/s2e1-c3.flv",
"Lost/se2/s2e1/s2e1-c4.flv",
"Lost/se2/s2e1/s2e1-c5.flv",
"Lost/se2/s2e1/s2e1-c6.flv",
"Lost/se2/s2e1/s2e1-c7.flv",
"Lost/se2/s2e1/s2e1-c8.flv",
"Lost/se2/s2e1/s2e1-c9.flv",
"Lost/se2/s2e1/s2e1-c10.flv",
"Lost/se2/s2e1/s2e1-cc11.flv",
"Lost/se2/s2e1/s2e1-c12.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "01", index, b, key)
end


["Lost/se2/s2e3/s2e3-c1.flv",
"Lost/se2/s2e3/s2e3-c2.flv",
"Lost/se2/s2e3/s2e3-c3.flv",
"Lost/se2/s2e3/s2e3-c4.flv",
"Lost/se2/s2e3/s2e3-c5.flv",
"Lost/se2/s2e3/s2e3-c6.flv",
"Lost/se2/s2e3/s2e3-c7.flv",
"Lost/se2/s2e3/s2e3-c8.flv",
"Lost/se2/s2e3/s2e3-c9.flv",
"Lost/se2/s2e3/m.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "03", index, b, key)
end


["Lost/se2/s2e5/s2e5-c1.flv",
"Lost/se2/s2e5/s2e5-c2.flv",
"Lost/se2/s2e5/s2e5-c3.flv",
"Lost/se2/s2e5/s2e5-c4.flv",
"Lost/se2/s2e5/s2e5-c5.flv",
"Lost/se2/s2e5/s2e5-c6.flv",
"Lost/se2/s2e5/s2e5-c7.flv",
"Lost/se2/s2e5/s2e5-c8.flv",
"Lost/se2/s2e5/s2e5-c9.flv",
"Lost/se2/s2e5/s2e5-c10.flv",
"Lost/se2/s2e5/s2e5-c11.flv",
"Lost/se2/s2e5/s2e5-c12.flv",
"Lost/se2/s2e5/s2e5-c13.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "05", index, b, key)
end


["Lost/se2/s2e7/s2e7-c1.flv",
"Lost/se2/s2e7/s2e5-c2.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "07", index, b, key)
end


["Lost/se2/s2e9/s2e9-c1.flv",
"Lost/se2/s2e9/s2e9-c2.flv",
"Lost/se2/s2e9/s2e9-c3.flv",
"Lost/se2/s2e9/s2e9-c4.flv",
"Lost/se2/s2e9/s2e9-c5.flv",
"Lost/se2/s2e9/s2e9-c6.flv",
"Lost/se2/s2e9/s2e9-c7.flv",
"Lost/se2/s2e9/s2e9-c8.flv",
"Lost/se2/s2e9/s2e9-c9.flv",
"Lost/se2/s2e9/s2e9-c10.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "09", index, b, key)
end

["Lost/se2/s2e11/s2e11-c1.flv",
"Lost/se2/s2e11/s2e11-c2.flv",
"Lost/se2/s2e11/s2e11-c3.flv",
"Lost/se2/s2e11/s2e11-c4.flv",
"Lost/se2/s2e11/s2e11-c5.flv",
"Lost/se2/s2e11/s2e11-c6.flv",
"Lost/se2/s2e11/s2e11-c7.flv",
"Lost/se2/s2e11/s2e11-c8.flv",
"Lost/se2/s2e11/s2e11-c9.flv",
"Lost/se2/s2e11/s2e11-c10.flv",
"Lost/se2/s2e11/s2e11-c12.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "11", index, b, key)
end

["Lost/se2/s2e13/s2e11-c1.flv",
"Lost/se2/s2e13/s2e11-c2.flv",
"Lost/se2/s2e13/s2e11-c3.flv",
"Lost/se2/s2e13/s2e11-c4.flv",
"Lost/se2/s2e13/s2e11-c5.flv",
"Lost/se2/s2e13/s2e11-c6.flv",
"Lost/se2/s2e13/s2e11-c7.flv",
"Lost/se2/s2e13/s2e11-c8.flv",
"Lost/se2/s2e13/s2e11-c10.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "11", index, b, key)
end


["Lost/se2/s2e14/s2e12-c7.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "12", index, b, key)
end


["Lost/se2/s2e13/s2e13-c9.flv",
"Lost/se2/s2e13/s2e13-11.flv",
"Lost/se2/s2e13/s2e13-c12.flv",
"Lost/se2/s2e13/s2e13-c13.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "13", index, b, key)
end


["Lost/se2/s2e14/s2e14-c1.flv",
"Lost/se2/s2e14/s2e14-c2.flv",
"Lost/se2/s2e14/s2e143.flv",
"Lost/se2/s2e14/s2e14-c4.flv",
"Lost/se2/s2e14/s2e14-c5.flv",
"Lost/se2/s2e14/s2e14-c6.flv",
"Lost/se2/s2e14/s2e14-c7.flv",
"Lost/se2/s2e14/s2e14-c8.flv",
"Lost/se2/s2e14/s2e14-c9.flv",
"Lost/se2/s2e14/s2e14-c10.flv"].each_with_index do |key, index|
  Clip.find_or_create_from_bucket("02", "14", index, b, key)
end


=end
