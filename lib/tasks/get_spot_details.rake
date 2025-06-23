require 'csv'
require 'open-uri'
require 'json'
API_KEY = ENV['GOOGLE_MAPS_API_KEY']

namespace :Spot do
  desc 'Fetch and save spot details'
  task :get_and_save_details => :environment do
    def get_place_id(name)
      client = GooglePlaces::Client.new(API_KEY)
      spot = client.spots_by_query(name).first
      spot.place_id if spot
    end

    def get_detail_data(spot)
      place_id = get_place_id(spot['スポット名'])

      if place_id
        existing_spot = Spot.find_by(place_id: place_id)
        if existing_spot
          puts "既に保存済みです: #{spot['スポット名']}"
          return nil
        end

        place_detail_query = URI.encode_www_form(
          place_id: place_id,
          language: 'ja',
          key: API_KEY
        )

        place_detail_url = "https://maps.googleapis.com/maps/api/place/details/json?#{place_detail_query}"
        place_detail_page = URI.open(place_detail_url).read
        place_detail_data = JSON.parse(place_detail_page)
        result = {}
        result[:name] = spot['スポット名']
        result[:postal_code] = place_detail_data['result']['address_components'].find { |c| c['types'].include?('postal_code') }&.fetch('long_name', nil)
        full_address = place_detail_data['result']['formatted_address'] 
        result[:address] = full_address.sub(/\A[^ ]+/, '')
        result[:phone_number] = place_detail_data['result']['formatted_phone_number']
        result[:opening_hours] = place_detail_data['result']['opening_hours']['weekday_text'].join("\n") if place_detail_data['result']['opening_hours'].present?
        result[:web_site] = place_detail_data['result']['website']
        result[:rating] = place_detail_data['result']['rating']
        result[:latitude] = place_detail_data['result']['geometry']['location']['lat']
        result[:longitude] = place_detail_data['result']['geometry']['location']['lng']
        result[:place_id] = place_id
        result[:photo_reference] = place_detail_data['result']['photos'].first['photo_reference'] if place_detail_data['result']['photos'].present?

        result
      else
        puts "詳細情報が見つかりませんでした。"
        nil
      end
    end

    csv_file = 'lib/spot.csv'
    CSV.foreach(csv_file, headers: true) do |row|
      spot_data = get_detail_data(row)
      if spot_data
          spot_data.merge!(
            prefecture_id: row['都道府県ID'].to_i,
            category_id: row['カテゴリID'].to_i
          )

        Spot.create!(spot_data)
        puts "Spotを保存しました: #{row['スポット名']}"
        puts "----------"
      else
        puts "Spotの保存に失敗しました: #{row['スポット名']}"
        puts "----------"
      end
    end
  end
end