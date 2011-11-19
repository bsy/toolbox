require 'rubygems'
require 'aws/s3'

AWS::S3::Base.establish_connection!(
    :access_key_id => 'your access key',
    :secret_access_key => 'your secret access key'
)
bucket_name = 'some-bucket-name'
bucket = AWS::S3::Bucket.find(bucket_name)

while (!bucket.empty?)
  
  begin
    puts "Deleting objects in bucket"

    bucket.objects.each do |object|
      object.delete
      puts "There are #{bucket.objects.size} objects left in the bucket"
    end

    puts "Done deleting objects from bucket: #{bucket_name}"

  rescue SocketError
    puts "Had socket error"
  end

end
