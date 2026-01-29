package com.urblee.urblee_backend.place;
import com.urblee.urblee_backend.user.User;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Place {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private Double visibility;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User owner;
}
