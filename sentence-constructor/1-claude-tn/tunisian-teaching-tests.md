# Tunisian Arabic Teaching System Test Documentation

## 1. Sentence Complexity Test Cases

### 1.1 Simple Sentences
```xml
<test-cases>
    <case id="simple-1">
        <english>I eat bread.</english>
        <vocabulary>
            <word>
                <tunisian>ناكل</tunisian>
                <phonetic>nekel</phonetic>
                <english>eat</english>
            </word>
            <word>
                <tunisian>خبز</tunisian>
                <phonetic>khobz</phonetic>
                <english>bread</english>
            </word>
        </vocabulary>
        <structure>[Subject] [Object] [Verb]</structure>
        <considerations>
            - Basic sentence structure
            - Present tense conjugation
            - Subject can be included in verb
        </considerations>
    </case>
    <case id="simple-2">
        <english>The house is big.</english>
        <vocabulary>
            <word>
                <tunisian>دار</tunisian>
                <phonetic>dar</phonetic>
                <english>house</english>
            </word>
            <word>
                <tunisian>كبير</tunisian>
                <phonetic>kbir</phonetic>
                <english>big</english>
            </word>
        </vocabulary>
        <structure>[Subject] [Adjective]</structure>
        <considerations>
            - Simple descriptor sentence
            - Adjective agreement
            - No verb needed
        </considerations>
    </case>
</test-cases>

### 1.2 Compound Sentences
```xml
<test-cases>
    <case id="compound-1">
        <english>I eat bread and drink water.</english>
        <vocabulary>
            <word>
                <tunisian>ناكل</tunisian>
                <phonetic>nekel</phonetic>
                <english>eat</english>
            </word>
            <word>
                <tunisian>خبز</tunisian>
                <phonetic>khobz</phonetic>
                <english>bread</english>
            </word>
            <word>
                <tunisian>نشرب</tunisian>
                <phonetic>noshrob</phonetic>
                <english>drink</english>
            </word>
            <word>
                <tunisian>ماء</tunisian>
                <phonetic>me</phonetic>
                <english>water</english>
            </word>
        </vocabulary>
        <structure>[Verb1] [Object1] [Connector] [Verb2] [Object2]</structure>
        <considerations>
            - Compound actions
            - Verb conjugation
            - Conjunction use
        </considerations>
    </case>
</test-cases>

### 1.3 Complex Sentences
```xml
<test-cases>
    <case id="complex-1">
        <english>Because it's hot, I drink water.</english>
        <vocabulary>
            <word>
                <tunisian>سخون</tunisian>
                <phonetic>skhoun</phonetic>
                <english>hot</english>
            </word>
            <word>
                <tunisian>نشرب</tunisian>
                <phonetic>noshrob</phonetic>
                <english>drink</english>
            </word>
            <word>
                <tunisian>ماء</tunisian>
                <phonetic>me</phonetic>
                <english>water</english>
            </word>
        </vocabulary>
        <structure>[Reason] [Subject] [Verb] [Object]</structure>
        <considerations>
            - Cause and effect
            - Weather expressions
            - Connector words
        </considerations>
    </case>
</test-cases>

## 2. Vocabulary Edge Cases

### 2.1 French-Arabic Mixed Usage
```xml
<vocabulary-test>
    <word>
        <tunisian>تران</tunisian>
        <phonetic>tran</phonetic>
        <french>train</french>
        <english>train</english>
        <test-sentences>
            <sentence>The train is late.</sentence>
            <sentence>I take the train.</sentence>
        </test-sentences>
    </word>
</vocabulary-test>

### 2.2 Regional Variations
```xml
<vocabulary-test>
    <word>
        <standard>
            <tunisian>برشا</tunisian>
            <phonetic>barsha</phonetic>
            <english>many/a lot</english>
        </standard>
        <regional>
            <tunisian>ياسر</tunisian>
            <phonetic>yaser</phonetic>
            <english>many/a lot</english>
        </regional>
        <test-sentences>
            <sentence>There are many people.</sentence>
            <sentence>I have a lot of work.</sentence>
        </test-sentences>
    </word>
</vocabulary-test>

## 3. State Transition Tests

### 3.1 Valid Transitions
```xml
<transition-test>
    <scenario id="setup-to-attempt">
        <initial-state>Setup</initial-state>
        <input>ناكل خبز</input>
        <expected-state>Attempt</expected-state>
        <validation>
            - Input contains Arabic text
            - Uses vocabulary from setup
            - Basic sentence structure
        </validation>
    </scenario>
</transition-test>

## 4. Teaching Scenario Tests

### 4.1 Common Mistakes
```xml
<teaching-test>
    <scenario id="possession-mistake">
        <student-attempt>عندي الكتاب</student-attempt>
        <error>Incorrect possession structure</error>
        <expected-guidance>
            - Note attempt
            - Guide on possession
            - Encourage revision
        </expected-guidance>
    </scenario>
</teaching-test>

## 5. Validation Criteria

### 5.1 Response Scoring
```xml
<scoring-criteria>
    <category name="vocabulary-table">
        <criteria>
            - Arabic script present (2 points)
            - Phonetic transcription (2 points)
            - Base forms only (2 points)
            - Appropriate difficulty (2 points)
            - Regional context (2 points)
        </criteria>
    </category>
    <category name="sentence-structure">
        <criteria>
            - Clear format (2 points)
            - No conjugations shown (2 points)
            - Level appropriate (2 points)
            - Pattern matching (2 points)
            - Cultural context (2 points)
        </criteria>
    </category>
</scoring-criteria>

## 6. Cultural Integration Tests

### 6.1 Cultural References
```xml
<cultural-test>
    <scenario id="greetings">
        <context>Morning greeting</context>
        <formal>
            <tunisian>صباح الخير</tunisian>
            <phonetic>sba7 el-kheir</phonetic>
        </formal>
        <informal>
            <tunisian>صباحو</tunisian>
            <phonetic>sba7o</phonetic>
        </informal>
        <considerations>
            - Time of day
            - Social status
            - Regional usage
        </considerations>
    </scenario>
</cultural-test>

## 7. Version Control

```xml
<version-control>
    <version number="1.0">
        <changes>
            - Initial documentation
            - Basic test cases
            - Cultural contexts
        </changes>
        <date>2025-02-09</date>
    </version>
    <planned-improvements>
        - Add dialectal variations
        - Expand French influence cases
        - Include social context tests
        - Add regional expressions
    </planned-improvements>
</version-control>
```