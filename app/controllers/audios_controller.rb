class AudiosController < ApplicationController
	def index
			
	end

	def show
			
	end

	def search
		track = (params[:track]).downcase.gsub(" ", "%")
		album = (params[:album]).downcase.gsub(" ", "%")
		artist = (params[:artist]).downcase.gsub(" ", "%")

		puts track
		puts album
		puts artist

		tracks = find_track(track,album, artist)

		unless tracks
			flash[:alert] = 'Track not found'
			return render action: :search
		end
		
		begin
			return @track = tracks.first[1].first["preview"]
		rescue => exception
			puts exception
			flash[:alert] = 'Track not found'
			return render action: :search
		end
		
		
			

			

		

		

	end

	private

	def request_api(url)
		response = HTTP.get(url)
		return nil if response.status != 200
		JSON.parse(response)
	end

	def find_track(track, album, artist)
		request_api(
		"https://api.deezer.com/search?q=track:'#{track}'%album:'#{album}'%artist:'#{artist}'"
		#"https://api.deezer.com/search?q=track:'#{track}'"# album:'#{album}' artist:'#{artist}'"
		)
	end


end
