package com.urblee.urblee_backend.place;

import com.urblee.urblee_backend.user.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/places")
@RequiredArgsConstructor
public class PlaceController {

    private final PlaceService placeService;

    @PostMapping
    public Place addPlace(
            @RequestBody PlaceRequest request,
            @AuthenticationPrincipal User user
    ) {
        System.out.println("ADD PLACE HIT");
        return placeService.createPlace(request, user);
    }
}
