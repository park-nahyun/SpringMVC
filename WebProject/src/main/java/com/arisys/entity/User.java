package com.arisys.entity;

public class User {
    private Long id;
    private String username;
    private String email;

    // 기본 생성자
    public User() {
    }

    // 모든 필드를 초기화하는 생성자
    public User(Long id, String username, String email) {
        this.id = id;
        this.username = username;
        this.email = email;
    }

    // Getters와 Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // toString 메서드 (디버깅 및 로깅 용도)
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
