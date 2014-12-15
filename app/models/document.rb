class Document < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :user

  Paperclip.interpolates :receipt_id_partition do |attachment, style|
    case id = attachment.instance.receipt_id
    when Integer
      ("%09d" % id).scan(/\d{3}/).join("/")
    when String
      id.scan(/.{3}/).first(3).join("/")
    else
      nil
    end
  end

  # see if this is necessary
  Paperclip.interpolates :receipt_id do |attachment, style|
    attachment.instance.receipt_id
  end

  # see if this needs to be renamed
  Paperclip.interpolates :is_snapshot do |attachment, style|
    if (attachment.instance.is_snapshot)
      "snapshot"
    else
      "uploads"
    end
  end

  has_attached_file :file,
  # choose ftp backend
  :storage => :ftp,
  # styles: original, thumb
  :styles => { :thumb => "200x200>" },
  # url to image from client (what client sees) - /documents/1/thumb
  :url => "/:class/:id?style=:style",
  # location of image on file system - outside rails directory (documents)
  :path => "../:class/:receipt_id_partition/:is_snapshot/:style/:filename",

  :ftp_servers => [{
    :host => "ftp.tworeceipt.com",
    :user => "rails_ftp",
    :password => "rH4%s3N"
  }]

  validates_attachment_presence :file
  # temp set to 5 mb, change to 1 mb or other later (ensure files will be under)
  validates_attachment_size :file, :less_than => 5.megabytes
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  def self.decode_base64_image(image_data)
    # remove base64 header, so image_data is pure data
    data_index = image_data.index("base64,") + "base64,".length
    image_data = image_data[data_index, image_data.length - 1]
    StringIO.new(Base64.decode64(image_data))
  end
end