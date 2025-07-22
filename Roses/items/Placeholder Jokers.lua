SMODS.Atlas{
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'placeholderrose',
    rarity = 2,
    blueprint_compat = false,
    cost = 5,
    loc_txt = {
        name = 'Placeholder Rose',
        text = {
            'This is a placeholder for the first Rose.',
            '{X:mult,C:white}X#1#{} Mult',
        },
    },
    atlas = 'Jokers',
    pos = {x = 0, y = 0},
config = { extra = {
    Xmult = 10
}
},
loc_vars = function(self,info_queue,center)
    return {vars = {center.ability.extra.Xmult}}
end,
calculate = function(self,card,context)
    if context.joker_main then
        return {
            card = card,
            Xmult_mod = card.ability.extra.Xmult,
            message = 'X' .. card.ability.extra.Xmult,
            color = {1, 1, 1}
        }
    end
    end
}

SMODS.Joker{
    key = 'placeholderseed',
    rarity = 1,
    blueprint_compat = false,
    cost = 3,
    loc_txt = {
        name = 'Placeholder Seed',
        text = {
            'Placeholder for a seed.',
            'After 1 rounds, create a random Placeholder Rose.',
            '(Must Have Room)'
        }
    },
    atlas = 'Jokers',
    pos = {x = 1, y = 0},
    config = { extra = { rounds_completed = 0, rounds_til_growth = 1 } },
    calculate = function(self, card, context)
    if context.end_of_round and context.main_eval then
        if card.ability.extra.rounds_completed < card.ability.extra.rounds_til_growth then
            card.ability.extra.rounds_completed = card.ability.extra.rounds_completed + 1
        end
        if card.ability.extra.rounds_completed >= card.ability.extra.rounds_til_growth and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            card.ability.extra.rounds_completed = 0
            local possible_jokers = {"j_rose_placeholderrose", "j_rose_placeholderrose2"} -- add more keys as needed
            local random_key = pseudorandom_element(possible_jokers, "seed")
            SMODS.add_card({key = random_key})
        end
    end
end
}

SMODS.Joker{
    key = 'placeholderrose2',
    rarity = 2,
    blueprint_compat = false,
    cost = 4,
    loc_txt = {
        name = 'Placeholder Rose 2: Electric Boogaloo',
        text = {
            'This is a placeholder for the second Rose.',
            '{X:chips,C:white}X#1#{} Chips',
        },
    },
    atlas = 'Jokers',
    pos = {x = 2, y = 0},
    config = {extra = {
        Xchips = 10
    }
    },
    loc_vars = function(self,info_queue,center)
    return {vars = {center.ability.extra.Xchips}}
end,
calculate = function(self,card,context)
    if context.joker_main then
        return {
            card = card,
            Xchip_mod = card.ability.extra.Xchips,
            message = 'X' .. card.ability.extra.Xchips,
            color = {1, 1, 1}
        }
    end
    end
}

SMODS.Joker{
    key = 'placeholderrose3',
    rarity = 3,
    blueprint_compat = false,
    cost = 8,
    loc_txt = {
        name = 'Placeholder Rose 3',
        text = {
            'Placeholder Text',
            '{X:mult,C:white}^#1#{} Mult',
            '{X:chips,C:white}^#2#{} Chips',
        }
    },
    config = { extra = {
        emult = 2,
        echips = 2,
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.emult, center.ability.extra.echips}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                echips = card.ability.extra.echips,
                emult = card.ability.extra.emult,
                color = {1, 1, 1},
            }
        end
    end
}

SMODS.Joker{
    key = 'sanguine',
    rarity = 3,
    blueprint_compat = false,
    cost = 6,
    loc_txt = {
        name = 'Sanguine Rose',
        text = {
            'A Rose that thrives on the harm of its owner.',
            '{X:mult,C:white}X#1#{} Mult',
            'BUT {X:chips,C:white}/#2#{} Chips...'
        }
    },
    config = { extra = {
        Xmult = 100,
        Xchips = 2,
    }},
    loc_vars = function (self,info_queue,center)
            return {vars = {center.ability.extra.Xmult, center.ability.extra.Xchips}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                Xmult = card.ability.extra.Xmult,
                xchips = 0.5,
                color = {1, 1, 1}
            }
        end
    end
}