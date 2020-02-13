#  My notes. 


1. Previouse VC doesn't know anything about next Vc and next VC's properties. Only `Coordanator` knows. So current VC just passes minimum required info (usually user choice) into _next new coordinator_ via delegate method params and then reused and passed into `Coordinator -> init(withParams)`

2. `Coordinator -> start()` method for (optional): 

        * creation VC, 
        * set data (for datasource) into VC, 
        * title, additional properties
        * assigning self as delegate of next VC if need (in this case)
        * performing navigation
        
        
3. `Coordinator -> init(withParams)` All info that current VC can generate **can't** be passed directily from one VC to another, but **can** be generated in the initialization of specific coordinator

4. With this approach VC really can be reused and shouldn't have to worry about (or to calculate) which specific resuing case is considered as current now. It is responsibility of specific `Coordinator`. Seems like Coordinator class can/should be with unique/specific implementation (and of cause name) in order to provide specific stuff for reused VC. If we need need futher navigation in reused VC we can add more specific methods in protocol of this VC (`KanjiListViewControllerDelegate` in our example of reused VC)

5. Previouse coordinator should keep strong reference to next coordinator if next coordinator after performing navigation actions can be used as delegate of VC (that was created in `start()` of next).  But in case of strong ref this Coordination is alive even if his VC was popped, until this property (property to child coordinator) will be reassigned. You are welcome to think about new method in delegate of VC for pop event to cleanup resources

6. Also in case if `Coordinator` keeps strong reference to a new VC this VC will live untill coordinator is reassigned. So I commented this reference  in `AllKanjiListCoordinator` and `KanjiDetailCoordinator`

7. I'd recommend to review all stuff about references between Coordinator parent / Coordinator child / VC. See another branch `MemoryManagement` 




## MemoryManagement

### Suggestion #1: Cleanup via additional pop-method in every VC protocol (for example `CoordinatedVC`)
Downsides. Too knotted that can leads to issues:
1. Every VC must have action from backbutton
2. Add method willBePopped to all VCs’ protocols and use it to notify related Coordinator if back pressed
3. Coord should know his parent (!?!) 
4. Coord should purge itself from parent’s property


### Suggestion #2 **MY CHOISE**: Hold strong ref to Coordinator in VC that is introduced by this Coordinator. So since VC will be released by navigation stack - coordinator will be released too. 
1. Every VC should adopt Protocol `CoordinatedVC` with one strong property ‘coordinator’
2. When coordinator creates VC it should assign itself to property ‘coordinator’ in VC. 
Then ARC do all work for you.  Bingo!
