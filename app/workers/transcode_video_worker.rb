class TranscodeVideoWorker < Refile::Backgrounder::StoreWorker
  attr_reader :file, :path

  def perform(record, attachment_name)
    super do
      logger.info "Attachment saved, setting transcoded videos..."
      File.open(@mp4_path) { |file| record.video_mp4 = file }
      File.open(@webm_path) { |file| record.video_webm = file }
      record.save!
    end
  end

  private

    # Instead of uploading, transcode the video
    def upload(file)
      logger.info 'Downloading video...'
      path = file.download.path
      movie = FFMPEG::Movie.new(path)
      @mp4_path = encode('mp4', movie, '-vcodec libx264 -strict -2')
      @webm_path = encode('webm', movie, '-vcodec libvpx -acodec libvorbis -f webm -deadline realtime -s 640x480')
    end

    def encode(format, movie, options = '')
      tmp_path = File.join File.dirname(movie.path), "transcoding.#{SecureRandom.hex}.#{format}"
      transcoded = movie.transcode tmp_path, options do |progress|
        logger.info "#{record.class}[#{record}] #{format} Progress #{(progress * 100).round(2)}%"
      end
      transcoded.path
    end

end
