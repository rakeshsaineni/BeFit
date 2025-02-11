import SwiftUI

// MARK: - Main App View
struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeDashboardView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                WorkoutsView()
                    .tabItem {
                        Image(systemName: "figure.run")
                        Text("Workouts")
                    }
                
                NutritionView()
                    .tabItem {
                        Image(systemName: "leaf.fill")
                        Text("Nutrition")
                    }
                
                ActivityTrackingView()
                    .tabItem {
                        Image(systemName: "chart.bar.fill")
                        Text("Activity")
                    }
                
                CommunityView()
                    .tabItem {
                        Image(systemName: "person.3.fill")
                        Text("Community")
                    }
            }
            .accentColor(.calmTeal)
        }
    }
}

// MARK: - Home Dashboard View
struct HomeDashboardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Welcome Header
                HStack {
                    Text("Welcome to BetaFitness")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                }
                
                // Daily Planner & Activity Log
                VStack(alignment: .leading, spacing: 12) {
                    Text("Today's Overview")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    HStack {
                        ProgressCard(title: "Workouts", value: "2/3", icon: "figure.walk", color: .calmTeal)
                        ProgressCard(title: "Meals", value: "3/4", icon: "leaf.fill", color: .softBlue)
                    }
                    
                    HStack {
                        ProgressCard(title: "Hydration", value: "2.0L", icon: "drop.fill", color: .blue)
                        ProgressCard(title: "Supplements", value: "1/2", icon: "pills.fill", color: .orange)
                    }
                }
                .padding(.horizontal)
                
                // AI Insights
                VStack(alignment: .leading, spacing: 12) {
                    Text("AI Insights & Recommendations")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Your strength training is improving! Consider increasing your weights by 5% next week.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationTitle("Dashboard")
    }
}

// MARK: - Activity Tracking View
struct ActivityTrackingView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // XP Progression
                VStack(alignment: .leading, spacing: 12) {
                    Text("XP Progression")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ProgressCard(title: "XP", value: "1500/2000", icon: "star.fill", color: .yellow)
                }
                .padding(.horizontal)
                
                // Fitness Streaks & Challenges
                VStack(alignment: .leading, spacing: 12) {
                    Text("Streaks & Challenges")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    HStack {
                        ProgressCard(title: "Streak", value: "5 days", icon: "flame.fill", color: .red)
                        ProgressCard(title: "Challenges", value: "2/3", icon: "flag.fill", color: .green)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationTitle("Activity")
    }
}

// MARK: - Community View
struct CommunityView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Personal Fitness Feed
                VStack(alignment: .leading, spacing: 12) {
                    Text("Fitness Feed")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(0..<5) { _ in
                        FitnessFeedCard()
                    }
                }
                .padding(.horizontal)
                
                // Group Challenges
                VStack(alignment: .leading, spacing: 12) {
                    Text("Group Challenges")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(0..<3) { _ in
                        GroupChallengeCard()
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationTitle("Community")
    }
}

// MARK: - Supporting Views
struct ProgressCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 10)
        )
    }
}

struct FitnessFeedCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Alex completed a 5K run!")
                .font(.headline)
            Text("Great job on maintaining a steady pace throughout the run.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 10)
        )
    }
}

struct GroupChallengeCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Join the 30-Day Yoga Challenge")
                .font(.headline)
            Text("Improve your flexibility and mindfulness with daily yoga sessions.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 10)
        )
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: - Workouts View
struct WorkoutsView: View {
    @State private var selectedCategory = 0
    @State private var showWorkoutDetail = false
    @State private var selectedWorkout: Workout?
    @State private var isAnimating = false
    
    let categories = ["Strength", "Cardio", "Yoga", "Pilates", "Fusion"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Categories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0..<categories.count, id: \.self) { index in
                                CategoryButton(
                                    title: categories[index],
                                    isSelected: selectedCategory == index
                                ) {
                                    withAnimation(.spring()) {
                                        selectedCategory = index
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Workouts Grid
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                        ForEach(Workout.sampleWorkouts) { workout in
                            WorkoutCardView(workout: workout)
                                .onTapGesture {
                                    selectedWorkout = workout
                                    showWorkoutDetail = true
                                }
                                .opacity(isAnimating ? 1 : 0)
                                .offset(y: isAnimating ? 0 : 50)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Workouts")
            .sheet(isPresented: $showWorkoutDetail) {
                if let workout = selectedWorkout {
                    WorkoutDetailView(workout: workout)
                }
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    isAnimating = true
                }
            }
        }
    }
}

// MARK: - Nutrition View
struct NutritionView: View {
    @State private var waterIntake: Double = 1.5
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Macro Progress
                    MacroProgressView()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : 30)
                    
                    // Water Intake
                    WaterIntakeView(intake: $waterIntake)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : 30)
                    
                    // Meal Tracking
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Today's Meals")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        ForEach(MealTime.allCases, id: \.self) { mealTime in
                            MealCardView(mealTime: mealTime)
                                .opacity(isAnimating ? 1 : 0)
                                .offset(y: isAnimating ? 0 : 30)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Nutrition")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { /* Show food logger */ }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.calmTeal)
                    }
                }
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.7)) {
                    isAnimating = true
                }
            }
        }
    }
}




// MARK: - Supporting Views
struct DailyPlannerView: View {
    var body: some View {
        Text("Daily Planner")
            .navigationTitle("Daily Planner")
    }
}

struct WorkoutCategoriesView: View {
    var body: some View {
        Text("Workout Categories")
            .navigationTitle("Workout Categories")
    }
}

struct WorkoutLogView: View {
    var body: some View {
        Text("Workout Log")
            .navigationTitle("Workout Log")
    }
}

struct MealPlannerView: View {
    var body: some View {
        Text("Meal Planner")
            .navigationTitle("Meal Planner")
    }
}

struct FoodLogView: View {
    var body: some View {
        Text("Food Log")
            .navigationTitle("Food Log")
    }
}

struct FitnessFeedView: View {
    var body: some View {
        Text("Fitness Feed")
            .navigationTitle("Fitness Feed")
    }
}


// MARK: - Sample Data and Supporting Models
struct Workout: Identifiable {
    let id = UUID()
    let name: String
    let duration: String
    let difficulty: String
    let calories: Int
    let category: String
    
    static var sampleWorkouts: [Workout] {
        [
            Workout(name: "Full Body Strength", duration: "45 min", difficulty: "Intermediate", calories: 320, category: "Strength"),
            Workout(name: "HIIT Cardio", duration: "30 min", difficulty: "Advanced", calories: 400, category: "Cardio"),
            Workout(name: "Morning Flow", duration: "20 min", difficulty: "Beginner", calories: 150, category: "Yoga")
        ]
    }
}

enum MealTime: String, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snacks = "Snacks"
}

// MARK: - UI Components
struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isSelected ? Color.calmTeal : Color.gray.opacity(0.1))
                )
                .foregroundColor(isSelected ? .white : .primary)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct WorkoutCardView: View {
    let workout: Workout
    @State private var isHovered = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(workout.name)
                        .font(.headline)
                    Text(workout.duration)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text("\(workout.calories) cal")
                    .font(.subheadline)
                    .foregroundColor(.calmTeal)
            }
            
            HStack {
                Text(workout.difficulty)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Color.softBlue.opacity(0.2))
                    )
                    .foregroundColor(.softBlue)
                
                Spacer()
                
                Image(systemName: "play.circle.fill")
                    .foregroundColor(.calmTeal)
                    .font(.title2)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 10)
        )
        .scaleEffect(isHovered ? 1.02 : 1)
        .animation(.spring(response: 0.3), value: isHovered)
        .onTapGesture {
            withAnimation(.spring()) {
                isHovered.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isHovered = false
            }
        }
    }
}

struct MacroProgressView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Macros")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack(spacing: 20) {
                MacroRing(title: "Protein", progress: 0.7, color: .blue)
                MacroRing(title: "Carbs", progress: 0.5, color: .green)
                MacroRing(title: "Fats", progress: 0.3, color: .orange)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 10)
        )
        .padding(.horizontal)
    }
}

struct MacroRing: View {
    let title: String
    let progress: Double
    let color: Color
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(color.opacity(0.2), lineWidth: 8)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(color, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 1), value: progress)
            }
            .frame(width: 60, height: 60)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct WaterIntakeView: View {
    @Binding var intake: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Water Intake")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                Image(systemName: "drop.fill")
                    .foregroundColor(.blue)
                Text("\(intake, specifier: "%.1f")L / 3.0L")
                    .font(.subheadline)
            }
            
            Slider(value: $intake, in: 0...3)
                .accentColor(.blue)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 10)
        )
        .padding(.horizontal)
    }
}

struct MealCardView: View {
    let mealTime: MealTime
    @State private var isExpanded = false
    
    var mealItems: [FoodItem] {
        switch mealTime {
        case .breakfast:
            return [
                FoodItem(name: "Oatmeal", calories: 150, protein: 6, carbs: 27, fats: 3),
                FoodItem(name: "Banana", calories: 105, protein: 1.3, carbs: 27, fats: 0.3)
            ]
        case .lunch:
            return [
                FoodItem(name: "Chicken Salad", calories: 350, protein: 25, carbs: 15, fats: 12)
            ]
        default:
            return []
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mealTime.rawValue)
                        .font(.headline)
                    
                    let totalCalories = mealItems.reduce(0) { $0 + $1.calories }
                    Text("\(Int(totalCalories)) calories")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: { withAnimation { isExpanded.toggle() } }) {
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundColor(.secondary)
                }
            }
            
            if isExpanded {
                VStack(spacing: 8) {
                    ForEach(mealItems) { food in
                        HStack {
                            Text(food.name)
                                .font(.subheadline)
                            Spacer()
                            Text("\(Int(food.calories)) cal")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Food")
                        }
                        .font(.subheadline)
                        .foregroundColor(.calmTeal)
                    }
                    .padding(.top, 4)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 10)
        )
    }
}

struct WorkoutDetailView: View {
    let workout: Workout
    
    var body: some View {
        VStack {
            Text(workout.name)
                .font(.largeTitle)
                .padding()
            
            // Workout details...
            
            Spacer()
        }
        .navigationTitle(workout.name)
    }
}

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let calories: Double
    let protein: Double
    let carbs: Double
    let fats: Double
}

