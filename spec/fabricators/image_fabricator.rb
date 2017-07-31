Fabricator(:image) do
  image_id { 1 }
  image_filename { 'test.png' }
  image_size { 500 }
  image_content_type { 'image/png' }
end
