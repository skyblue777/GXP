describe TranscodeVideoWorker do
  describe '#upload' do
    it 'should log debug information' do
      fake = double("file")
      allow(fake).to receive_message_chain('download.path')
      allow(FFMPEG::Movie).to receive(:new)
      allow_any_instance_of(TranscodeVideoWorker).to receive(:encode)
      expect(Rails.logger).to receive(:info).with('Downloading video...')
      TranscodeVideoWorker.new.send(:upload, fake)
    end

    it 'should call encode twice' do
      fake = double("file")
      allow(fake).to receive_message_chain('download.path')
      allow(FFMPEG::Movie).to receive(:new)
      allow_any_instance_of(TranscodeVideoWorker).to receive(:encode)
      expect_any_instance_of(TranscodeVideoWorker).to receive(:encode).twice
      TranscodeVideoWorker.new.send(:upload, fake)
    end
  end
end
