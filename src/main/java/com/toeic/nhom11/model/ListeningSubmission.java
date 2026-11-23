package com.toeic.nhom11.model;

import java.util.Map;

/** User-selected option IDs keyed by question ID (no correct answers supplied by client). */
public record ListeningSubmission(Map<String, Long> answers) {}
