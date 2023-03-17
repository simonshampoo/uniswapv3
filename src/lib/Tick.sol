pragma solidity ^0.8.14; 

library Tick {
    struct Info {
        bool initalized; 
        uint128 liquidity;
    }

    function update(
        mapping(int24 => Tick.Info) storage self, 
        int24 tick, 
        uint128 liquidityDelta
    ) internal {
        Tick.Info storage tickInfo = self[tick]; 
        uint128 liquidityBefore = tickInfo.liquidity;
        uint128 liquidityAfter = liquidityBefore + liquidityDelta;
        if (liquidityBefore == 0) {
            tickInfo.initalized = true; 
        }

        tickInfo.liquidity = liquidityAfter; 
    }
}