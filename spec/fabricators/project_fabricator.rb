Fabricator(:project) do
  contest
  name { Faker::Color.color_name }
  body { Faker::Color.color_name }
  video_id { 1 }
  video_mp4_id { 1 }
  video_webm_id { 1 }
  images(count: 2)
end
