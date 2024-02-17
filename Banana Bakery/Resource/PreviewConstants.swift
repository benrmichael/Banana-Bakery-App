//
//  PreviewConstants.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/14/24.
//

import Foundation

struct PreviewConstants {
    static var recipe: FolderRecipeDto = FolderRecipeDto(
        id: 3,
        name: "Sticky Toffee Banana Bundt Cake",
        instructions: [RecipeSection(section: "Banana Bundt Cake",
            items: ["Preheat the oven to 325F and prep a 10 or 12 cup bundt pan. Rub the entire inside with softened butter (making sure to get into all the nooks and crannies) and completely coat with granulated sugar. Set aside.",
                "In a medium bowl, whisk together the flour, cinnamon, baking soda, baking powder, and salt. Set aside.",
                "In a large mixing bowl, whisk together the sugars and oil, followed by the sour cream, Natural SunButter, eggs, and vanilla.",
                "Once combined, whisk in the banana.",
                    "Add in the dry ingredients and whisk until smooth.",
                "Pour the batter into the prepared bundt pan and bake for 1 hour or until a toothpick comes out clean."])],
        ingredients: [RecipeSection(section: "Banana Bundt Cake", 
                        items: ["1 1/2 cups (380g) mashed ripe banana (3–4 medium bananas)",
                                "1 cup (200g) light brown sugar, packed",
                                "1/2 cup (100g) granulated sugar",
                                "1/2 cup (108g) vegetable oil",
                                "1/2 cup (120g) sour cream",
                                "1/2 cup (125g) Natural SunButter",
                                "3 large eggs, room temp",
                                "2 tsp vanilla extract",
                                "2 cups (265g) all purpose flour (GF also works)",
                                "2 tsp ground cinnamon",
                                "1 tsp baking soda",
                                "1 tsp baking powder",
                                "1/2 tsp kosher salt",
                                "Softened butter + 1/4 cup sugar for coating the pan"])],
        imageUrl: "https://butternutbakeryblog.com/wp-content/uploads/2022/11/sticky-toffee-banana-bundt-cake-500x700.jpg",
        bakery: "Butter Nut Bakery",
        category: "Cakes",
        folderID: 3,
        username: "Admin"
    )
    
    static var folder: FolderDto = FolderDto(id: 3, name: "Bundt Cakes", recipes: [recipe])
}
