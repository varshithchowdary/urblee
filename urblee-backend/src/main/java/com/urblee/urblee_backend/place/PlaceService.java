package com.urblee.urblee_backend.place;

import com.urblee.urblee_backend.user.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PlaceService {

    private final PlaceRepository placeRepository;

    public Place createPlace(PlaceRequest request, User user) {

        Place place = new Place();
        place.setName(request.getName());
        place.setVisibility(request.getVisibility());
        place.setOwner(user);

        return placeRepository.save(place);
    }
}
