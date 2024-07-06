
# Marvel Discovery

A SwiftUI app for tvOS to allow you to go deeper into the Marvel Universe.  
Discover New Characters and Comics to find your next read from your TV

## To Run
1) Marvel Developer API keys are required to run this sample code (https://developer.marvel.com/)
2) Insert both your Public and Private Keys in the APIInformation.swift file (variables publicKey/privateKey)

## Implementation Details
- Code written using Swift / SwiftUI / Combine
- View Models using Combine and Small Service Layer (MarvelDataFetching) is using async/await to run the urlRequests and publishing data
- There are Previews enabled using Mock Services (json from bundle).  This helps iteration on the SwiftUI pieces
- Injectable API layer and scheduler parameter allow unit tests to executed on view models

## Optimize this for a real app
- Paging of the API responses.   The current services will only provide the first 20 values and I'm okay with that for initial iteration.
- See the serialized responses for total, offset, limit, and count.  We'd need to fetch next pages.
- Optimizing the UX.  I didn't spend much time futzing about here
- Handle the API Errors.   The View Model is testing that it stops loading and has data but doesn't report back any meaningful information to the user
