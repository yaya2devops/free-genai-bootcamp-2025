# Chinese Teaching System Test Documentation

## 1. Sentence Complexity Test Cases

### 1.1 Simple Sentences
```xml
<test-cases>
    <case id="simple-1">
        <english>I eat bread.</english>
        <vocabulary>
            <word>
                <characters>吃</characters>
                <pinyin>chī</pinyin>
                <english>eat</english>
            </word>
            <word>
                <characters>面包</characters>
                <pinyin>miànbāo</pinyin>
                <english>bread</english>
            </word>
        </vocabulary>
        <structure>[Subject] [Verb] [Object]</structure>
        <considerations>
            - Basic sentence structure
            - Measure words for nouns
            - Subject can be omitted
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
                <characters>吃</characters>
                <pinyin>chī</pinyin>
                <english>eat</english>
            </word>
            <word>
                <characters>面包</characters>
                <pinyin>miànbāo</pinyin>
                <english>bread</english>
            </word>
            <word>
                <characters>喝</characters>
                <pinyin>hē</pinyin>
                <english>drink</english>
            </word>
            <word>
                <characters>水</characters>
                <pinyin>shuǐ</pinyin>
                <english>water</english>
            </word>
        </vocabulary>
        <structure>[Subject] [Verb1] [Object1], [Verb2] [Object2]</structure>
        <considerations>
            - Multiple actions
            - Conjunction usage
            - Subject sharing
        </considerations>
    </case>
</test-cases>

## 2. Vocabulary Edge Cases

### 2.1 Measure Words
```xml
<vocabulary-test>
    <word>
        <characters>本</characters>
        <pinyin>běn</pinyin>
        <usage>books, magazines</usage>
        <test-sentences>
            <sentence>I have three books.</sentence>
            <sentence>This is a magazine.</sentence>
        </test-sentences>
    </word>
</vocabulary-test>

### 2.2 Tone Changes
```xml
<vocabulary-test>
    <word>
        <characters>不</characters>
        <pinyin>bù/bú</pinyin>
        <usage>negation</usage>
        <tone-rules>
            - Changes to bú before 4th tone
            - Remains bù elsewhere
        </tone-rules>
    </word>
</vocabulary-test>

## 3. Character Writing Tests

### 3.1 Stroke Order
```xml
<writing-test>
    <character>
        <hanzi>我</hanzi>
        <stroke-count>7</stroke-count>
        <components>
            - Hand radical
            - Weapon component
        </components>
        <common-mistakes>
            - Wrong stroke order
            - Missing hook
        </common-mistakes>
    </character>
</writing-test>

## 4. Tone Pattern Tests

### 4.1 Tone Combinations
```xml
<tone-test>
    <pattern>
        <word>中国</word>
        <pinyin>zhōng guó</pinyin>
        <pattern>1-2</pattern>
        <common-errors>
            - First tone unstable
            - Second tone too high
        </common-errors>
    </pattern>
</tone-test>

## 5. Grammar Point Tests

### 5.1 Particle Usage
```xml
<grammar-test>
    <particle>了</particle>
    <pinyin>le</pinyin>
    <functions>
        - Completion
        - Change of state
    </functions>
    <test-cases>
        <case>
            <english>I ate.</english>
            <chinese>我吃了。</chinese>
            <focus>Completion marker</focus>
        </case>
    </test-cases>
</grammar-test>

## 6. Cultural Integration Tests

### 6.1 Numbers and Luck
```xml
<cultural-test>
    <concept>
        <topic>Lucky numbers</topic>
        <examples>
            - 八 (8) lucky
            - 四 (4) unlucky
        </examples>
        <application>
            - Phone numbers
            - Prices
            - Floor numbers
        </application>
    </concept>
</cultural-test>

## 7. Version Control

```xml
<version-control>
    <version number="1.0">
        <changes>
            - Initial documentation
            - Basic test cases
            - Character writing tests
            - Tone pattern tests
        </changes>
        <date>2025-02-09</date>
    </version>
    <planned-improvements>
        - Add more measure word cases
        - Expand tone change patterns
        - Include regional variations
        - Add idiomatic expressions
    </planned-improvements>
</version-control>
```